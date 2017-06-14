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
}

void inthandler20(int *esp){
	outb_p(PIC0_OCW2 , 0x60);
	timerctl.count++ ; 
}

