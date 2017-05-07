//gcc -m32 -fno-asynchronous-unwind-tables -s  -c write_vga.c -o write_vga.o
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


void io_hlt();
void init_palette(void);
void io_cli(void);
void io_out8(int port , int data);
int io_load_eflags(void);
void io_store_eflags(int eflags);
void boxfill8(unsigned char *vram,int xsize,  unsigned char c, int x0, int y0,
int x1, int y1);
void putfont(unsigned char* vram ,int xsize , unsigned char c, int x, int y , char* fp) ; 

void cmian(void){
	int i ; 
	char* vram = (char*)0xa0000 ;
	init_palette();
	//destop
	int xsize = 320 ;
	int ysize = 200 ;

	boxfill8(vram, xsize, COL8_008484, 0, 0, xsize-1, ysize-29);
	boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize - 28 , xsize-1, ysize-28);
	boxfill8(vram, xsize, COL8_FFFFFF, 0, ysize - 27 , xsize-1, ysize-27);
	boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize - 26 , xsize-1, ysize-1);

	boxfill8(vram, xsize, COL8_FFFFFF, 3, ysize - 24 , 59, ysize-24);
	boxfill8(vram, xsize, COL8_FFFFFF, 2, ysize - 24 , 2, ysize-4);
	boxfill8(vram, xsize, COL8_848484, 4, ysize - 4 , 59, ysize-4);
	boxfill8(vram, xsize, COL8_848484, 59, ysize - 23 , 59, ysize-5);
	boxfill8(vram, xsize, COL8_000000, 2, ysize - 3 , 59, ysize-3);
	boxfill8(vram, xsize, COL8_000000, 60, ysize - 24 , 60, ysize-3);
	
	boxfill8(vram, xsize, COL8_848484, xsize -47, ysize - 24 , xsize-4, ysize-24);
	boxfill8(vram, xsize, COL8_848484, xsize -47, ysize - 23 , xsize-47, ysize-3);
	boxfill8(vram, xsize, COL8_FFFFFF, xsize -47, ysize - 3 , xsize-4, ysize-3);
	boxfill8(vram, xsize, COL8_FFFFFF, xsize -3, ysize - 24 , xsize-3, ysize-3);
	/** draw A
	char 0x41
	........
	...**...
	...**...
	...**...
	...**...
	..*..*..
	..*..*..
	..*..*..
	..*..*..
	.******.
	.*....*.
	.*....*.
	.*....*.
	***..***
	........
	........
	*/ 
	char fp[] = {0x00 , 0x18 , 0x18 , 0x18 , 0x18, 0x24,0x24 ,0x24,0x24,0x7E,0x42,0x42,0x42 ,0xE7 ,0x00 ,0x00};
	putfont(vram , xsize ,COL8_848484 , 0 , 0 ,fp );
		
	for(;;) {
		io_hlt();
	}
}

void set_palette(int start , int end , unsigned char* rgb) {
	int i , eflags ;
	eflags = io_load_eflags();
	io_cli();
	io_out8(0x03c8 , start); //set palette number
	for(i = start ; i <= end ; i++ ) {
		io_out8(0x03c9,rgb[0]/4);
		io_out8(0x03c9,rgb[1]/4);
		io_out8(0x03c9,rgb[2]/4);
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

void boxfill8(unsigned char *vram,int xsize,  unsigned char c, int x0, int y0, int x1 , int y1)
{
	int x, y ;
	for(y = y0 ; y <= y1 ; y++ )
	{
		for(x = x0 ; x <= x1 ; x++)
		{
			vram[y*xsize + x] = c ; 
		}
	}

}

void putfont(unsigned char* vram ,int xsize , unsigned char color ,  int x, int y , char* font)
{
	//8 * 16
	int len = 16 ;
	while(len){
		char c = *font++ ;
		if(c & 0x80 ) vram[y*xsize + x + 0] = color ;
		if(c & 0x40 ) vram[y*xsize + x + 1 ] = color ;
		if(c & 0x20 ) vram[y*xsize + x + 2] = color ;
		if(c & 0x10 ) vram[y*xsize + x + 3] = color ;
		if(c & 0x08 ) vram[y*xsize + x + 4] = color ;
		if(c & 0x04 ) vram[y*xsize + x + 5] = color ;
		if(c & 0x02 ) vram[y*xsize + x + 6] = color ;
		if(c & 0x01 ) vram[y*xsize + x + 7] = color ;
		y++ ;
		len--;
	}
	
} 
