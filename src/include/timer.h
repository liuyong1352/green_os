#ifndef _TIMER_H
#define _TIMER_H

#include <std.h>
#include <fifo.h>
#include <system.h>

#define PIT_CTRL 0x0043
#define PIT_CNT0 0x0040

#define MAX_TIMER 64 
#define TIMER_FLAGS_ALLOC 1 
#define TIMER_FLAGS_USING 2

struct TIMER {
	struct TIMER* next ; 
	unsigned int timeout , flags ;
	struct FIFO *fifo ;
	int data ; 
};

struct TIMERCTL {
	unsigned int count , next_timeout ; 
	struct TIMER* header ; 
	struct TIMER timer[MAX_TIMER] ; 
};

struct TIMERCTL* getTimerCTL();
void inthandler(int *esp) ;	
void init_pit() ; 
struct TIMER *timer_alloc();
void timer_free(struct TIMER *timer) ;
void timer_init(struct TIMER *timer , struct FIFO *fifo , int data) ; 
void timer_settime(struct TIMER *timer , unsigned int timeout ) ; 

#endif 
