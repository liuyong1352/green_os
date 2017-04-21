org 0x7C00 ;
; hello-os
; TAB=4

; 标准FAT12格式软盘专用的代码 Stand FAT12 format floppy code
jmp entry
	DB	0xeb,0x4e,0x90
		DB		"greenos "		; 启动扇区名称（8字节）
		DW		512				; 每个扇区（sector）大小（必须512字节）
		DB		1				; 簇（cluster）大小（必须为1个扇区）
		DW		1				; FAT起始位置（一般为第一个扇区）
		DB		2				; FAT个数（必须为2）
		DW		224				; 根目录大小（一般为224项）
		DW		2880			; 该磁盘大小（必须为2880扇区1440*1024/512）
		DB		0xf0			; 磁盘类型（必须为0xf0）
		DW		9				; FAT的长度（必??9扇区）
		DW		18				; 一个磁道（track）有几个扇区（必须为18）
		DW		2				; 磁头数（必??2）
		DD		0				; 不使用分区，必须是0
		DD		2880			; 重写一次磁盘大小
		DB		0,0,0x29		; 意义不明（固定）
		DD		0xffffffff		; （可能是）卷标号码
		DB		"HELLO-OS   "	; 磁盘的名称（必须为11字?，不足填空格）
		DB		"FAT12   "		; 磁盘格式名称（必??8字?，不足填空格）
		times	18		db 0    ; 先空出18字节

; 程序主体
entry:	
	mov ax , 0
	mov ss , ax 
	mov ds , ax 
	mov es , ax 
	mov si , buf

readFloppy:
	mov bx , buf
	mov ah , 0x02  ;read disk secotrs
	mov al , 1     ;number of sectors transferred 
	mov dl , 0     ;drive number
	mov dh , 0     ; head number
	mov ch , 0     ; track number
	mov cl , 2     ; secktor number
	int 0x13	
	
	mov si , buf
	
show_msg:
	mov al , [si]
	inc si 
	cmp al , 0 
	je fin 
	mov ah , 0x0e
	mov bx , 22
	int 0x10
	jmp show_msg
fin:
	hlt
	jmp fin 		
buf:
	resb 64
	db 0 
; 信息显示部分


	times	0x1fe-($ - $$) db 0 ; 填写0x00直到0x001fe  1fe = 510

	DB		0x55, 0xaa

; 启动扇区以外部分输出
