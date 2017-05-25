#include "write_vga.h"

typedef unsigned char uchar ;

void init_palette(void);
void outb_p(int port , int data);
unsigned char inb_p(int port);
int io_load_eflags(void);
void io_store_eflags(int eflags);
void boxfill8( unsigned char c, int x0, int y0,int x1, int y1);
void putfont( unsigned char c, int x, int y , char* fp) ; 
void showString(uchar c , int x , int y , char* s) ;
void init_mouse(char* mouse , char bc) ;
void putblock(int px , int py , char *buf);
void toHex(char c , char* buf) ; 

struct FIFO {
	unsigned char* buf ;
	int p , q , free ,size , flags ; 
};

static struct FIFO* fifo ;

int fifo_status(struct FIFO* fifo) ;
void fifo_init(struct FIFO* fifo , int size , unsigned char* buf) ;

int fifo_put(struct FIFO* fifo ,unsigned char data ) ;
int fifo_get(struct FIFO* fifo );

extern char systemFont[4096] ;
char* vram = (char*)0xa0000 ; 
int xsize  = 320 ;
int ysize  = 200 ; 

static char _cursor[16 * 16] ; 
 
void cmian(void){
	
	init_palette();
	
	asm_sti ; 
	init_keyboard();
	init_screen() ; 
	init_mouse( _cursor, COL8_008484) ;	
	putblock(20 , 20 , _cursor);
	enable_mouse();
	
	char keybuf[32] ;  
	fifo_init(&fifo , 32 ,keybuf ) ;   
	for(;;) {
		asm_cli ;
		if(fifo_status(&fifo)) {
			char i  = fifo_get(&fifo); 
			asm_sti ; 	
			char buf[3] = {0} ; 
			toHex(i , buf) ; 
			printd(buf) ; 
		} else {
		 	asm_stihlt ; 
		} 
	}
}


void printd(char* s){
	static int printd_x = 0 , printd_y = 0 ;
	
	for( ; *s !='\0' ; s++ ) {
		drawFont(COL8_000000 , printd_x , printd_y , *s) ; 
		printd_x += 8 ; 
		if(printd_x == 320 ) {
			printd_x = 0 ;
			printd_y += 16 ;
		}		
	} 
}

void set_palette(int start , int end , unsigned char* rgb) {
	int i , eflags ;
	eflags = io_load_eflags();
	asm_cli;
	outb_p(0x03c8 , start); //set palette number
	for(i = start ; i <= end ; i++ ) {
		outb_p(0x03c9,rgb[0]/4);
		outb_p(0x03c9,rgb[1]/4);
		outb_p(0x03c9,rgb[2]/4);
		rgb = rgb + 3 ;
	}
	io_store_eflags(eflags);
}

void init_palette(void){
	static  unsigned char table_rgb[16 *3] = {
         0x00,  0x00,  0x00,
         0xff,  0x00,  0x00,
         0x00,  0xff,  0x00,
         0xff,  0xff,  0x00,
         0x00,  0x00,  0xff,
         0xff,  0x00,  0xff,
         0x00,  0xff,  0xff,
         0xff,  0xff,  0xff,
         0xc6,  0xc6,  0xc6,
         0x84,  0x00,  0x00,
         0x00,  0x84,  0x00,
         0x84,  0x84,  0x00,
         0x00,  0x00,  0x84,
         0x84,  0x00,  0x84,
         0x00,  0x84,  0x84,
         0x84,  0x84,  0x84
     };
	set_palette(0 ,15 , table_rgb);

}

void boxfill8( unsigned char c, int x0, int y0, int x1 , int y1){
	int x, y ;
	for(y = y0 ; y <= y1 ; y++ ){
		for(x = x0 ; x <= x1 ; x++){
			vram[y*xsize + x] = c ; 
		}
	}

}

void putfont(unsigned char color ,  int x, int y , char* font){
	//8 * 16
	int i = 0 ; 
	char* p ;	
	for( ; i < 16  ; i ++ ) {
		char c = font[i] ;
		p = vram + (y + i ) *xsize  + x ;
		if(c & 0x80 ) p[0] = color ;
		if(c & 0x40 ) p[1] = color ;
		if(c & 0x20 ) p[2] = color ;
		if(c & 0x10 ) p[3] = color ;
		if(c & 0x08 ) p[4] = color ;
		if(c & 0x04 ) p[5] = color ;
		if(c & 0x02 ) p[6] = color ;
		if(c & 0x01 ) p[7] = color ;
	}
	
}

void drawFont( unsigned char c , int x , int y  , char f){
	putfont( c , x , y , systemFont + f * 16 );   	
}

void showString(uchar color , int x ,int y , char* pf ){
	for(; *pf != '\0' ; pf++ ) {
		drawFont(color , x , y ,*pf);
		x = x + 8 ; 
	}
}

