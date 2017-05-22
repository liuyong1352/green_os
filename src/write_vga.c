#define  COL8_000000  0
#define  COL8_FF0000  1
#define  COL8_00FF00  2
#define  COL8_FFFF00  3
#define  COL8_0000FF  4
#define  COL8_FF00FF  5
#define  COL8_00FFFF  6
#define  COL8_FFFFFF  7
#define  COL8_C6C6C6  8
#define  COL8_840000  9
#define  COL8_008400  10
#define  COL8_848400  11
#define  COL8_000084  12
#define  COL8_840084  13
#define  COL8_008484  14
#define  COL8_848484  15

#define asm_cli 	__asm__ ("cli")
#define asm_sti		__asm__ ("sti")
#define asm_stihlt 	__asm__ ("sti;hlt")


#define PORT_KEYDAT 0x60 

typedef unsigned char uchar ;

void init_palette(void);
void outb_p(int port , int data);
unsigned char inb_p(int port);
int io_load_eflags(void);
void io_store_eflags(int eflags);
void boxfill8( unsigned char c, int x0, int y0,int x1, int y1);
void putfont( unsigned char c, int x, int y , char* fp) ; 
void drawFont( unsigned char c , int x , int y  , char f);
void showString(uchar c , int x , int y , char* s) ;
void init_mouse(char* mouse , char bc) ;
void putblock(int px , int py , char *buf);
//void intHandlerFromC(char *esp);
void hex(char c , char* buf) ; 

extern char systemFont[4096] ;
char* vram = (char*)0xa0000 ; 
int xsize  = 320 ;
int ysize  = 200 ; 

//cursor
static char _cursor[16 * 16] ; 

struct KEYBUF {
	unsigned char data , flag  ; 
};

static struct KEYBUF keybuf ; 

void cmian(void){
	
	init_palette();

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
	init_mouse( _cursor, COL8_008484) ;	
	putblock(20 , 20 , _cursor);
	int pos = 0 ; 
	for(;;) {
		asm_cli ; 
		if(keybuf.flag) {
			char i = keybuf.data ; 
			keybuf.flag = 0 ;
			asm_sti ;
			char buf[3] = {0} ; 
			toHex(i , buf) ; 
			showString(COL8_000000 , pos , 0 , buf) ; 
			pos += 16 ; 			
		} else {
			asm_stihlt ;
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


void intHandlerFromC(int *esp){
	outb_p(0x20 , 0x61 ); //通知PIC IRQ-01已经受理完毕
	unsigned char data = inb_p(PORT_KEYDAT); //必须从0x60把数据读出来 ， 才会触发 下轮
	if(keybuf.flag) 
		return ;
	
	keybuf.data = data ;
	keybuf.flag = 1 ; 
}
