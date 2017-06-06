%include "kernel_macro.inc" 
org 0x9000

jmp entry
[SECTION .gdt]
;                                  段基址          段界限                属性
LABEL_GDT:	    Descriptor        0,            0,                   0  
LABEL_DESC_CODE32:  Descriptor        0,           SegCode32Len- 1,                 DA_C + DA_32
;LABEL_DESC_CODE32:  Descriptor        0,           0ffffffffh,                 DA_C + DA_32
LABEL_DESC_VIDEO:   Descriptor     0B8000h,         0ffffh,            DA_DRW
LABEL_DESC_VRAM:    Descriptor     0,         0ffffffffh,            DA_DRW
LABEL_DESC_STACK:	Descriptor    0,         TopOfStack,            DA_DRWA + DA_32

GdtLen     equ    $ - LABEL_GDT
GdtPtr     dw     GdtLen - 1
           dd     0

SelectorCode32    equ   LABEL_DESC_CODE32 - LABEL_GDT
SelectorVideo     equ   LABEL_DESC_VIDEO  - LABEL_GDT
SelectorVram      equ   LABEL_DESC_VRAM   - LABEL_GDT
SelectorStack     equ   LABEL_DESC_STACK  - LABEL_GDT

label_idt:
%rep 33
	Gate SelectorCode32 ,SpuriousHandler , 0 , DA_386IGate
%endrep
.21h:
	Gate SelectorCode32 ,KeyBoardHandler , 0 , DA_386IGate
%rep 10
	Gate SelectorCode32 ,SpuriousHandler , 0 , DA_386IGate
%endrep
.2Ch:
	Gate SelectorCode32 ,MouseHandler , 0 , DA_386IGate

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

;look up int 15h 
SMAP_START:
	mov ebx ,0   		;Continuation Contains the "continuation value" to get the 
				;next run of physical memory ,This is the value returned by 
				;a previous call to this routine.  If this is the first call,
				;EBX must contain zero
	mov di , smap_buf
smap_loop:
	mov eax , 0x0E820
	mov ecx , 20 
	mov edx , 0x0534D4150 	;'SMAP' -  Used by the BIOS to verify the
			 	;caller is requesting the system map
				;information to be returned in ES:DI.
	int 0x15 
	;Regs.eflags & EFLAG_CARRY
	jc  smap_Error		;判断CF位，如果CF位设置为1，则表示出错
	add di , 20
	inc   dword [smap_size]
	cmp ebx , 0 
	jne smap_loop
	jmp smap_end  
smap_Error:
	mov dword [smap_size] , 0 
smap_end:
	;switch vga
	 mov al , 0x13
	 mov ah , 0	
     int 0x10
	
	cli   ;关中断
	 ;reprogram the 8259's ,and it isn,t fun 
	mov al , 0x11
	out 0x20 ,al  ;send it to 8259-1
	dw 0xeb ,0xeb;delay	 
 	out 0xA0 , al ;and to 8259A-2
	dw 0xeb ,0xeb;delay	 
	mov al , 0x20 
	out 0x21, al 
	
	dw 0xeb ,0xeb;delay	 
	 
	mov al , 0x28
	out 0xA1 ,al 
	
	dw 0xeb ,0xeb;delay	 
	mov al , 0x04
	out 0x21 , al
	
	dw 0xeb ,0xeb;delay	 
	mov al , 0x02
	out 0xA1 , al
	
	dw 0xeb ,0xeb;delay	 
	mov al , 0x01
	;mov al ,0x03
	out 0x21 ,al
	
	dw 0xeb ,0xeb;delay	 
	out 0xA1 ,al

	dw 0xeb ,0xeb;delay	 
	;mov al , 0xFF
	;mov al , 11111101b ; 允许键盘中断
	mov al , 11111001b ; 允许键盘中断
	out 021h , al
	dw 0xeb ,0xeb;delay	 
	;mov al , 0xFF 
	mov  al, 11101111b ;允许鼠标中断
	out 0A1h , al
	dw 0xeb ,0xeb
	 	

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

     lgdt  [GdtPtr]

	 ;prepare for loading IDT 
	xor eax ,eax
	mov ax ,ds 
	shl eax , 4
	add eax ,label_idt
	mov dword [idt_48 + 2 ] ,eax 
	lidt [idt_48]
	
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
	mov ax ,SelectorVideo
	mov gs ,ax 
	
	sti
;	call cmain
	%include "_cmain.asm"	
	%include "kernel_lib.asm"
	jmp $
_SpuriousHandler:
SpuriousHandler equ _SpuriousHandler - $$
	iretd
_KeyBoardHandler:
KeyBoardHandler equ _KeyBoardHandler - $$
	push es 
	push ds 
	pushad 
	mov eax ,esp 
	push eax 
	mov ax ,ss 
	mov ds , ax 
	mov es , ax 
	
	call intHandlerFromC
	pop eax 
	popad
	pop ds 
	pop es 
	iretd

_MouseHandler:
MouseHandler equ _MouseHandler - $$
	push es 
	push ds 
	pushad 
	mov eax ,esp 
	push eax 
	mov ax ,ss 
	mov ds , ax 
	mov es , ax 
	
	call intHandlerForMouse
	pop eax 
	popad
	pop ds 
	pop es
	iretd 
	%include "sysFont.inc"
smap_buf: 
	times 256 db 0
smap_size:  
	dd 0
SegCode32Len   equ  $ - LABEL_SEG_CODE32
[SECTION .gs]
ALIGN 32
[BITS 32]
LABEL_STACK:
times 4096 db 0 
TopOfStack equ $- LABEL_STACK
