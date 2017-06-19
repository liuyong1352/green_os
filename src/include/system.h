#ifndef _SYSTEM_H
#define _SYSTEM_H

#define cli() __asm__ ("cli")
#define sti() __asm__ ("sti")
#define nop() __asm__ ("nop")

int	load_eflags();
void store_eflags(int eflags);

#endif
