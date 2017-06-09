#include <write_vga.h>

typedef unsigned char uchar ;

void outb_p(int port , int data);
unsigned char inb_p(int port);
int io_load_eflags(void);
void io_store_eflags(int eflags);
void boxfill8( unsigned char c, int x0, int y0,int x1, int y1);

void toHex(char c , char* buf) ; 
void printdTotalMem(struct MEMMAN* man) ; 
void testMem(struct MEMMAN* man) ;

static struct FIFO keyfifo = {0};
static struct FIFO mousefifo = {0} ; 

char* vram = (char*)0xa0000 ; 
int xsize  = 320 ;
int ysize  = 200 ; 

extern unsigned int smap_size ; 
 
static int printd_x = 0 , printd_y = 0 ;

struct MEMMAN* memman = (struct MEMMAN*)0x100000;
void cmain(void){
	
	init_palette();
	
	static char keybuf[32] = {0};
	static char mousebuf[128] = {0} ;  
	fifo_init(&keyfifo , 32 ,keybuf ) ; 
	fifo_init(&mousefifo , 128 , mousebuf) ;   
	
	init_keyboard();
	
	asm_sti ; 
	int mx = (xsize -16) / 2 ;
	int my = (ysize - 16) / 2 ;	
	enable_mouse();
	struct MOUSE_DEC mdec ; 
	mdec.phase = 0 ;
	struct AddressRangeDes* memAddr = (struct AddressRangeDes*)get_smap_buf();
	//0x100000 0x1FEE0000
 	memman_init(memman);	
	memman_free(memman , 0x00108000 , 0x1FE00000);
	
	struct SHTCTL* shtctl ;
	struct SHEET* sht_back ;
	struct SHEET* sht_mouse ;
	struct SHEET* sht_win;
	static char buf_mouse[16*16] ;
	char *buf_back , *buf_win;
	shtctl = shtctl_init(memman , vram , xsize , ysize) ;
	
	buf_back = (char*)memman_alloc_4k(memman , xsize * ysize * 2) ;
	buf_win  = (char*)memman_alloc_4k(memman , 160 * 68) ;

	sht_back 	= sheet_alloc(shtctl) ;
	sht_mouse 	= sheet_alloc(shtctl) ; 	 	
	sht_win		= sheet_alloc(shtctl) ;

	sheet_setbuf(sht_back ,	 buf_back , xsize  ,ysize , -1 );
	sheet_setbuf(sht_mouse , buf_mouse , 16 ,16 , 99 );
	sheet_setbuf(sht_win , 	 buf_win , 	160 ,68 , -1 );

	init_screen(buf_back , xsize , ysize) ; 
	init_mouse( buf_mouse, 99) ;	
	make_window8(buf_win , 160 ,68  , "window");

//	showString(buf_win ,160  , 24 ,28 ,COL8_000000 , "Welcome to") ; 
//	showString(buf_win ,160  , 24 ,44 ,COL8_000000 , "M-OS!") ; 

	sheet_slide(shtctl , sht_back , 0 , 0 ) ; 
	sheet_slide(shtctl , sht_mouse , mx , my) ; 		
	sheet_slide(shtctl , sht_win , 0 , ysize-68) ; 	

	sheet_updown(shtctl , sht_back , 0 ) ;
	delay(150000);
	//sheet_updown(shtctl , sht_win , 1) ;
	//sheet_updown(shtctl , sht_mouse , 2) ;
	sheet_updown(shtctl , sht_mouse , 1) ;
	//printdTotalMem(memman) ;
	char buf[64] ; 
/*
	sprintf(buf ,"This is test 0x%x" , 100 ) ;  
	showString(shtctl , sht_back, 20 , 0 , COL8_000000, buf);
	for(int i = 0 ; i < 100 ; i++ ) {
	sheet_slide(shtctl , sht_win , 0  , ysize - 68) ;
	delay(14000);
	sheet_slide(shtctl , sht_win , 0  , 0 ) ;
	}
*/	
	int count = 0 ; 	
	for(;;) {
		asm_cli ;
		if(fifo_status(&keyfifo)) {
			char i  = fifo_get(&keyfifo); 
			asm_sti ;
			 //1E A 30 B	
			if(i == 0x1C) {
	sprintf(buf ,"%x %x %x %x" , i , shtctl->ysize,shtctl->top,(int)shtctl->vram) ;
	showString(buf_back , xsize , 0 , 0 , COL8_000000, buf);
	sprintf(buf ,"%x %x %x %x" , sht_back->vx0 , sht_back->vy0,sht_back->height,(int)sht_back->buf) ;
	showString(buf_back , xsize, 0 , 16 , COL8_000000, buf);
	sprintf(buf ,"%x %x %x %x" , sht_mouse->bxsize , sht_mouse->bysize,sht_mouse->height,(int)sht_mouse->buf) ;
	showString(buf_back , xsize, 0 , 32 , COL8_000000, buf);
	sprintf(buf ,"%x %x %x %x" , sht_mouse->vx0 , sht_mouse->vy0,sht_mouse->height,(int)sht_mouse->buf) ;
	showString(buf_back , xsize, 0 , 48 , COL8_000000, buf);
//	sprintf(buf ,"%x %x %x %x" , sht_win->bxsize , sht_win->bysize,sht_win->height,(int)sht_win->buf) ;
//	showString(buf_back , xsize, 0 , ysize-16 , COL8_000000, buf);
//				sheet_slide(shtctl , sht_mouse , mx , my) ;
				//showMemInfo(memAddr + count++) ;
				//count %= smap_size;
	showString(buf_back , xsize, 0 , ysize -16 , COL8_000000, buf);
	sheet_refresh(shtctl ,sht_back, 0 , 0 , xsize , ysize );
	init_screen(buf_back , xsize , ysize) ; 
			}
			if(i == 0x1E ){
				count += 16 ;
				count %= 200 ; 
				sprintf(buf ,"%x %x %x %x" , i , shtctl->ysize,shtctl->top,(int)shtctl->vram) ;
				showString(buf_back , xsize , 0 , count , COL8_000000, buf);
				//sheet_slide(shtctl , sht_mouse , mx  , ysize - 16) ;
				sheet_refresh(shtctl ,sht_back, 0 , 0 , xsize , ysize );
			}
			if(i == 0x30 ){
				//sheet_slide(shtctl , sht_mouse , mx  , ysize - 16) ;
				init_screen(buf_back , xsize , ysize) ; 
				sprintf(buf ,"%x %x %x %x" , sht_mouse->vx0 , sht_mouse->vy0,(int)buf_back[xsize*(ysize - 100) - 2],(int)buf_back[xsize*ysize - 2]) ;
				showString(buf_back , xsize, 0 , 48 , COL8_000000, buf);
				sheet_refresh(shtctl ,sht_back, 0 , 0 , xsize , ysize );
			}
		}else if (fifo_status(&mousefifo)){
			char i  = fifo_get(&mousefifo); 
			asm_sti ; 	
			if(mouse_decode(&mdec , i)) {
				mx += mdec.x ;
				my += mdec.y ;
				if(mx < 0 ) 
					mx = 0 ;
				if(my < 0 ) 
					my = 0 ;
				/*
				if(mx > xsize - 1) 
					mx = xsize - 1 ;
				if(my > ysize - 1 ) 
					my = ysize - 1 ;
	*/
				if(mx > xsize - 16 )
					mx = xsize -16 ;
				if(my > ysize - 16 ) 
					my = ysize - 16 ;
 				
				sheet_slide(shtctl , sht_mouse , mx , my) ;
			}
		}else {
		 	asm_stihlt ; 
		} 
	}
}


