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
v3
07A32721
078C4D7E
0797C562
**/

static struct TIMERCTL timerctl ;

struct TIMERCTL* getTimerCTL() {
	return &timerctl ; 
}

void init_pit(){
	struct TIMER *timer ; 
	outb_p(PIT_CTRL , 0x34);
	outb_p(PIT_CNT0 , 0x9c);
	outb_p(PIT_CNT0 , 0x2e);
	timerctl.count = 0 ;
	for( int i = 0 ; i < MAX_TIMER ; i++ ){
		timerctl.timer[i].flags = 0; //not used
	}
	timer = timer_alloc();
	timer->timeout = 0xffffffff;
	timer->flags  = TIMER_FLAGS_USING ; 
	timer->next   = 0 ; /*末尾*/
	timerctl.header = timer ;
	timerctl.next_timeout = 0xffffffff; //no timer used 
	return ; 	
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
	int e  ;
	struct TIMER *t , *s ; 
	timer->timeout = timerctl.count + timeout ;
	timer->flags   = TIMER_FLAGS_USING ; 
	e = load_eflags();
	cli() ; 

	t = timerctl.header ; 
	if(timer->timeout <= t->timeout) {
		//插入最前面的情况下
		timerctl.header = timer ; 
		timer->next = t ; //no next 
		timerctl.next_timeout = timer->timeout ; 
		store_eflags(e);
		return ;
	}
	
	for(;;){
		s = t ; 
		t = t->next ; 
		if(timer->timeout <= t->timeout){
			s->next = timer ; 
			timer->next = t ;
			store_eflags(e);
			return ;
		}
	}
}

void inthandler20(int *esp){
	struct TIMER* timer ; 
	outb_p(PIC0_OCW2 , 0x60);
	timerctl.count++  ;
	if(timerctl.next_timeout > timerctl.count) {
		return ; 
	}
	timer = timerctl.header ; 
	for(;;) {
		if(timer->timeout > timerctl.count ) {
			break ;
		}
		timer->flags = TIMER_FLAGS_ALLOC ; 
		fifo_put(timer->fifo , timer->data) ;
		timer = timer->next ;  
	}	
	timerctl.header = timer ; 
	timerctl.next_timeout = timer->timeout ; 
	return ;
}
