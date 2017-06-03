#ifndef _MM_H
#define _MM_H

#define MEMMAN_FREES 4090 /*大约32KB*/


struct AddressRangeDes {
	unsigned int baseAddrLow ;
	unsigned int baseAddrHigh ;
	unsigned int lengthLow ;
	unsigned int lengthHigh ;
	unsigned int type ;
	
} ; 

//可用信息
struct FREEINFO {
	unsigned int addr , size ; 
};

struct MEMMAN {
	int frees , maxfrees , lostsize , losts ;
	struct FREEINFO free[MEMMAN_FREES] ;
};

char* get_smap_buf();
void showMemInfo(struct AddressRangeDes* addr );
void memman_init(struct MEMMAN* man);
unsigned int memman_total(struct MEMMAN* man) ; 
unsigned int memman_alloc(struct MEMMAN* man , unsigned int size) ; 

#endif
