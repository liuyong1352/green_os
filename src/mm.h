#ifndef _MM_H
#define _MM_H

char* get_smap_buf();

struct AddressRangeDes {
	unsigned int baseAddrLow ;
	unsigned int baseAddrHigh ;
	unsigned int lengthLow ;
	unsigned int lengthHigh ;
	unsigned int type ;
	
} ; 

struct FREEINFO {
	unsigned int addr , size ; 
};

struct MEMMAN {
	int frees ;
	struct FREEINFO free[1000] ;
};

void showMemInfo(struct AddressRangeDes* addr );

#endif
