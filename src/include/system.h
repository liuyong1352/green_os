#ifndef _SYSTEM_H
#define _SYSTEM_H

#define cli() __asm__ ("cli")
#define sti() __asm__ ("sti")
#define nop() __asm__ ("nop")

int io_load_eflags();
void io_store_eflags(int eflags);

#endif
