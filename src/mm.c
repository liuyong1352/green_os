#include "mm.h"

void memman_init(struct MEMMAN* man)
{
    man->frees = 0 ; //可用信息条数
    man->maxfrees = 0 ;
    man->lostsize = 0 ;
    man->losts = 0 ;
}

unsigned int memman_total(struct MEMMAN* man) 
{
	unsigned int i , t = 0 ; 
	for(i = 0 ; i < man->frees ; i++) {
		t += man->free[i].size ;
	}
	return t ;
}