void printdTotalMem(struct MEMMAN* man) {

	int M_UNIT = 1024 * 1024 ;
	int mem_total = memman_total(memman) ; 
	printd("TotalMem:"); 
	printi(mem_total/M_UNIT) ;
	printd("M   ");
	printi(mem_total/1024);	
	printd("K\n");
}

void testMem(struct MEMMAN* man) {
 	printdTotalMem(man) ; 
	unsigned int addr = memman_alloc(memman , 1024*1024*200) ; 
	printd("After ");
 	printdTotalMem(man) ; 
		
	unsigned int addr1 = memman_alloc_4k(memman , 1) ; 
	printd("After ");
	printdTotalMem(man) ; 
	unsigned int addr2 = memman_alloc_4k(memman , 1024*4 + 200) ; 
	printd("After ");
	printdTotalMem(man) ; 
        
	memman_free_4k(memman, addr1 , 1) ; 
	printd("Ffter ");
	printdTotalMem(man) ; 
	memman_free_4k(memman, addr2 , 1024*4 + 200) ; 
	printd("Ffter ");
	printdTotalMem(man) ; 
	memman_free(memman, addr , 1024*1024*200 ) ; 
	printd("Ffter ");
	printdTotalMem(man) ; 
	
}	

void toHex(char c , char* buf) {
     char* _t = "0123456789ABCDEF" ;
     *(buf + 0) = _t[(c >> 4)&0x0F];
     *(buf + 1) = _t[c&0x0F];
}

void showMemInfo(struct AddressRangeDes* addr ){
//	printd_x = 0 ;
//	printd_y = 0 ;

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
			putfont(vram ,xsize,  printd_x ,printd_y ,COL8_000000 ,  *s);   	
		}
		printd_x += 8 ; 
		if(printd_x == 320 ) {
			printd_x = 0 ;
			printd_y += 16 ;
		}		
	} 
}
void printi(int i ) {
	char uf[9] = {0} ; 
	int2hex(i, uf) ; 
	printd(uf) ; 
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
	boxfill(vram , xsize  , c , x0 , y0 , x1 , y1) ;
}


/*
void putblock(int px , int py , char *buf);
void putblock(int px , int py , char *buf) {
	for(int y = 0 ; y < 16  ; y++ ){
		for(int x = 0 ; x < 16 ; x++ ) {
			vram[( y + py )*xsize + x + px ] = buf[y * 16 + x] ; 
		}
	}	

}
*/
void int2hex(unsigned int i , char* buf) {
     char* _t = "0123456789ABCDEF" ;
     unsigned int mask = 0x0F ;
     int pos  = 8 ; 
     do {
         buf[--pos] = _t[ i & mask] ;
         i >>= 4 ; 
    }while(pos) ;
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
}
