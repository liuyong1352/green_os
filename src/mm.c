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

unsigned int memman_alloc(struct MEMMAN* man , unsigned int size) 
{
	unsigned int i , a ; 
	for(i = 0 ; i < man->frees ; i++ ) 
	{
		if(man->free[i].size < size ) 
			continue ; 
		a = man->free[i].addr ;
		man->free[i].addr += size ;
		man->free[i].size -= size ;

		if(man->free[i].size == 0 ) {
			man->frees-- ;
			for(; i < man->frees ; i++)
				man->free[i] = man->free[i+1] ; 
		}		

		return a ;
	}
	return 0  ; 
}

int memman_free(struct MEMMAN* man , unsigned int addr , unsigned int size ) 
{
	if(man->frees == 0 ) {
		man->free[0].addr = addr ;
		man->free[0].size = size ;
		man->frees++ ;
		return 1 ; 
	}
	unsigned int i  ; 
	//find index in array
	for(i = 0  ;  i < man->frees ; i++ ) {
		if(man->free[i].addr >= addr)
			break ; 
	}	
	
	if(i >  0 ) {
		
		if(man->free[i-1].addr + man->free[i-1].size == addr) {
			man->free[i-1].size += size ;
			if(i == man->frees){
				//so i-1 is last one ,just return 
				return 1 ;
			}  
			if(man->free[i].addr == addr + size ){
				man->free[i-1].size += man->free[i].size ; 
				//remove free[i] and move other 
				man->frees-- ; 
				for(; i < man->frees ;i++ )
					man->free[i] = man->free[i+1] ;
			}
			return 1 ;
		}
	} 

	if(i  < man->frees ) {
		if(addr + size == man->free[i].addr){
			man->free[i].addr = addr ;
			man->free[i].size += size ; 
			return 1 ;
		}
	}	
	
	if(man->frees < MEMMAN_FREES ) {
		//free[i] move right 
		for(int j = man->frees ; i < j ; j-- ){
			man->free[j] = man->free[j-1] ; 
		} 
		man->frees++ ;
		if(man->maxfrees < man->frees){
			man->maxfrees = man->frees ; 
		}
		man->free[i].addr = addr ;
		man->free[i].size = size ;
		return 1; 
	}		
	man->losts++ ; 
	man->lostsize += size ;
	return 0 ; 
}
