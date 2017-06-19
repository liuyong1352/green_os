#ifndef _FIFO_H
#define _FIFO_H

#define FLAGS_OVERRUN 0x01

struct FIFO {
	int* buf ;
	int p , q , free ,size , flags ; 
};

int fifo_status(struct FIFO* fifo) ;
void fifo_init(struct FIFO* fifo , int size , int* buf) ;

int fifo_put(struct FIFO* fifo ,int data ) ;
int fifo_get(struct FIFO* fifo );
#endif
