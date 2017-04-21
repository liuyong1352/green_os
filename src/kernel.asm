org 0x8000

mov ax , 0 
mov ss , ax 
mov ds , ax 
mov si , msg

show_msg:
    mov al , [si] 
    cmp al , 0 
    je fin
    mov ah , 0x0e
    mov bx , 15
    int 0x10
    inc si
    jmp show_msg
fin:
    hlt
    jmp fin   

msg:
    db "i'am come from kernel os !"
    db 0 

