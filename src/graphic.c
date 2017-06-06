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
	for( ; *s !='\0' ; s++ ) { 
        putfont(sht->buf ,sht->bxsize,  x ,y ,color,  *s);
		x += 8 ;     
    }
	sheet_refresh(ctl) ;    
}

