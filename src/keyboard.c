#include <keyboard.h>

static struct FIFO* ififo ; 
static int keydata0 ; 
static int mousedata0 ; 

static char keytable[0x54] = {
  		0,   0,   '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '^', 0,   0,
		'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '@', '[', 0,   0,   'A', 'S',
		'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', ':', 0,   0,   ']', 'Z', 'X', 'C', 'V',
		'B', 'N', 'M', ',', '.', '/', 0,   '*', 0,   ' ', 0,   0,   0,   0,   0,   0,
		0,   0,   0,   0,   0,   0,   0,   '7', '8', '9', '-', '4', '5', '6', '+', '1',
		'2', '3', '0', '.'
};

void wait_KBC_sendready(){
	for(;;){
		if((inb_p(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY) == 0 ) 
			break ;
	}
}

void enable_mouse(struct FIFO *fifo , int data0 , struct MOUSE_DEC *mdec){
	ififo = fifo ; 
	mousedata0 = data0 ; 
	wait_KBC_sendready();
	outb_p(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE) ;
	wait_KBC_sendready();
	outb_p(PORT_KEYDAT , MOUSECMD_ENABLE) ; 	
	mdec->phase = 0 ; 
	return ; 
}

void init_keyboard(struct FIFO *fifo , int data0){
	ififo = fifo ; 
	keydata0 = data0 ; 
	wait_KBC_sendready();
	outb_p(PORT_KEYCMD , KEYCMD_WRITE_MODE);
	wait_KBC_sendready();
	outb_p(PORT_KEYDAT , KBC_MODE);
	return ; 
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

void intHandlerForMouse(int* esp) {
	int data ;
	outb_p(PIC1_OCW2 , 0x64) ;//通知PIC1 IRQ-12 的受理已完成
	outb_p(PIC0_OCW2 , 0x62) ;//通知PIC0 IRQ_02 的受理已完成
	data = inb_p(PORT_KEYDAT) ;
    fifo_put(ififo , data + mousedata0) ; 
	return ;
}

void intHandlerFromC(int* esp){
	//outb_p(0x20 , 0x61 ); //通知PIC IRQ-01已经受理完毕 , 我测试 不需要通知也可以 ， 暂时没搞清楚是为什么
	outb_p(0x20 , 0x21 ); //通知PIC IRQ-01已经受理完毕 , 我测试 不需要通知也可以 ， 暂时没搞清楚是为什么
	unsigned char data = inb_p(PORT_KEYDAT); //必须从0x60把数据读出来 ， 才会触发 下轮
	fifo_put(ififo , data + keydata0) ;
	return ;  
}
