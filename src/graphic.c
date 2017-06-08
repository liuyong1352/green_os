#include <graphic.h>

extern char systemFont[16];

void putfont(char* vram , int xsize , int x, int y ,char color ,  char ch) {
	//8 * 16
    int i = 0 ; 
    char* p ;
	char* font = systemFont + (ch*16) ;    
    for( ; i < 16  ; i ++ ) { 
        char c = font[i] ;
        p = vram + (y + i ) *xsize  + x ; 
        if(c & 0x80 ) p[0] = color ;
        if(c & 0x40 ) p[1] = color ;
        if(c & 0x20 ) p[2] = color ;
        if(c & 0x10 ) p[3] = color ;
        if(c & 0x08 ) p[4] = color ;
        if(c & 0x04 ) p[5] = color ;
        if(c & 0x02 ) p[6] = color ;
        if(c & 0x01 ) p[7] = color ;
    }   

}

void showString(struct SHTCTL* ctl , struct SHEET* sht , int x ,int y , char color , char* s){
	int vx0 = x  ; 
	for( ; *s !='\0' ; s++ ) { 
		putfont(sht->buf ,sht->bxsize,  x ,y ,color,  *s);
		x += 8 ;     
    }
	sheet_refresh(ctl , sht , vx0  , y  , x , y + 16 ) ;    
}

void boxfill(char* buf , int bxsize  , unsigned char c, int x0, int y0,int x1, int y1){
	
	int x, y ;
	for(y = y0 ; y <= y1 ; y++ ){
		for(x = x0 ; x <= x1 ; x++){
			buf[y*bxsize + x] = c ; 
		}
	}
}

void init_screen(char* buf  ,int xsize , int ysize  ){
	boxfill( buf , xsize, COL8_008484, 0, 0, xsize-1, ysize-29);
	boxfill( buf , xsize, COL8_C6C6C6, 0, ysize - 28 , xsize-1, ysize-28);
	boxfill( buf , xsize, COL8_FFFFFF, 0, ysize - 27 , xsize-1, ysize-27);
	boxfill( buf , xsize, COL8_C6C6C6, 0, ysize - 26 , xsize-1, ysize-1);

	boxfill( buf , xsize, COL8_FFFFFF, 3, ysize - 24 , 59, ysize-24);
	boxfill( buf , xsize, COL8_FFFFFF, 2, ysize - 24 , 2, ysize-4);
	boxfill( buf , xsize, COL8_848484, 4, ysize - 4 , 59, ysize-4);
	boxfill( buf , xsize, COL8_848484, 59, ysize - 23 , 59, ysize-5);
	boxfill( buf , xsize, COL8_000000, 2, ysize - 3 , 59, ysize-3);
	boxfill( buf , xsize, COL8_000000, 60, ysize - 24 , 60, ysize-3);
	
	boxfill( buf , xsize, COL8_848484, xsize -47, ysize - 24 , xsize-4, ysize-24);
	boxfill( buf , xsize, COL8_848484, xsize -47, ysize - 23 , xsize-47, ysize-3);
	boxfill( buf , xsize, COL8_FFFFFF, xsize -47, ysize - 3 , xsize-4, ysize-3);
	boxfill( buf , xsize, COL8_FFFFFF, xsize -3, ysize - 24 , xsize-3, ysize-3);
}
