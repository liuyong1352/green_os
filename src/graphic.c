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

void make_window8(struct SHTCTL *shtctl, struct SHEET *sht,  char *title) {

    static char closebtn[14][16] = {
        "OOOOOOOOOOOOOOO@", 
        "OQQQQQQQQQQQQQ$@",
        "OQQQQQQQQQQQQQ$@",
        "OQQQ@@QQQQ@@QQ$@",
        "OQQQQ@@QQ@@QQQ$@",
        "OQQQQQ@@@@QQQQ$@",
        "OQQQQQQ@@QQQQQ$@",
        "OQQQQQ@@@@QQQQ$@",
        "OQQQQ@@QQ@@QQQ$@",
        "OQQQ@@QQQQ@@QQ$@",
        "OQQQQQQQQQQQQQ$@",
        "OQQQQQQQQQQQQQ$@",
        "O$$$$$$$$$$$$$$@",
        "@@@@@@@@@@@@@@@@"
    };

    int x, y;
    char c;
    int bxsize = sht->bxsize;
    int bysize = sht->bysize;
    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 0, 0, bxsize - 1, 0);
    boxfill8(sht->buf, bxsize, COL8_FFFFFF, 1, 1, bxsize - 2, 1);
    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 0, 0, 0,         bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_FFFFFF, 1, 1, 1,         bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_848484, bxsize - 2, 1, bxsize - 2, bysize - 2);
    boxfill8(sht->buf, bxsize, COL8_000000, bxsize - 1, 0, bxsize - 1, bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 2, 2, bxsize - 3, bysize - 3);
    boxfill8(sht->buf, bxsize, COL8_000084, 3, 3, bxsize - 4, 20);
    boxfill8(sht->buf, bxsize, COL8_848484, 1, bysize - 2, bxsize - 2, bysize - 2);
    boxfill8(sht->buf, bxsize, COL8_000000, 0, bysize - 1, bxsize - 1, bysize - 1);

    showString(shtctl, sht, 24, 4, COL8_FFFFFF, title);

    for (y = 0; y < 14; y++) {
        for (x = 0; x < 16; x++) {
            c = closebtn[y][x];
            if (c == '@') {
                c = COL8_000000;
            } else if (c == '$') {
                c = COL8_848484;
            } else if (c == 'Q') {
                c = COL8_C6C6C6;
            } 
            else {
                c = COL8_FFFFFF;
            }

            sht->buf[(5+y) * sht->bxsize + (sht->bxsize - 21 + x)] = c;
        }

    }

    return;
}
