;void io_hlt()
io_hlt:		hlt
	ret

;char io_in8(int port)
inb_p:
	mov edx , [esp + 4]
	mov eax , 0 
	in al , dx 
	ret 

io_in16:
    mov  edx, [esp + 4]
    mov  eax, 0
    in   ax, dx
	ret

io_in32:
    mov edx, [esp + 4]
    in  eax, dx
    ret
outb_p:
    mov edx, [esp + 4]
    mov al, [esp + 8]
    out dx, al
    ret
io_out16:
    mov edx, [esp + 4]
    mov eax, [esp + 8]
    out dx, ax
    ret

io_out32:
    mov edx, [esp + 4]
    mov eax, [esp + 8]
    out dx, eax
    ret

io_cli:
    cli
    ret
io_load_eflags:
    pushfd
    pop  eax
    ret

io_store_eflags:
    mov eax, [esp + 4]
    push eax
    popfd
    ret

get_smap_buf:
	mov eax , smap_buf
	ret
