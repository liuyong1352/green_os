org 0x7C00 ;
LOAD_ADDR equ 0x9000
jmp entry
     	DB	0xeb,0x4e,0x90
		DB		"greenos "
		DW		512	
		DB		1			
		DW		1	
		DB		2		
		DW		224		
		DW		2880	
		DB		0xf0		
		DW		9		
		DW		18			
		DW		2				
		DD		0				
		DD		2880			
		DB		0,0,0x29		
		DD		0xffffffff	
		DB		"HELLO-OS   "	
		DB		"FAT12   "		
		times	18		db 0    
entry:	
	mov ax , 0
	mov ss , ax 
	mov ds , ax 
	mov es , ax 
	
	mov bx , LOAD_ADDR
	mov ch , 0     ; track number
readFloppy:
	cmp byte [load_count]  , 0
	je startKernel
	mov ah , 0x02  ;read disk secotrs
	mov al , 18    ;number of sectors transferred 
	mov dl , 0     ;drive number
	mov dh , 1     ; head number
	mov cl , 1     ; secktor number
	int 0x13	
	dec byte [load_count] 
	inc ch
	;note need add bx  and then jmp loop 
	add bx , 512*18
	jmp readFloppy 
startKernel:
	jmp LOAD_ADDR
load_count  DB 2 
	times	0x1fe-($ - $$) db 0 ;
	DB		0x55, 0xaa
