//gcc -m32 -fno-asynchronous-unwind-tables -s  -c write_vga.c -o write_vga.o

void io_hlt();
void init_palette(void);
void io_cli(void);
void io_out8(int port , int data);
int io_load_eflags(void);
void io_store_eflags(int eflags);

void cmian(void){
	int i ; 
	char* p = (char*)0 ;
	init_palette();
	for(i = 0xa0000 ; i <= 0xaffff ; i++ ){
		p = (char*)i ;
		*p = i&0x0f;
	}
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
		io_out8(0x03c9,rgb[0]);
		io_out8(0x03c9,rgb[1]);
		io_out8(0x03c9,rgb[2]);
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
