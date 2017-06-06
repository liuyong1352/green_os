#ifndef _GRAPHIC_H
#define _GRAPHIC_H
#include <sheet.h>

void init_palette(void);
void putfont(char* vram , int xsize , int x, int y ,char color ,  char c); 
void showString(struct SHTCTL* ctl , struct SHEET* sht , int x ,int y , char color , char* s) ; 

#endif
