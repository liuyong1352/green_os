%include "kernel_macro.inc" 
org 0x9000

jmp entry
[SECTION .gdt]
;                                  段基址          段界限                属性
LABEL_GDT:	    Descriptor        0,            0,                   0  
LABEL_DESC_CODE32:  Descriptor        0,            1,                 DA_C + DA_32
LABEL_DESC_VIDEO:   Descriptor     0B8000h,         0ffffh,            DA_DRW
LABEL_DESC_5M:	    Descriptor     050000h,         0ffffh,            DA_DRW

GdtLen     equ    $ - LABEL_GDT
GdtPtr     dw     GdtLen - 1
           dd     0

SelectorCode32    equ   LABEL_DESC_CODE32 -  LABEL_GDT
SelectorVideo     equ   LABEL_DESC_VIDEO  -  LABEL_GDT
Selector5M        equ   LABEL_DESC_5M     -  LABEL_GDT

[SECTION  .s16]
[BITS  16]
entry:
     mov   ax, cs
     mov   ds, ax
     mov   es, ax
     mov   ss, ax
     mov   sp, 0100h

     xor   eax, eax
     mov   ax,  cs
     shl   eax, 4
     add   eax, LABEL_SEG_CODE32
     mov   word [LABEL_DESC_CODE32 + 2], ax
     shr   eax, 16
     mov   byte [LABEL_DESC_CODE32 + 4], al
     mov   byte [LABEL_DESC_CODE32 + 7], ah

     xor   eax, eax
     mov   ax, ds
     shl   eax, 4
     add   eax,  LABEL_GDT
     mov   dword  [GdtPtr + 2], eax

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
;write data to 5 M
;write data to 5 M
	mov ax , Selector5M
	mov gs , ax 
	mov es , ax
	mov si , msg
	mov edi , 0
writeDataTo5M:
	cmp byte [ds:si] , 0 
	je showCharEntry
	mov al , [ds:si]
	mov byte [es:edi] , al 	
	inc si 
	inc edi 
	jmp writeDataTo5M

showCharEntry:
	mov si , 0 
	call print_str
	jmp end
;================================================
;gs:si
print_str:
	push si
	push edi 
	mov ax , SelectorVideo
	mov es , ax 
	mov edi , 160*20 + 20*2
	
print_loop:
	mov al , [gs:si]
	cmp al , 0 
	je print_str_ret
	mov ah , 0ch 
	mov [es:edi] , ax
	inc si 
	add edi , 2
	jmp print_loop 
print_str_ret: 
	pop edi
	pop si 	
	ret


end: 
	hlt
	jmp end
    msg:
    DB     "this sentence will be writen to 5M seg", 0

SegCode32Len   equ  $ - LABEL_SEG_CODE32
