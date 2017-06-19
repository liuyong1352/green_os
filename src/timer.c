#include <timer.h>

/**
benchmarck :
v1
0268673F
0268B908
026D99C0
0260EBDB
v2
076D1337
**/

static struct TIMERCTL timerctl ;

struct TIMERCTL* getTimerCTL() {
	return &timerctl ; 
}

void init_pit(){
	outb_p(PIT_CTRL , 0x34);
	outb_p(PIT_CNT0 , 0x9c);
	outb_p(PIT_CNT0 , 0x2e);
	timerctl.count = 0 ;
	timerctl.next = 0xffffffff; //no timer used 
	timerctl.using = 0  ;
	for( int i = 0 ; i < MAX_TIMER ; i++ ){
		timerctl.timer[i].flags = 0; //not used
	}
}

struct TIMER *timer_alloc() {

	for( int i  = 0 ; i < MAX_TIMER ; i++ ){
		if(timerctl.timer[i].flags == 0 ) {
			timerctl.timer[i].flags = TIMER_FLAGS_ALLOC ;
			return &timerctl.timer[i] ; 
		}
	}
	return 0  ;
}
void timer_free(struct TIMER *timer) {
	timer->flags = 0 ; 
}
void timer_init(struct TIMER *timer , struct FIFO *fifo , int data) {
	timer->fifo = fifo ;
	timer->data = data ; 
}
void timer_settime(struct TIMER *timer , unsigned int timeout )  {
	int e , i , j ;
	timer->timeout = timerctl.count + timeout ;
	timer->flags   = TIMER_FLAGS_USING ; 
	e = load_eflags();
	cli() ; 
	for(i = 0 ; i < timerctl.using ; i++ ) {
		if(timerctl.timers[i]->timeout >= timer->timeout ) {
			break ; 
		}
	}

	for(j = timerctl.using ; j > i ; j-- ){
		timerctl.timers[j] = timerctl.timers[j - 1] ; 
	}
	timerctl.using++ ; 
	timerctl.timers[i] = timer ; 
	timerctl.next = timerctl.timers[0]->timeout ; 
	store_eflags(e) ; 
	return ;
}

void inthandler20(int *esp){
	outb_p(PIC0_OCW2 , 0x60);
	timerctl.count++  ;
	if(timerctl.next > timerctl.count) {
		return ; 
	}
	int i , j ; 
	for(i = 0 ; i < timerctl.using ; i++ ) {
		if(timerctl.timers[i]->timeout > timerctl.count ) {
			break ;
		}
		timerctl.timers[i]->flags = TIMER_FLAGS_ALLOC ; 
		fifo_put(timerctl.timers[i]->fifo , timerctl.timers[i]->data) ; 
	}	
	timerctl.using -= i  ;
	for(j = 0 ; j < timerctl.using ; j++ ) {
		timerctl.timers[j] = timerctl.timers[i+j] ; 
	}

	if(timerctl.using > 0 ) {
		timerctl.next = timerctl.timers[0]->timeout ; 
	}else {
		timerctl.next = 0xffffffff ; 
	}
	return ;
}
