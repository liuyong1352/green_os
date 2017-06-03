#include "write_vga.h"
#include "mm.h"

typedef unsigned char uchar ;

void init_palette(void);
void outb_p(int port , int data);
unsigned char inb_p(int port);
int io_load_eflags(void);
void io_store_eflags(int eflags);
void boxfill8( unsigned char c, int x0, int y0,int x1, int y1);
void putfont( unsigned char c, int x, int y , char* fp) ; 
void init_mouse(char* mouse , char bc) ;
void putblock(int px , int py , char *buf);
void toHex(char c , char* buf) ; 

struct FIFO {
	unsigned char* buf ;
	int p , q , free ,size , flags ; 
};

static struct FIFO keyfifo = {0};
static struct FIFO mousefifo = {0} ; 

int fifo_status(struct FIFO* fifo) ;
void fifo_init(struct FIFO* fifo , int size , unsigned char* buf) ;

int fifo_put(struct FIFO* fifo ,unsigned char data ) ;
int fifo_get(struct FIFO* fifo );

extern char systemFont[4096] ;
char* vram = (char*)0xa0000 ; 
int xsize  = 320 ;
int ysize  = 200 ; 

static char _cursor[16 * 16] ; 
extern unsigned int smap_size ; 
 
static int printd_x = 0 , printd_y = 0 ;

void toHex(char c , char* buf) {
     char* _t = "0123456789ABCDEF" ;
     *(buf + 0) = _t[(c >> 4)&0x0F];
     *(buf + 1) = _t[c&0x0F];
}

//void cmian(void){
void cmain(void){
	
	init_palette();
	
	static char keybuf[32] = {0};
	static char mousebuf[128] = {0} ;  
	fifo_init(&keyfifo , 32 ,keybuf ) ; 
	fifo_init(&mousefifo , 128 , mousebuf) ;   
	
	init_keyboard();
	
	asm_sti ; 
	init_screen() ; 
	init_mouse( _cursor, COL8_008484) ;	
	int mx = xsize / 2 ;
	int my = ysize / 2 ;	
	putblock(mx , my , _cursor);
	enable_mouse();
	struct MOUSE_DEC mdec ; 
	mdec.phase = 0 ;
	struct AddressRangeDes* memAddr = (struct AddressRangeDes*)get_smap_buf();
	int count = 0 ; 	
	for(;;) {
		asm_cli ;
		if(fifo_status(&keyfifo)) {
			char i  = fifo_get(&keyfifo); 
			asm_sti ; 	
			if(i == 0x1C) {
				showMemInfo(memAddr + count++) ;
				count %= smap_size;
			}
		}else if (fifo_status(&mousefifo)){
			char i  = fifo_get(&mousefifo); 
			asm_sti ; 	
			if(mouse_decode(&mdec , i)) {
				boxfill8(COL8_008484,mx , my ,mx + 15 , my + 15) ;
				mx += mdec.x ;
				my += mdec.y ;
				if(mx < 0 ) 
					mx = 0 ;
				if(my < 0 ) 
					my = 0 ;
				if(mx > xsize - 16 )
					mx = xsize -16 ;
				if(my > ysize - 16 ) 
					my = ysize - 16 ;
				putblock(mx , my , _cursor);
 				
				//printx(mdec.buf[0]) ; 
				//printx(mdec.buf[1]) ; 
				//printx(mdec.buf[2]) ; 
			}
		}else {
		 	asm_stihlt ; 
		} 
	}
}

void showMemInfo(struct AddressRangeDes* addr ){
	printd_x = 0 ;
	printd_y = 0 ;
	int x = 0 , y = 0 ;
	boxfill8(COL8_008484, 0 , 0,xsize , 16*5);

	char uf[9] = {0} ; 
	printd("baseAddrLow:");
	int2hex(addr->baseAddrLow, uf) ; 
	printd(uf);
	printd("\nbaseAddrHigh:");
	int2hex(addr->baseAddrHigh, uf) ; 
	printd(uf);
	printd("\nlengthLow:");
	int2hex(addr->lengthLow, uf) ; 
	printd(uf);
	printd("\nlengthHigh:");
	int2hex(addr->lengthHigh, uf) ; 
	printd(uf);
	printd("\ntype:");
	int2hex(addr->type, uf) ; 
	printd(uf);
}

int mouse_decode(struct MOUSE_DEC* mdec , unsigned char dat) {
	unsigned char phase = mdec->phase ; 
	if(phase == 0 ) {
		//等待鼠标的0xfa的阶段
		if(dat == 0xfa ) {
			mdec->phase = 1 ;
		}
		return 0 ;
	}
	if(phase == 1) {
		//等待鼠标第一个字节的阶段 特点必须为00**1*** &  umask(11001000) ==  0000 1000
		//移动范围在0-3 点击部分必须在8-F
		if((dat & 0xc8) == 0x08) {
			//first byte is correct
			mdec->buf[0] = dat ;
			mdec->phase = 2 ;	
		}
		return 0 ; 
	} 
	if(phase == 2) {
		mdec->buf[1] = dat ;
		mdec->phase = 3 ;	
		return 0 ; 
	} 

	if(phase == 3) {
		mdec->buf[2] = dat ;
		mdec->phase = 1 ;	
		mdec->btn   = mdec->buf[0] & 0x07 ; 
		mdec->x	= mdec->buf[1];
		mdec->y	= mdec->buf[2];
		if(mdec->buf[0] & 0x10)
			mdec->x |= 0xffffff00;
		if(mdec->buf[0] & 0x20 )
			mdec->y |= 0xffffff00 ;	
		mdec->y = -mdec->y ; //鼠标的y方向与画面符号相反
		return 1 ; 
	} 

	return -1 ; //基本不可能来这里
}

void printd(char* s){
	
	for( ; *s !='\0' ; s++ ) {
		if(*s == '\n') {
			printd_x = 0 ;
			printd_y += 16 ;
			continue;
		} else {
			drawFont(COL8_000000 , printd_x , printd_y , *s) ; 
		}
		printd_x += 8 ; 
		if(printd_x == 320 ) {
			printd_x = 0 ;
			printd_y += 16 ;
		}		
	} 
}

void printx(char c){
	char buf[3] = {0} ; 
	toHex(c , buf) ;
	printd(buf) ; 	 	
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

void int2hex(unsigned int i , char* buf) {
     char* _t = "0123456789ABCDEF" ;
     unsigned int mask = 0x0F ;
     int pos  = 8 ; 
     do {
         buf[--pos] = _t[ i & mask] ;
         i >>= 4 ; 
    }while(pos) ;
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
	fifo_put(&keyfifo , data) ; 
}

void intHandlerForMouse(int* esp) {
	unsigned char data ;
	outb_p(PIC1_OCW2 , 0x64) ;//通知PIC1 IRQ-12 的受理已完成
	outb_p(PIC0_OCW2 , 0x62) ;//通知PIC0 IRQ_02 的受理已完成
	data = inb_p(PORT_KEYDAT) ;
    fifo_put(&mousefifo , data) ; 
	//char buf[3] = {0} ; 
	//toHex(data , buf) ; 
	//printd(buf) ;
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
