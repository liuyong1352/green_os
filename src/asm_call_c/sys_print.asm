extern _main;
[section .data]

arg1 dd 100
arg2 dd 2

[section .text]
global _start
global _sys_print:function

_start:
	mov eax ,[arg1]
	push eax 
	mov eax , [arg2]
	push eax
	call _main
	add esp , 8
	mov ebx , 0
	mov eax , 1
	int 0x80 
_sys_print:
	mov edx ,[esp + 8]
	mov ecx ,[esp + 4]
	mov ebx , 1
	mov eax , 4
	int 0x80
	ret