void init_mouse(char* mouse , char bc) {
	static char cursor[16][16] = {
         "**************..",
         "*OOOOOOOOOOO*...",
         "*OOOOOOOOOO*....",
         "*OOOOOOOOO*.....",
         "*OOOOOOOO*......",
         "*OOOOOOO*.......",
         "*OOOOOOO*.......",
         "*OOOOOOOO*......",
         "*OOOO**OOO*.....",
         "*OOO*..*OOO*....",
         "*OO*....*OOO*...",
         "*O*......*OOO*..",
         "**........*OOO*.",
         "*..........*OOO*",
         "............*OO*",
         ".............***"
    };
	for(int y = 0 ; y < 16 ; y++ ){
		for(int x = 0 ; x < 16 ; x++ ){
			if(cursor[y][x] == '*') mouse[y * 16 + x] = COL8_000000 ; 
			if(cursor[y][x] == 'O') mouse[y * 16 + x] = COL8_FFFFFF ; 
			if(cursor[y][x] == '.') mouse[y * 16 + x] = bc ; 
		}
	}

}

void putblock(int px , int py , char *buf) {
	for(int y = 0 ; y < 16  ; y++ ){
		for(int x = 0 ; x < 16 ; x++ ) {
			vram[( y + py )*xsize + x + px ] = buf[y * 16 + x] ; 
		}
	}	

}

void toHex(char c , char* buf) {
     char* _t = "0123456789ABCDEF" ;
     *(buf + 0) = _t[(c >> 4)&0x0F];
     *(buf + 1) = _t[c&0x0F];
}


int fifo_status(struct FIFO* fifo) {
	return fifo->size  - fifo->free  ;
}


void fifo_init(struct FIFO* fifo , int size , unsigned char* buf) {
	
	fifo->size	= size ;
	fifo->buf	= buf ;
	fifo->free	= size ; 
	fifo->flags	= 0;
	fifo->p 	= 0 ;
	fifo->q 	= 0 ; 
}

int fifo_put(struct FIFO* fifo ,unsigned char data ) {
	if(fifo->free == 0 ) {
		fifo->flags |= FLAGS_OVERRUN ; 
		return -1 ;	
	}
	fifo->buf[fifo->p] = data ;
	fifo->p++ ;
	fifo->p %= fifo->size ; 
	fifo->free--;
	return 0 ; 
}

int fifo_get(struct FIFO* fifo ){
	int data ; 
	if(fifo->free == fifo->size) {
		return -1 ;
	}
	data = fifo->buf[fifo->q] ;
	fifo->free++ ;
	fifo->q++ ;
	fifo->q %= fifo->size ; 
	return data ; 
}

void wait_KBC_sendready(){
	for(;;){
		if((inb_p(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY) == 0 ) 
			break ;
	}
}

void init_keyboard(){
	wait_KBC_sendready();
	outb_p(PORT_KEYCMD , KEYCMD_WRITE_MODE);
	wait_KBC_sendready();
	outb_p(PORT_KEYDAT , KBC_MODE);
}

void enable_mouse(){
	wait_KBC_sendready();
	outb_p(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE) ;
	wait_KBC_sendready();
	outb_p(PORT_KEYDAT , MOUSECMD_ENABLE) ; 	
}

void intHandlerFromC(int* esp){
	//outb_p(0x20 , 0x61 ); //通知PIC IRQ-01已经受理完毕 , 我测试 不需要通知也可以 ， 暂时没搞清楚是为什么
	outb_p(0x20 , 0x21 ); //通知PIC IRQ-01已经受理完毕 , 我测试 不需要通知也可以 ， 暂时没搞清楚是为什么
	unsigned char data = inb_p(PORT_KEYDAT); //必须从0x60把数据读出来 ， 才会触发 下轮
	fifo_put(&fifo , data) ; 
}

void intHandlerForMouse(int* esp) {
	unsigned char data ;
	outb_p(PIC1_OCW2 , 0x64) ;//通知PIC1 IRQ-12 的受理已完成
	outb_p(PIC0_OCW2 , 0x62) ;//通知PIC0 IRQ_02 的受理已完成
	data = inb_p(PORT_KEYDAT) ;
	//can test printd
    char buf[3] = {0} ; 
	toHex(data , buf) ; 
	printd(buf) ;
}

void init_screen(){
	boxfill8( COL8_008484, 0, 0, xsize-1, ysize-29);
	boxfill8( COL8_C6C6C6, 0, ysize - 28 , xsize-1, ysize-28);
	boxfill8( COL8_FFFFFF, 0, ysize - 27 , xsize-1, ysize-27);
	boxfill8( COL8_C6C6C6, 0, ysize - 26 , xsize-1, ysize-1);

	boxfill8( COL8_FFFFFF, 3, ysize - 24 , 59, ysize-24);
	boxfill8( COL8_FFFFFF, 2, ysize - 24 , 2, ysize-4);
	boxfill8( COL8_848484, 4, ysize - 4 , 59, ysize-4);
	boxfill8( COL8_848484, 59, ysize - 23 , 59, ysize-5);
	boxfill8( COL8_000000, 2, ysize - 3 , 59, ysize-3);
	boxfill8( COL8_000000, 60, ysize - 24 , 60, ysize-3);
	
	boxfill8( COL8_848484, xsize -47, ysize - 24 , xsize-4, ysize-24);
	boxfill8( COL8_848484, xsize -47, ysize - 23 , xsize-47, ysize-3);
	boxfill8( COL8_FFFFFF, xsize -47, ysize - 3 , xsize-4, ysize-3);
	boxfill8( COL8_FFFFFF, xsize -3, ysize - 24 , xsize-3, ysize-3);
}
