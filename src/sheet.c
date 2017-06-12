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
	 
	return ctl ;  
}

struct SHEET *sheet_alloc(struct SHTCTL *ctl) {
    struct SHEET *sht;
    int i;
    for (i = 0; i < MAX_SHEETS; i++) {
        if (ctl->sheets0[i].flags == 0) {
            sht = &ctl->sheets0[i];
            ctl->sheets[i] = sht;
			sht->flags = SHEET_USE ; // mark is used 
			sht->height = -1 ; //invisiable 
            return sht;
        }
    }

    return 0;
}



void sheet_setbuf(struct SHEET* sheet  , unsigned char* buf  , int bxsize , int bysize , int col_inv) {
	sheet->buf = buf ; 
	sheet->bxsize = bxsize ;
	sheet->bysize = bysize ;
	sheet->col_inv = col_inv ; 
}

/*
void sheet_updown(struct SHTCTL* ctl , struct SHEET* sht , int height ) {
	if(sht->height == height)
		return ; 

	int h , old = sht->height  ; 
	if(height > ctl->top+1 ) 
		height = ctl->top+1 ;
	if(height < -1 )
		height = -1 ;

			//printd("top->");
			//printi(ctl->top) ;
			//printd("\n"); 
	sht->height = height ;
	if(old > height ) {
		if(height >= 0 ) {
			for(h = old ; h > height   ; h-- ) {
				ctl->sheets[h] = ctl->sheets[h-1] ; 
				ctl->sheets[h]->height = h ; 
			}
			ctl->sheets[height] = sht ; 
		} else {
			if(ctl->top > old) {
				for(h = old ; h < ctl->top  ; h++ ) {
					ctl->sheets[h] = ctl->sheets[h+1] ;
					ctl->sheets[h]->height = h ; 
				}
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

void sheet_refreshsub(struct SHTCTL* ctl , int vx0 , int vy0 , int vx1 , int vy1){

	for(int h = 0 ; h <= ctl->top  ; h++ ) {
		struct SHEET* sht = ctl->sheets[h] ;
		for(int by = 0 ; by < sht->bysize  ; by++ ) {
			int vy = (sht->vy0 + by)  ; 
			for(int bx = 0 ; bx < sht->bxsize ; bx++ ) {
				int vx = sht->vx0 + bx ; 
				if(vx0 <= vx && vx < vx1 && vy0 <= vy && vy <= vy1) {
					unsigned char c = sht->buf[by * sht->bxsize + bx]; 
					if(c == sht->col_inv)
						continue ;
					ctl->vram[vy * ctl->xsize + vx ] = c; 
				} 
			}
		}
	}
}

void sheet_slide(struct SHTCTL* ctl , struct SHEET* sht, int vx0 ,int vy0) 
{
	int old_vx0 = sht->vx0  , old_vy0 = sht->vy0 ;  
	sht->vx0 = vx0 ;
	sht->vy0 = vy0 ;
	if(sht->height >= 0) {
		//sheet_refresh(ctl) ;
		sheet_refreshsub(ctl , old_vx0 , old_vy0 , old_vx0 + sht->bxsize , old_vy0 + sht->bysize);
//		delay(150000);
		sheet_refreshsub(ctl , vx0 , vy0 , vx0 + sht->bxsize , vy0 + sht->bysize);
	}
}

int sheet_refresh(struct SHTCTL *ctl, struct SHEET *sht, int bx0, int by0, int bx1, int by1) {
    if (sht->height >= 0) {
        sheet_refreshsub(ctl, sht->vx0 + bx0, sht->vy0 + by0, sht->vx0 + bx1,
        sht->vy0 + by1);
    }
    return 0;
}

void sheet_slide(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0) {
    int old_vx0 = sht->vx0, old_vy0 = sht->vy0;
    sht->vx0 = vx0;
    sht->vy0 = vy0;
    if (sht->height >= 0) {
         sheet_refreshsub(ctl, old_vx0, old_vy0, old_vx0 + sht->bxsize, old_vy0 + sht->bysize);
         sheet_refreshsub(ctl, vx0, vy0, vx0+sht->bxsize, vy0+sht->bysize);
    }
}

void sheet_refreshsub(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1) {
    int h, bx, by, vx, vy;
    unsigned char *buf, c, *vram = ctl->vram;
    struct SHEET *sht;
    for (h = 0; h <= ctl->top; h++) {
        sht = ctl->sheets[h];
        buf = sht->buf;
        for (by = 0; by < sht->bysize; by++) {
            vy = sht->vy0 + by;
            for (bx = 0; bx < sht->bxsize; bx++) {
                vx = sht->vx0 + bx;
                if (vx0 <= vx && vx < vx1 && vy0 <= vy && vy < vy1) {
                    c = buf[by * sht->bxsize + bx];
                    if (c != sht->col_inv) {
                        vram[vy * ctl->xsize + vx] = c;
                    }
                }
            }
        }
    }
}
*/

