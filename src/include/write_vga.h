#include <system.h>
#include <mm.h>
#include <sheet.h>
#include <graphic.h>
#include <timer.h>
#include <std.h>
#include <kernel.h>
#include <fifo.h>
#include <keyboard.h>


void int2hex(unsigned int x , char* buf) ;
/**
*	c 字体颜色 ， b 背景颜色 l 字符串长度
*/
void showString_sht(struct SHEET *sht ,int x , int y , int c , int b , char* s , int l ) ; 
