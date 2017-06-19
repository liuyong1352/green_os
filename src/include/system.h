#ifndef _SYSTEM_H
#define _SYSTEM_H

#define PORT_KEYDAT 0x60 
#define PORT_KEYSTA 0x0064
#define PORT_KEYCMD 0x0064
#define KEYSTA_SEND_NOTREADY 0x02
#define KEYCMD_WRITE_MODE 0x60
#define KBC_MODE   0x47

#define KEYCMD_SENDTO_MOUSE 0xd4
#define MOUSECMD_ENABLE     0xf4

#define PIC1_OCW2 0x00a0
#define PIC0_OCW2 0x0020

#define cli() __asm__ ("cli")
#define sti() __asm__ ("sti")
#define nop() __asm__ ("nop")

void outb_p(int port , char data);
unsigned char inb_p(int port);
int	load_eflags();
void store_eflags(int eflags);

#endif
