#ifndef _GRAPHIC_H
#define _GRAPHIC_H
#include <sheet.h>

#define  COL8_000000  0
#define  COL8_FF0000  1
#define  COL8_00FF00  2
#define  COL8_FFFF00  3
#define  COL8_0000FF  4
#define  COL8_FF00FF  5
#define  COL8_00FFFF  6
#define  COL8_FFFFFF  7
#define  COL8_C6C6C6  8
#define  COL8_840000  9
#define  COL8_008400  10
#define  COL8_848400  11
#define  COL8_000084  12
#define  COL8_840084  13
#define  COL8_008484  14
#define  COL8_848484  15

void init_palette(void);

void boxfill(char* buf , int bxsize , unsigned char color, int x0, int y0,int x1, int y1);
void init_screen(char* vbuf  ,int xsize , int ysize  );
void putfont(char* vbuf , int xsize , int x, int y ,char color ,  char c); 
void showString(char* buf , int xsize , int x ,int y , char color , char* s) ; 
void make_window8(char* buf , int bxsize , int bysize , char *title) ;
void init_mouse(char* mouse , char bc) ;
void make_textbox8(struct SHEET* sht, int x0, int y0, int sx, int sy, int c);
#endif
