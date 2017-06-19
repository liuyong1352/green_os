#include <timer.h>

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
void timer_init(struct TIMER *timer , struct FIFO *fifo , unsigned char data) {
	timer->fifo = fifo ;
	timer->data = data ; 
}
void timer_settime(struct TIMER *timer , unsigned int timeout )  {

	timer->timeout = timerctl.count + timeout ;
	timer->flags   = TIMER_FLAGS_USING ; 
	if(timerctl.next > timer->timeout){
		timerctl.next = timer->timeout ; 
	}
}

void inthandler20(int *esp){
	outb_p(PIC0_OCW2 , 0x60);
	timerctl.count++  ;
	if(timerctl.next > timerctl.count) {
		return ; 
	}
	timerctl.next = 0xffffffff ; 
	for(int i = 0 ; i < MAX_TIMER  ; i++ ) {
		struct TIMER* timer = &timerctl.timer[i] ; 
		if(timer->flags == TIMER_FLAGS_USING ) {
			if(timer->timeout <= timerctl.count ) {
				timer->flags = TIMER_FLAGS_ALLOC ; 
				fifo_put(timer->fifo , timer->data);
			} else {
				if(timerctl.next > timer->timeout) {
					timerctl.next = timer->timeout ; 
				}
			}
		}
	}
}
