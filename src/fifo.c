#include <fifo.h>

int fifo_status(struct FIFO* fifo) {
	return fifo->size  - fifo->free  ;
}


void fifo_init(struct FIFO* fifo , int size , int* buf) {
	
	fifo->size	= size ;
	fifo->buf	= buf ;
	fifo->free	= size ; 
	fifo->flags	= 0;
	fifo->p 	= 0 ;
	fifo->q 	= 0 ; 
	return ; 
}

int fifo_put(struct FIFO* fifo ,int data ) {
	if(fifo->free == 0 ) {
		fifo->flags |= FLAGS_OVERRUN ; 
		return -1 ;	
	}
	fifo->buf[fifo->p] = data ;
	fifo->p++ ;
	fifo->p %= fifo->size ; 
	fifo->free--;
	return 0 ; 
}

int fifo_get(struct FIFO* fifo ){
	int data ; 
	if(fifo->free == fifo->size) {
		return -1 ;
	}
	data = fifo->buf[fifo->q] ;
	fifo->q++ ;
	//fifo->q %= fifo->size ; 
	if(fifo->q == fifo->size) {
		fifo->q = 0 ;
	}
	fifo->free++ ;
	return data ; 
}
