#ifndef _TIMER_H
#define _TIMER_H

#include <std.h>
#include <fifo.h>
#include <system.h>

#define PIT_CTRL 0x0043
#define PIT_CNT0 0x0040

struct TIMERCTL {
	unsigned int count ; 	
	unsigned int timeout ;
	struct FIFO *fifo ;
	unsigned char data ; 
};

struct TIMERCTL* getTimerCTL();
void inthandler(int *esp) ;	
void init_pit() ; 
void settimer(unsigned int timeout , struct FIFO *fifo , unsigned char data) ;
#endif 
