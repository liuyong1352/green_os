%include "kernel_macro.inc" 
org 0x9000

jmp entry
[SECTION .gdt]
;                                  段基址          段界限                属性
LABEL_GDT:	    Descriptor        0,            0,                   0  
LABEL_DESC_CODE32:  Descriptor        0,            1,                 DA_C + DA_32
LABEL_DESC_VIDEO:   Descriptor     0B8000h,         0ffffh,            DA_DRW
LABEL_DESC_VRAM:    Descriptor     0,         0ffffffffh,            DA_DRW
LABEL_DESC_STACK:	Descriptor    0,         TopOfStack,            DA_DRW + DA_32

GdtLen     equ    $ - LABEL_GDT
GdtPtr     dw     GdtLen - 1
           dd     0

SelectorCode32    equ   LABEL_DESC_CODE32 - LABEL_GDT
SelectorVideo     equ   LABEL_DESC_VIDEO  - LABEL_GDT
SelectorVram      equ   LABEL_DESC_VRAM   - LABEL_GDT
SelectorStack     equ   LABEL_DESC_STACK  - LABEL_GDT

label_idt:
%rep 255
	Gate SelectorCode32 ,SpuriousHandler , 0 , DA_386IGate
%endrep

idtlen    equ $ - label_idt
idt_48:   dw idtlen - 1  ;idt limit= 0
		  dd 0  ;idt base = 0L ; 

[SECTION  .s16]
[BITS  16]
entry:
     mov   ax, cs
     mov   ds, ax
     mov   es, ax
     mov   ss, ax
     mov   sp, 0100h
	

	;switch vga
	 mov al , 0x13
	 mov ah , 0	
     int 0x10
	 ;reprogram the 8259's ,and it isn,t fun 
	mov al , 0x11
	out 0x20 ,al  ;send it to 8259-1
	 
 	out 0xA0 , al ;and to 8259A-2
	 
	mov al , 0x20 
	out 0x21, al 
	
	mov al , 0x28
	out 0xA1 ,al 
	
	mov al , 0x04
	out 0x21 , al
	
	mov al , 0x02
	out 0xA1 , al
	
	;mov al , 0x01
	mov al ,0x03
	out 0x21 ,al
	
	out 0xA1 ,al

	;mov al , 0xFF
	mov al , 11111101b ; 允许键盘中断
	out 0x21 , al
	mov al , 0xFF 
	out 0xA1 , al
	 	

     xor   eax, eax
     mov   ax,  cs
     shl   eax, 4
     add   eax, LABEL_SEG_CODE32
     mov   word [LABEL_DESC_CODE32 + 2], ax
     shr   eax, 16
     mov   byte [LABEL_DESC_CODE32 + 4], al
     mov   byte [LABEL_DESC_CODE32 + 7], ah

	;set stack for c language
	xor eax , eax 
	mov ax , cs 
	shl eax , 4
	add eax , LABEL_STACK
	
     xor   eax, eax
     mov   ax, ds
     shl   eax, 4
     add   eax,  LABEL_GDT
     mov   dword  [GdtPtr + 2], eax

	 lidt [idt_48]
     lgdt  [GdtPtr]

     cli   ;关中断

     in    al,  92h
     or    al,  00000010b
     out   92h, al

     mov   eax, cr0
     or    eax , 1
     mov   cr0, eax

     jmp   dword  SelectorCode32: 0

     [SECTION .s32]
     [BITS  32]
LABEL_SEG_CODE32:
	mov ax , SelectorStack
	mov ss , ax 
	mov esp , TopOfStack
	mov ax ,SelectorVram
	mov ds , ax 
	
	sti
	%include "_write_vga.asm"	
	%include "kernel_lib.asm"
	jmp $
_SpuriousHandler:
SpuriousHandler equ _SpuriousHandler - $$
	call intHandlerFromC
	iretd
	%include "sysFont.inc"
SegCode32Len   equ  $ - LABEL_SEG_CODE32
[SECTION .gs]
ALIGN 32
[BITS 32]
LABEL_STACK:
times 512 db 0 
TopOfStack equ $- LABEL_STACK
