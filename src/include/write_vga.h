#include <mm.h>
#include <sheet.h>
#include <graphic.h>
#include <std.h>
#include <kernel.h>
#include <fifo.h>

//#define FLAGS_OVERRUN 0x01

#define PIC0_OCW2 0x0020
#define PIC1_OCW2 0x00a0

#define PORT_KEYDAT 0x60 
#define PORT_KEYSTA 0x0064
#define PORT_KEYCMD 0x0064
#define KEYSTA_SEND_NOTREADY 0x02
#define KEYCMD_WRITE_MODE 0x60
#define KBC_MODE   0x47

#define KEYCMD_SENDTO_MOUSE 0xd4
#define MOUSECMD_ENABLE     0xf4

#define asm_cli     __asm__ ("cli")
#define asm_sti     __asm__ ("sti")	
#define asm_stihlt  __asm__ ("sti;hlt")

struct MOUSE_DEC {
	unsigned char buf[3] , phase ;
	int x , y , btn ;
};

void wait_KBC_sendready() ;
void init_keyboard();
void enable_mouse();
int mouse_decode(struct MOUSE_DEC* mdec , unsigned char dat) ;

void int2hex(unsigned int x , char* buf) ;
