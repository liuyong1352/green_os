#ifndef _STD_H
#define _STD_H

#define PIC0_OCW2 0x0020

void outb_p(int port , char data);
unsigned char inb_p(int port);

int delay(long millis) ; 
void printd(char* s) ;
void printx(char c) ; 
void printi(int i) ; 

#endif 
