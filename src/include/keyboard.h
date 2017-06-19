#ifndef _KEYBOARD_H
#define _KEYBOARD_H
#include <system.h>
#include <fifo.h>


struct MOUSE_DEC {
	unsigned char buf[3] , phase ;
	int x , y , btn ;
};

void enable_mouse();
void init_keyboard(struct FIFO *fifo , int data0);
int mouse_decode(struct MOUSE_DEC* mdec , unsigned char dat) ;
#endif
