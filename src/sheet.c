#include <sheet.h>
#include <std.h>

struct SHTCTL* shtctl_init(struct MEMMAN* man , unsigned char* vram , int xsize , int ysize ) {
	struct SHTCTL* ctl ;
	int i ; 
	ctl = (struct SHTCTL*) memman_alloc_4k(man , sizeof(struct SHTCTL));
	if(ctl == 0 ) {
		return ctl ;	
	} 
	ctl->vram = vram ;
	ctl->xsize = xsize ;
	ctl->ysize = ysize ;
	ctl->top = -1 ; 
	for(i = 0 ; i < MAX_SHEETS ; i++ ){
		ctl->sheets0[i].flags = 0 ;
	}
	 
	printi(ctl->top) ; 
}

struct SHEET* sheet_alloc(struct SHTCTL* ctl ) {
	printi((int)ctl->vram) ; 
	for(int i = 0 ; i < MAX_SHEETS ; i++ ) {
		if(ctl->sheets0[i].flags)
			continue ;
		ctl->sheets0[i].flags = SHEET_USE ; // mark is used 
		ctl->sheets0[i].height = -1 ; //invisiable 
		return &ctl->sheets0[i];
	}
	return 0  ; 
}


void sheet_setbuf(struct SHEET* sheet  , unsigned char* buf  , int bxsize , int bysize , int col_inv) {
	sheet->buf = buf ; 
	sheet->bxsize = bxsize ;
	sheet->bysize = bysize ;
	sheet->col_inv = col_inv ; 
}
void sheet_updown(struct SHTCTL* ctl , struct SHEET* sht , int height ) {
	if(sht->height == height)
		return ; 

	int h , old = sht->height  ; 
	if(height > ctl->top+1 ) 
		height = ctl->top+1 ;
	if(height < -1 )
		height = -1 ;

			printd("top->");
			printi(ctl->top) ;
			printd("\n"); 
//	printi(ctl->top) ; 
	sht->height = height ;
	if(old > height ) {
		if(height >= 0 ) {
			for(h = old ; h > height   ; h-- ) {
				ctl->sheets[h] = ctl->sheets[h-1] ; 
				ctl->sheets[h]->height = h ; 
			}
			ctl->sheets[h] = sht ; 
		} else {
			for(h = old ; h < ctl->top  ; h++ ) {
				ctl->sheets[h] = ctl->sheets[h+1] ;
				ctl->sheets[h]->height = h ; 
			}
			ctl->top-- ; 
		}
	}
	else if (old < height ) {
		if(old == -1 ) {
			for(h = ctl->top ; h >= height  ; h-- ) {
				ctl->sheets[h+1] = ctl->sheets[h] ;
				ctl->sheets[h+1]->height = h+1 ;	
			}
			ctl->sheets[height] = sht ; 
			ctl->top++ ;
		} else if (old >= 0 ) {
			for(h = old ; h < height ; h++ ) {
				ctl->sheets[h] = ctl->sheets[h+1] ;
				ctl->sheets[h]->height = h  ; 
			}
			ctl->sheets[height] = sht ; 
		}	
	}
	sheet_refresh(ctl) ; 
}

void sheet_refresh(struct SHTCTL* ctl)  {
	printi(ctl->top) ;

	for(int h = 0 ; h <= ctl->top  ; h++ ) {
		struct SHEET* sht = ctl->sheets[h] ; 
		for(int by = 0 ; by < sht->bysize  ; by++ ) {
			int vy = (sht->vy0 + by)  ; 
			for(int bx = 0 ; bx < sht->bxsize ; bx++ ) {
				unsigned char c = sht->buf[by * sht->bxsize + bx]; 
				if(c == sht->col_inv)
					continue ;
				int vx = sht->vx0 + bx ; 
				ctl->vram[vy * ctl->xsize + vx ] = c; 
			}
		}
	}
}

void sheet_slide(struct SHTCTL* ctl , struct SHEET* sht, int vx0 ,int vy0) 
{
	sht->vx0 = vx0 ;
	sht->vy0 = vy0 ;
	if(sht->height >= 0) 
		sheet_refresh(ctl);
}
