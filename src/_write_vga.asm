; Disassembly of file: write_vga.o
; Fri May  5 18:06:46 2017
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






cmian:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-14H], 655360                 ; 0006 _ C7. 45, EC, 000A0000
        call    init_palette                            ; 000D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 320                    ; 0012 _ C7. 45, F0, 00000140
        mov     dword [ebp-0CH], 200                    ; 0019 _ C7. 45, F4, 000000C8
        mov     dword [ebp-18H], 655360                 ; 0020 _ C7. 45, E8, 000A0000
        jmp     ?_002                                   ; 0027 _ EB, 17

?_001:  mov     eax, dword [ebp-18H]                    ; 0029 _ 8B. 45, E8
        mov     dword [ebp-14H], eax                    ; 002C _ 89. 45, EC
        mov     eax, dword [ebp-18H]                    ; 002F _ 8B. 45, E8
        and     eax, 0FH                                ; 0032 _ 83. E0, 0F
        mov     edx, eax                                ; 0035 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0037 _ 8B. 45, EC
        mov     byte [eax], dl                          ; 003A _ 88. 10
        add     dword [ebp-18H], 1                      ; 003C _ 83. 45, E8, 01
?_002:  cmp     dword [ebp-18H], 720895                 ; 0040 _ 81. 7D, E8, 000AFFFF
        jle     ?_001                                   ; 0047 _ 7E, E0
?_003:  call    io_hlt                                  ; 0049 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 004E _ EB, F9
; cmian End of function

set_palette:; Function begin
        push    ebp                                     ; 0050 _ 55
        mov     ebp, esp                                ; 0051 _ 89. E5
        sub     esp, 24                                 ; 0053 _ 83. EC, 18
        call    io_load_eflags                          ; 0056 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 005B _ 89. 45, F4
        call    io_cli                                  ; 005E _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0063 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0066 _ FF. 75, 08
        push    968                                     ; 0069 _ 68, 000003C8
        call    io_out8                                 ; 006E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0073 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0076 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0079 _ 89. 45, F0
        jmp     ?_005                                   ; 007C _ EB, 65

?_004:  mov     eax, dword [ebp+10H]                    ; 007E _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0081 _ 0F B6. 00
        shr     al, 2                                   ; 0084 _ C0. E8, 02
        movzx   eax, al                                 ; 0087 _ 0F B6. C0
        sub     esp, 8                                  ; 008A _ 83. EC, 08
        push    eax                                     ; 008D _ 50
        push    969                                     ; 008E _ 68, 000003C9
        call    io_out8                                 ; 0093 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0098 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 009B _ 8B. 45, 10
        add     eax, 1                                  ; 009E _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 00A1 _ 0F B6. 00
        shr     al, 2                                   ; 00A4 _ C0. E8, 02
        movzx   eax, al                                 ; 00A7 _ 0F B6. C0
        sub     esp, 8                                  ; 00AA _ 83. EC, 08
        push    eax                                     ; 00AD _ 50
        push    969                                     ; 00AE _ 68, 000003C9
        call    io_out8                                 ; 00B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00B8 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 00BB _ 8B. 45, 10
        add     eax, 2                                  ; 00BE _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 00C1 _ 0F B6. 00
        shr     al, 2                                   ; 00C4 _ C0. E8, 02
        movzx   eax, al                                 ; 00C7 _ 0F B6. C0
        sub     esp, 8                                  ; 00CA _ 83. EC, 08
        push    eax                                     ; 00CD _ 50
        push    969                                     ; 00CE _ 68, 000003C9
        call    io_out8                                 ; 00D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D8 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 00DB _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 00DF _ 83. 45, F0, 01
?_005:  mov     eax, dword [ebp-10H]                    ; 00E3 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 00E6 _ 3B. 45, 0C
        jle     ?_004                                   ; 00E9 _ 7E, 93
        sub     esp, 12                                 ; 00EB _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 00EE _ FF. 75, F4
        call    io_store_eflags                         ; 00F1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F6 _ 83. C4, 10
        nop                                             ; 00F9 _ 90
        leave                                           ; 00FA _ C9
        ret                                             ; 00FB _ C3
; set_palette End of function

init_palette:; Function begin
        push    ebp                                     ; 00FC _ 55
        mov     ebp, esp                                ; 00FD _ 89. E5
        sub     esp, 8                                  ; 00FF _ 83. EC, 08
        sub     esp, 4                                  ; 0102 _ 83. EC, 04
        push    table_rgb.1522                          ; 0105 _ 68, 00000000(d)
        push    15                                      ; 010A _ 6A, 0F
        push    0                                       ; 010C _ 6A, 00
        call    set_palette                             ; 010E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0113 _ 83. C4, 10
        nop                                             ; 0116 _ 90
        leave                                           ; 0117 _ C9
        ret                                             ; 0118 _ C3
; init_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0119 _ 55
        mov     ebp, esp                                ; 011A _ 89. E5
        sub     esp, 20                                 ; 011C _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 011F _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0122 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0125 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0128 _ 89. 45, FC
        jmp     ?_009                                   ; 012B _ EB, 33

?_006:  mov     eax, dword [ebp+14H]                    ; 012D _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0130 _ 89. 45, F8
        jmp     ?_008                                   ; 0133 _ EB, 1F

?_007:  mov     eax, dword [ebp-4H]                     ; 0135 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0138 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 013C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 013E _ 8B. 45, F8
        add     eax, edx                                ; 0141 _ 01. D0
        mov     edx, eax                                ; 0143 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0145 _ 8B. 45, 08
        add     edx, eax                                ; 0148 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 014A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 014E _ 88. 02
        add     dword [ebp-8H], 1                       ; 0150 _ 83. 45, F8, 01
?_008:  mov     eax, dword [ebp-8H]                     ; 0154 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0157 _ 3B. 45, 1C
        jle     ?_007                                   ; 015A _ 7E, D9
        add     dword [ebp-4H], 1                       ; 015C _ 83. 45, FC, 01
?_009:  mov     eax, dword [ebp-4H]                     ; 0160 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0163 _ 3B. 45, 20
        jle     ?_006                                   ; 0166 _ 7E, C5
        nop                                             ; 0168 _ 90
        leave                                           ; 0169 _ C9
        ret                                             ; 016A _ C3
; boxfill8 End of function



table_rgb.1522:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0000 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........