void sheet_updown(struct SHTCTL *ctl, struct SHEET *sht, int height) {
    int h, old = sht->height;
    if (height > ctl->top + 1) {
        height = ctl->top + 1;
    }
 
    if (height < -1) {
        height = -1;
    }

    sht->height = height;

    if (old > height) {
        if (height >= 0) {
            for (h = old; h > height; h--) {
                ctl->sheets[h] = ctl->sheets[h-1];
                ctl->sheets[h]->height = h;
            }
     
            ctl->sheets[height] = sht;
        	sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize , height + 1);
        } else {
            if (ctl->top > old) {
               for (h = old; h < ctl->top; h++) {
                   ctl->sheets[h] = ctl->sheets[h+1];
                   ctl->sheets[h]->height = h;
               }
            }

            ctl->top--;
        	sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize , 0);
        }

    } else if (old < height) {
        if (old >= 0) {
            for (h = old; h < height; h++) {
               ctl->sheets[h] = ctl->sheets[h + 1];
               ctl->sheets[h]->height = h;
            }

            ctl->sheets[height] = sht;
        } else {
            for (h = ctl->top; h >= height; h--) {
                ctl->sheets[h + 1] = ctl->sheets[h];
                ctl->sheets[h + 1]->height = h + 1;
            }

            ctl->sheets[height] = sht;
            ctl->top++;
        }

        sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize , height);
    }

}

void sheet_refresh(struct SHTCTL *ctl, struct SHEET *sht, int bx0, int by0, int bx1, int by1) {
    if (sht->height >= 0) {
        sheet_refreshsub(ctl, sht->vx0 + bx0, sht->vy0 + by0, sht->vx0 + bx1,
        sht->vy0 + by1, sht->height);
    }
}

void sheet_slide(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0) {
    int old_vx0 = sht->vx0, old_vy0 = sht->vy0;
    sht->vx0 = vx0;
    sht->vy0 = vy0;
    if (sht->height >= 0) {
         sheet_refreshsub(ctl, old_vx0, old_vy0, old_vx0 + sht->bxsize, old_vy0 + sht->bysize, 0 );
         sheet_refreshsub(ctl, vx0, vy0, vx0+sht->bxsize, vy0+sht->bysize, sht->height);
    }
}

void sheet_draw(struct SHTCTL *ctl , struct SHEET *sht , int vx0 , int vy0 , int vx1 ,int vy1) {
	
    int  bx, by, vx, vy;
    unsigned char *buf = sht->buf ;
    unsigned char  c ; 
    unsigned char  *vbuf = ctl->vram;
        for (by = 0; by < sht->bysize; by++) {
            vy = sht->vy0 + by;
            for (bx = 0; bx < sht->bxsize; bx++) {
                vx = sht->vx0 + bx;
                if (vx0 <= vx && vx < vx1 && vy0 <= vy && vy < vy1) {
//	              if (vx0 <= vx && vx < vx1 && vy < vy1) {
                    c = buf[by * sht->bxsize + bx];
                    if (c != sht->col_inv) {
                        vbuf[vy * ctl->xsize + vx] = c;
                    }
		          }
           }
  	}

}

void sheet_refreshsub(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1 , int h0 ) {
    for (int h = h0; h <= ctl->top; h++) {
        sheet_draw(ctl ,  ctl->sheets[h] , vx0 ,vy0 ,vx1 , vy1);
    }
}
