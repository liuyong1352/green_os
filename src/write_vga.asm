cmian:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-0CH], 0                      ; 0006 _ C7. 45, F4, 00000000
        call    init_palette                            ; 000D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 655360                 ; 0012 _ C7. 45, F0, 000A0000
        jmp     ?_002                                   ; 0019 _ EB, 17

?_001:  mov     eax, dword [ebp-10H]                    ; 001B _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 001E _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 0021 _ 8B. 45, F0
        and     eax, 0FH                                ; 0024 _ 83. E0, 0F
        mov     edx, eax                                ; 0027 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0029 _ 8B. 45, F4
        mov     byte [eax], dl                          ; 002C _ 88. 10
        add     dword [ebp-10H], 1                      ; 002E _ 83. 45, F0, 01
?_002:  cmp     dword [ebp-10H], 720895                 ; 0032 _ 81. 7D, F0, 000AFFFF
        jle     ?_001                                   ; 0039 _ 7E, E0
?_003:  call    io_hlt                                  ; 003B _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 0040 _ EB, F9
; cmian End of function

set_palette:; Function begin
        push    ebp                                     ; 0042 _ 55
        mov     ebp, esp                                ; 0043 _ 89. E5
        sub     esp, 24                                 ; 0045 _ 83. EC, 18
        call    io_load_eflags                          ; 0048 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 004D _ 89. 45, F4
        call    io_cli                                  ; 0050 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0055 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0058 _ FF. 75, 08
        push    968                                     ; 005B _ 68, 000003C8
        call    io_out8                                 ; 0060 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0065 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0068 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 006B _ 89. 45, F0
        jmp     ?_005                                   ; 006E _ EB, 5C

?_004:  mov     eax, dword [ebp+10H]                    ; 0070 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0073 _ 0F B6. 00
        movzx   eax, al                                 ; 0076 _ 0F B6. C0
        sub     esp, 8                                  ; 0079 _ 83. EC, 08
        push    eax                                     ; 007C _ 50
        push    969                                     ; 007D _ 68, 000003C9
        call    io_out8                                 ; 0082 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0087 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 008A _ 8B. 45, 10
        add     eax, 1                                  ; 008D _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0090 _ 0F B6. 00
        movzx   eax, al                                 ; 0093 _ 0F B6. C0
        sub     esp, 8                                  ; 0096 _ 83. EC, 08
        push    eax                                     ; 0099 _ 50
        push    969                                     ; 009A _ 68, 000003C9
        call    io_out8                                 ; 009F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00A4 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 00A7 _ 8B. 45, 10
        add     eax, 2                                  ; 00AA _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 00AD _ 0F B6. 00
        movzx   eax, al                                 ; 00B0 _ 0F B6. C0
        sub     esp, 8                                  ; 00B3 _ 83. EC, 08
        push    eax                                     ; 00B6 _ 50
        push    969                                     ; 00B7 _ 68, 000003C9
        call    io_out8                                 ; 00BC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00C1 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 00C4 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 00C8 _ 83. 45, F0, 01
?_005:  mov     eax, dword [ebp-10H]                    ; 00CC _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 00CF _ 3B. 45, 0C
        jle     ?_004                                   ; 00D2 _ 7E, 9C
        sub     esp, 12                                 ; 00D4 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 00D7 _ FF. 75, F4
        call    io_store_eflags                         ; 00DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00DF _ 83. C4, 10
        nop                                             ; 00E2 _ 90
        leave                                           ; 00E3 _ C9
        ret                                             ; 00E4 _ C3
; set_palette End of function

init_palette:; Function begin
        push    ebp                                     ; 00E5 _ 55
        mov     ebp, esp                                ; 00E6 _ 89. E5
        sub     esp, 8                                  ; 00E8 _ 83. EC, 08
        sub     esp, 4                                  ; 00EB _ 83. EC, 04
        push    table_rgb.1512                          ; 00EE _ 68, 00000000(d)
        push    15                                      ; 00F3 _ 6A, 0F
        push    0                                       ; 00F5 _ 6A, 00
        call    set_palette                             ; 00F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00FC _ 83. C4, 10
        nop                                             ; 00FF _ 90
        leave                                           ; 0100 _ C9
        ret                                             ; 0101 _ C3
; init_palette End of function

table_rgb.1512:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0000 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........

