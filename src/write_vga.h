#define FLAGS_OVERRUN 0x01
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

#define PIC0_OCW2 0x0020
#define PIC1_OCW2 0x00a0

#define PORT_KEYDAT 0x60 
#define PORT_KEYSTA 0x0064
#define PORT_KEYCMD 0x0064
#define KEYSTA_SEND_NOTREADY 0x02
#define KEYCMD_WRITE_MODE 0x60
#define KBC_MODE   0x47

#define KEYCMD_SENDTO_MOUSE 0xd4
#define MOUSECMD_ENABLE     0xf4

#define asm_cli     __asm__ ("cli")
#define asm_sti     __asm__ ("sti")	
#define asm_stihlt  __asm__ ("sti;hlt")

void wait_KBC_sendready() ;
void init_keyboard();
void enable_mouse(); 

void init_screen();
void drawFont(unsigned char col , int px , int py  , char c);
void printd(char* s) ;
