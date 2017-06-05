#ifndef   _SHEET_H
#define  _SHEET_H
#include <mm.h>
#define MAX_SHEETS 114
#define SHEET_USE 1 

struct SHEET {
	unsigned char* buf ;
	int bxsize , bysize ,vx0 , vy0 ,col_inv, height , flags ; 	
};

struct SHTCTL {
	unsigned char* vram ;
	int xsize , ysize , top ;
	struct SHEET* sheets[MAX_SHEETS] ;
	struct SHEET sheets0[MAX_SHEETS] ;	
};

struct SHTCTL* shtctl_init(struct MEMMAN* man , unsigned char* vram , int xsize , int ysize ) ;
struct SHEET* sheet_alloc(struct SHTCTL* ctl ) ;
void sheet_setbuf(struct SHEET* sheet  , unsigned char* buf  , int bxsize , int bysize , int col_inv) ;
void sheet_updown(struct SHTCTL* ctl , struct SHEET* sht , int height );
void sheet_refresh(struct SHTCTL* ctl) ;
void sheet_slide(struct SHTCTL* ctl , struct SHEET* sht , int vx0 , int vy0) ; 
#endif 
