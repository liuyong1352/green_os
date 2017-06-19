#include <graphic.h>

extern char systemFont[16];

void putfont(char* vbuf , int xsize , int x, int y ,char color ,  char ch) {
	//8 * 16
    int i = 0 ; 
    char* p ;
	char* font = systemFont + (ch*16) ;    
    for( ; i < 16  ; i ++ ) { 
        char c = font[i] ;
        p = vbuf + (y + i ) *xsize  + x ; 
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

void showString(char* buf , int bxsize , int x , int y , char color , char* s) {
	
	for( ; *s !='\0' ; s++ ) { 
		putfont(buf ,bxsize,  x ,y ,color,  *s);
		x += 8 ;     
    }
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

void make_window8(char* buf , int bxsize , int bysize , char *title) {
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
    
	boxfill(buf, bxsize, COL8_C6C6C6, 0, 0, bxsize - 1, 0);
    boxfill(buf, bxsize, COL8_FFFFFF, 1, 1, bxsize - 2, 1);
    boxfill(buf, bxsize, COL8_C6C6C6, 0, 0, 0,         bysize - 1);
    boxfill(buf, bxsize, COL8_FFFFFF, 1, 1, 1,         bysize - 1);
    boxfill(buf, bxsize, COL8_848484, bxsize - 2, 1, bxsize - 2, bysize - 2);
    boxfill(buf, bxsize, COL8_000000, bxsize - 1, 0, bxsize - 1, bysize - 1);
    boxfill(buf, bxsize, COL8_C6C6C6, 2, 2, bxsize - 3, bysize - 3);
    boxfill(buf, bxsize, COL8_000084, 3, 3, bxsize - 4, 20);
    boxfill(buf, bxsize, COL8_848484, 1, bysize - 2, bxsize - 2, bysize - 2);
    boxfill(buf, bxsize, COL8_000000, 0, bysize - 1, bxsize - 1, bysize - 1);
    
    showString(buf , bxsize, 24, 4, COL8_FFFFFF, title);
	for (int y = 0; y < 14; y++) {
        for (int x = 0; x < 16; x++) {
            char c = closebtn[y][x];
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

            buf[(5+y) * bxsize + (bxsize - 21 + x)] = c;
        }

    }
}

void init_mouse(char* mouse , char bc) {
	static char cursor[16][16] = {
         "**************..",
         "*OOOOOOOOOOO*...",
         "*OOOOOOOOOO*....",
         "*OOOOOOOOO*.....",
         "*OOOOOOOO*......",
         "*OOOOOOO*.......",
         "*OOOOOOO*.......",
         "*OOOOOOOO*......",
         "*OOOO**OOO*.....",
         "*OOO*..*OOO*....",
         "*OO*....*OOO*...",
         "*O*......*OOO*..",
         "**........*OOO*.",
         "*..........*OOO*",
         "............*OO*",
         ".............***"
    };
	for(int y = 0 ; y < 16 ; y++ ){
		for(int x = 0 ; x < 16 ; x++ ){
			if(cursor[y][x] == '*') mouse[y * 16 + x] = COL8_000000 ; 
			if(cursor[y][x] == 'O') mouse[y * 16 + x] = COL8_FFFFFF ; 
			if(cursor[y][x] == '.') mouse[y * 16 + x] = bc ; 
		}
	}
	return ;
}

void make_textbox8(struct SHEET* sht, int x0, int y0, int sx, int sy, int c)
{
	int x1 = x0 + sx, y1 = y0 + sy;
	boxfill(sht->buf, sht->bxsize, COL8_848484, x0 - 2, y0 - 3, x1 + 1, y0 - 3);
	boxfill(sht->buf, sht->bxsize, COL8_848484, x0 - 3, y0 - 3, x0 - 3, y1 + 1);
	boxfill(sht->buf, sht->bxsize, COL8_FFFFFF, x0 - 3, y1 + 2, x1 + 1, y1 + 2);
	boxfill(sht->buf, sht->bxsize, COL8_FFFFFF, x1 + 2, y0 - 3, x1 + 2, y1 + 2);
	boxfill(sht->buf, sht->bxsize, COL8_000000, x0 - 1, y0 - 2, x1 + 0, y0 - 2);
	boxfill(sht->buf, sht->bxsize, COL8_000000, x0 - 2, y0 - 2, x0 - 2, y1 + 0);
	boxfill(sht->buf, sht->bxsize, COL8_C6C6C6, x0 - 2, y1 + 1, x1 + 0, y1 + 1);
	boxfill(sht->buf, sht->bxsize, COL8_C6C6C6, x1 + 1, y0 - 2, x1 + 1, y1 + 1);
	boxfill(sht->buf, sht->bxsize, c, x0 - 1, y0 - 1, x1 + 0, y1 + 0);
	return;
}
