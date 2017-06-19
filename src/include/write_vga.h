#include <system.h>
#include <mm.h>
#include <sheet.h>
#include <graphic.h>
#include <timer.h>
#include <std.h>
#include <kernel.h>
#include <fifo.h>

//#define FLAGS_OVERRUN 0x01

#define PIC1_OCW2 0x00a0

#define PORT_KEYDAT 0x60 
#define PORT_KEYSTA 0x0064
#define PORT_KEYCMD 0x0064
#define KEYSTA_SEND_NOTREADY 0x02
#define KEYCMD_WRITE_MODE 0x60
#define KBC_MODE   0x47

#define KEYCMD_SENDTO_MOUSE 0xd4
#define MOUSECMD_ENABLE     0xf4

struct MOUSE_DEC {
	unsigned char buf[3] , phase ;
	int x , y , btn ;
};

void wait_KBC_sendready() ;
void init_keyboard();
void enable_mouse();
int mouse_decode(struct MOUSE_DEC* mdec , unsigned char dat) ;

void int2hex(unsigned int x , char* buf) ;
/**
*	c 字体颜色 ， b 背景颜色 l 字符串长度
*/
void showString_sht(struct SHEET *sht ,int x , int y , int c , int b , char* s , int l ) ; 
