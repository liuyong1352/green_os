; Disassembly of file: write_vga.o
; Fri May 12 12:56:36 2017
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






cmian:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 4                                  ; 0004 _ 83. EC, 04
        call    init_palette                            ; 0007 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ysize]                      ; 000C _ A1, 00000000(d)
        lea     edx, [eax-1DH]                          ; 0011 _ 8D. 50, E3
        mov     eax, dword [xsize]                      ; 0014 _ A1, 00000000(d)
        sub     eax, 1                                  ; 0019 _ 83. E8, 01
        sub     esp, 12                                 ; 001C _ 83. EC, 0C
        push    edx                                     ; 001F _ 52
        push    eax                                     ; 0020 _ 50
        push    0                                       ; 0021 _ 6A, 00
        push    0                                       ; 0023 _ 6A, 00
        push    14                                      ; 0025 _ 6A, 0E
        call    boxfill8                                ; 0027 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 002C _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 002F _ A1, 00000000(d)
        lea     ecx, [eax-1CH]                          ; 0034 _ 8D. 48, E4
        mov     eax, dword [xsize]                      ; 0037 _ A1, 00000000(d)
        lea     edx, [eax-1H]                           ; 003C _ 8D. 50, FF
        mov     eax, dword [ysize]                      ; 003F _ A1, 00000000(d)
        sub     eax, 28                                 ; 0044 _ 83. E8, 1C
        sub     esp, 12                                 ; 0047 _ 83. EC, 0C
        push    ecx                                     ; 004A _ 51
        push    edx                                     ; 004B _ 52
        push    eax                                     ; 004C _ 50
        push    0                                       ; 004D _ 6A, 00
        push    8                                       ; 004F _ 6A, 08
        call    boxfill8                                ; 0051 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0056 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0059 _ A1, 00000000(d)
        lea     ecx, [eax-1BH]                          ; 005E _ 8D. 48, E5
        mov     eax, dword [xsize]                      ; 0061 _ A1, 00000000(d)
        lea     edx, [eax-1H]                           ; 0066 _ 8D. 50, FF
        mov     eax, dword [ysize]                      ; 0069 _ A1, 00000000(d)
        sub     eax, 27                                 ; 006E _ 83. E8, 1B
        sub     esp, 12                                 ; 0071 _ 83. EC, 0C
        push    ecx                                     ; 0074 _ 51
        push    edx                                     ; 0075 _ 52
        push    eax                                     ; 0076 _ 50
        push    0                                       ; 0077 _ 6A, 00
        push    7                                       ; 0079 _ 6A, 07
        call    boxfill8                                ; 007B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0080 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0083 _ A1, 00000000(d)
        lea     ecx, [eax-1H]                           ; 0088 _ 8D. 48, FF
        mov     eax, dword [xsize]                      ; 008B _ A1, 00000000(d)
        lea     edx, [eax-1H]                           ; 0090 _ 8D. 50, FF
        mov     eax, dword [ysize]                      ; 0093 _ A1, 00000000(d)
        sub     eax, 26                                 ; 0098 _ 83. E8, 1A
        sub     esp, 12                                 ; 009B _ 83. EC, 0C
        push    ecx                                     ; 009E _ 51
        push    edx                                     ; 009F _ 52
        push    eax                                     ; 00A0 _ 50
        push    0                                       ; 00A1 _ 6A, 00
        push    8                                       ; 00A3 _ 6A, 08
        call    boxfill8                                ; 00A5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00AA _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 00AD _ A1, 00000000(d)
        lea     edx, [eax-18H]                          ; 00B2 _ 8D. 50, E8
        mov     eax, dword [ysize]                      ; 00B5 _ A1, 00000000(d)
        sub     eax, 24                                 ; 00BA _ 83. E8, 18
        sub     esp, 12                                 ; 00BD _ 83. EC, 0C
        push    edx                                     ; 00C0 _ 52
        push    59                                      ; 00C1 _ 6A, 3B
        push    eax                                     ; 00C3 _ 50
        push    3                                       ; 00C4 _ 6A, 03
        push    7                                       ; 00C6 _ 6A, 07
        call    boxfill8                                ; 00C8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00CD _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 00D0 _ A1, 00000000(d)
        lea     edx, [eax-4H]                           ; 00D5 _ 8D. 50, FC
        mov     eax, dword [ysize]                      ; 00D8 _ A1, 00000000(d)
        sub     eax, 24                                 ; 00DD _ 83. E8, 18
        sub     esp, 12                                 ; 00E0 _ 83. EC, 0C
        push    edx                                     ; 00E3 _ 52
        push    2                                       ; 00E4 _ 6A, 02
        push    eax                                     ; 00E6 _ 50
        push    2                                       ; 00E7 _ 6A, 02
        push    7                                       ; 00E9 _ 6A, 07
        call    boxfill8                                ; 00EB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00F0 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 00F3 _ A1, 00000000(d)
        lea     edx, [eax-4H]                           ; 00F8 _ 8D. 50, FC
        mov     eax, dword [ysize]                      ; 00FB _ A1, 00000000(d)
        sub     eax, 4                                  ; 0100 _ 83. E8, 04
        sub     esp, 12                                 ; 0103 _ 83. EC, 0C
        push    edx                                     ; 0106 _ 52
        push    59                                      ; 0107 _ 6A, 3B
        push    eax                                     ; 0109 _ 50
        push    4                                       ; 010A _ 6A, 04
        push    15                                      ; 010C _ 6A, 0F
        call    boxfill8                                ; 010E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0113 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0116 _ A1, 00000000(d)
        lea     edx, [eax-5H]                           ; 011B _ 8D. 50, FB
        mov     eax, dword [ysize]                      ; 011E _ A1, 00000000(d)
        sub     eax, 23                                 ; 0123 _ 83. E8, 17
        sub     esp, 12                                 ; 0126 _ 83. EC, 0C
        push    edx                                     ; 0129 _ 52
        push    59                                      ; 012A _ 6A, 3B
        push    eax                                     ; 012C _ 50
        push    59                                      ; 012D _ 6A, 3B
        push    15                                      ; 012F _ 6A, 0F
        call    boxfill8                                ; 0131 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0136 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0139 _ A1, 00000000(d)
        lea     edx, [eax-3H]                           ; 013E _ 8D. 50, FD
        mov     eax, dword [ysize]                      ; 0141 _ A1, 00000000(d)
        sub     eax, 3                                  ; 0146 _ 83. E8, 03
        sub     esp, 12                                 ; 0149 _ 83. EC, 0C
        push    edx                                     ; 014C _ 52
        push    59                                      ; 014D _ 6A, 3B
        push    eax                                     ; 014F _ 50
        push    2                                       ; 0150 _ 6A, 02
        push    0                                       ; 0152 _ 6A, 00
        call    boxfill8                                ; 0154 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0159 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 015C _ A1, 00000000(d)
        lea     edx, [eax-3H]                           ; 0161 _ 8D. 50, FD
        mov     eax, dword [ysize]                      ; 0164 _ A1, 00000000(d)
        sub     eax, 24                                 ; 0169 _ 83. E8, 18
        sub     esp, 12                                 ; 016C _ 83. EC, 0C
        push    edx                                     ; 016F _ 52
        push    60                                      ; 0170 _ 6A, 3C
        push    eax                                     ; 0172 _ 50
        push    60                                      ; 0173 _ 6A, 3C
        push    0                                       ; 0175 _ 6A, 00
        call    boxfill8                                ; 0177 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 017C _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 017F _ A1, 00000000(d)
        lea     ebx, [eax-18H]                          ; 0184 _ 8D. 58, E8
        mov     eax, dword [xsize]                      ; 0187 _ A1, 00000000(d)
        lea     ecx, [eax-4H]                           ; 018C _ 8D. 48, FC
        mov     eax, dword [ysize]                      ; 018F _ A1, 00000000(d)
        lea     edx, [eax-18H]                          ; 0194 _ 8D. 50, E8
        mov     eax, dword [xsize]                      ; 0197 _ A1, 00000000(d)
        sub     eax, 47                                 ; 019C _ 83. E8, 2F
        sub     esp, 12                                 ; 019F _ 83. EC, 0C
        push    ebx                                     ; 01A2 _ 53
        push    ecx                                     ; 01A3 _ 51
        push    edx                                     ; 01A4 _ 52
        push    eax                                     ; 01A5 _ 50
        push    15                                      ; 01A6 _ 6A, 0F
        call    boxfill8                                ; 01A8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01AD _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 01B0 _ A1, 00000000(d)
        lea     ebx, [eax-3H]                           ; 01B5 _ 8D. 58, FD
        mov     eax, dword [xsize]                      ; 01B8 _ A1, 00000000(d)
        lea     ecx, [eax-2FH]                          ; 01BD _ 8D. 48, D1
        mov     eax, dword [ysize]                      ; 01C0 _ A1, 00000000(d)
        lea     edx, [eax-17H]                          ; 01C5 _ 8D. 50, E9
        mov     eax, dword [xsize]                      ; 01C8 _ A1, 00000000(d)
        sub     eax, 47                                 ; 01CD _ 83. E8, 2F
        sub     esp, 12                                 ; 01D0 _ 83. EC, 0C
        push    ebx                                     ; 01D3 _ 53
        push    ecx                                     ; 01D4 _ 51
        push    edx                                     ; 01D5 _ 52
        push    eax                                     ; 01D6 _ 50
        push    15                                      ; 01D7 _ 6A, 0F
        call    boxfill8                                ; 01D9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01DE _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 01E1 _ A1, 00000000(d)
        lea     ebx, [eax-3H]                           ; 01E6 _ 8D. 58, FD
        mov     eax, dword [xsize]                      ; 01E9 _ A1, 00000000(d)
        lea     ecx, [eax-4H]                           ; 01EE _ 8D. 48, FC
        mov     eax, dword [ysize]                      ; 01F1 _ A1, 00000000(d)
        lea     edx, [eax-3H]                           ; 01F6 _ 8D. 50, FD
        mov     eax, dword [xsize]                      ; 01F9 _ A1, 00000000(d)
        sub     eax, 47                                 ; 01FE _ 83. E8, 2F
        sub     esp, 12                                 ; 0201 _ 83. EC, 0C
        push    ebx                                     ; 0204 _ 53
        push    ecx                                     ; 0205 _ 51
        push    edx                                     ; 0206 _ 52
        push    eax                                     ; 0207 _ 50
        push    7                                       ; 0208 _ 6A, 07
        call    boxfill8                                ; 020A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 020F _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0212 _ A1, 00000000(d)
        lea     ebx, [eax-3H]                           ; 0217 _ 8D. 58, FD
        mov     eax, dword [xsize]                      ; 021A _ A1, 00000000(d)
        lea     ecx, [eax-3H]                           ; 021F _ 8D. 48, FD
        mov     eax, dword [ysize]                      ; 0222 _ A1, 00000000(d)
        lea     edx, [eax-18H]                          ; 0227 _ 8D. 50, E8
        mov     eax, dword [xsize]                      ; 022A _ A1, 00000000(d)
        sub     eax, 3                                  ; 022F _ 83. E8, 03
        sub     esp, 12                                 ; 0232 _ 83. EC, 0C
        push    ebx                                     ; 0235 _ 53
        push    ecx                                     ; 0236 _ 51
        push    edx                                     ; 0237 _ 52
        push    eax                                     ; 0238 _ 50
        push    7                                       ; 0239 _ 6A, 07
        call    boxfill8                                ; 023B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0240 _ 83. C4, 20
        push    ?_020                                   ; 0243 _ 68, 00000000(d)
        push    16                                      ; 0248 _ 6A, 10
        push    16                                      ; 024A _ 6A, 10
        push    7                                       ; 024C _ 6A, 07
        call    showString                              ; 024E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0253 _ 83. C4, 10
        push    ?_021                                   ; 0256 _ 68, 00000011(d)
        push    0                                       ; 025B _ 6A, 00
        push    8                                       ; 025D _ 6A, 08
        push    7                                       ; 025F _ 6A, 07
        call    showString                              ; 0261 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0266 _ 83. C4, 10
?_001:  call    io_hlt                                  ; 0269 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 026E _ EB, F9
; cmian End of function

set_palette:; Function begin
        push    ebp                                     ; 0270 _ 55
        mov     ebp, esp                                ; 0271 _ 89. E5
        sub     esp, 24                                 ; 0273 _ 83. EC, 18
        call    io_load_eflags                          ; 0276 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 027B _ 89. 45, F4
        call    io_cli                                  ; 027E _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0283 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0286 _ FF. 75, 08
        push    968                                     ; 0289 _ 68, 000003C8
        call    io_out8                                 ; 028E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0293 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0296 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0299 _ 89. 45, F0
        jmp     ?_003                                   ; 029C _ EB, 65

?_002:  mov     eax, dword [ebp+10H]                    ; 029E _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 02A1 _ 0F B6. 00
        shr     al, 2                                   ; 02A4 _ C0. E8, 02
        movzx   eax, al                                 ; 02A7 _ 0F B6. C0
        sub     esp, 8                                  ; 02AA _ 83. EC, 08
        push    eax                                     ; 02AD _ 50
        push    969                                     ; 02AE _ 68, 000003C9
        call    io_out8                                 ; 02B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02B8 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 02BB _ 8B. 45, 10
        add     eax, 1                                  ; 02BE _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 02C1 _ 0F B6. 00
        shr     al, 2                                   ; 02C4 _ C0. E8, 02
        movzx   eax, al                                 ; 02C7 _ 0F B6. C0
        sub     esp, 8                                  ; 02CA _ 83. EC, 08
        push    eax                                     ; 02CD _ 50
        push    969                                     ; 02CE _ 68, 000003C9
        call    io_out8                                 ; 02D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02D8 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 02DB _ 8B. 45, 10
        add     eax, 2                                  ; 02DE _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 02E1 _ 0F B6. 00
        shr     al, 2                                   ; 02E4 _ C0. E8, 02
        movzx   eax, al                                 ; 02E7 _ 0F B6. C0
        sub     esp, 8                                  ; 02EA _ 83. EC, 08
        push    eax                                     ; 02ED _ 50
        push    969                                     ; 02EE _ 68, 000003C9
        call    io_out8                                 ; 02F3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02F8 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 02FB _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 02FF _ 83. 45, F0, 01
?_003:  mov     eax, dword [ebp-10H]                    ; 0303 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0306 _ 3B. 45, 0C
        jle     ?_002                                   ; 0309 _ 7E, 93
        sub     esp, 12                                 ; 030B _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 030E _ FF. 75, F4
        call    io_store_eflags                         ; 0311 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0316 _ 83. C4, 10
        nop                                             ; 0319 _ 90
        leave                                           ; 031A _ C9
        ret                                             ; 031B _ C3
; set_palette End of function

init_palette:; Function begin
        push    ebp                                     ; 031C _ 55
        mov     ebp, esp                                ; 031D _ 89. E5
        sub     esp, 8                                  ; 031F _ 83. EC, 08
        sub     esp, 4                                  ; 0322 _ 83. EC, 04
        push    table_rgb.1533                          ; 0325 _ 68, 00000020(d)
        push    15                                      ; 032A _ 6A, 0F
        push    0                                       ; 032C _ 6A, 00
        call    set_palette                             ; 032E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0333 _ 83. C4, 10
        nop                                             ; 0336 _ 90
        leave                                           ; 0337 _ C9
        ret                                             ; 0338 _ C3
; init_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0339 _ 55
        mov     ebp, esp                                ; 033A _ 89. E5
        sub     esp, 20                                 ; 033C _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 033F _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0342 _ 88. 45, EC
        mov     eax, dword [ebp+10H]                    ; 0345 _ 8B. 45, 10
        mov     dword [ebp-4H], eax                     ; 0348 _ 89. 45, FC
        jmp     ?_007                                   ; 034B _ EB, 36

?_004:  mov     eax, dword [ebp+0CH]                    ; 034D _ 8B. 45, 0C
        mov     dword [ebp-8H], eax                     ; 0350 _ 89. 45, F8
        jmp     ?_006                                   ; 0353 _ EB, 22

?_005:  mov     edx, dword [vram]                       ; 0355 _ 8B. 15, 00000000(d)
        mov     eax, dword [xsize]                      ; 035B _ A1, 00000000(d)
        imul    eax, dword [ebp-4H]                     ; 0360 _ 0F AF. 45, FC
        mov     ecx, eax                                ; 0364 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 0366 _ 8B. 45, F8
        add     eax, ecx                                ; 0369 _ 01. C8
        add     edx, eax                                ; 036B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 036D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0371 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0373 _ 83. 45, F8, 01
?_006:  mov     eax, dword [ebp-8H]                     ; 0377 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 037A _ 3B. 45, 14
        jle     ?_005                                   ; 037D _ 7E, D6
        add     dword [ebp-4H], 1                       ; 037F _ 83. 45, FC, 01
?_007:  mov     eax, dword [ebp-4H]                     ; 0383 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0386 _ 3B. 45, 18
        jle     ?_004                                   ; 0389 _ 7E, C2
        nop                                             ; 038B _ 90
        leave                                           ; 038C _ C9
        ret                                             ; 038D _ C3
; boxfill8 End of function

putfont:; Function begin
        push    ebp                                     ; 038E _ 55
        mov     ebp, esp                                ; 038F _ 89. E5
        sub     esp, 20                                 ; 0391 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0394 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0397 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 039A _ C7. 45, F8, 00000000
        jmp     ?_017                                   ; 03A1 _ E9, 000000E4

?_008:  mov     edx, dword [ebp-8H]                     ; 03A6 _ 8B. 55, F8
        mov     eax, dword [ebp+14H]                    ; 03A9 _ 8B. 45, 14
        add     eax, edx                                ; 03AC _ 01. D0
        movzx   eax, byte [eax]                         ; 03AE _ 0F B6. 00
        mov     byte [ebp-9H], al                       ; 03B1 _ 88. 45, F7
        mov     eax, dword [vram]                       ; 03B4 _ A1, 00000000(d)
        mov     ecx, dword [ebp+10H]                    ; 03B9 _ 8B. 4D, 10
        mov     edx, dword [ebp-8H]                     ; 03BC _ 8B. 55, F8
        add     ecx, edx                                ; 03BF _ 01. D1
        mov     edx, dword [xsize]                      ; 03C1 _ 8B. 15, 00000000(d)
        imul    edx, ecx                                ; 03C7 _ 0F AF. D1
        mov     ecx, edx                                ; 03CA _ 89. D1
        mov     edx, dword [ebp+0CH]                    ; 03CC _ 8B. 55, 0C
        add     edx, ecx                                ; 03CF _ 01. CA
        add     eax, edx                                ; 03D1 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 03D3 _ 89. 45, FC
        cmp     byte [ebp-9H], 0                        ; 03D6 _ 80. 7D, F7, 00
        jns     ?_009                                   ; 03DA _ 79, 09
        movzx   edx, byte [ebp-14H]                     ; 03DC _ 0F B6. 55, EC
        mov     eax, dword [ebp-4H]                     ; 03E0 _ 8B. 45, FC
        mov     byte [eax], dl                          ; 03E3 _ 88. 10
?_009:  movsx   eax, byte [ebp-9H]                      ; 03E5 _ 0F BE. 45, F7
        and     eax, 40H                                ; 03E9 _ 83. E0, 40
        test    eax, eax                                ; 03EC _ 85. C0
        jz      ?_010                                   ; 03EE _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 03F0 _ 8B. 45, FC
        lea     edx, [eax+1H]                           ; 03F3 _ 8D. 50, 01
        movzx   eax, byte [ebp-14H]                     ; 03F6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 03FA _ 88. 02
?_010:  movsx   eax, byte [ebp-9H]                      ; 03FC _ 0F BE. 45, F7
        and     eax, 20H                                ; 0400 _ 83. E0, 20
        test    eax, eax                                ; 0403 _ 85. C0
        jz      ?_011                                   ; 0405 _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 0407 _ 8B. 45, FC
        lea     edx, [eax+2H]                           ; 040A _ 8D. 50, 02
        movzx   eax, byte [ebp-14H]                     ; 040D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0411 _ 88. 02
?_011:  movsx   eax, byte [ebp-9H]                      ; 0413 _ 0F BE. 45, F7
        and     eax, 10H                                ; 0417 _ 83. E0, 10
        test    eax, eax                                ; 041A _ 85. C0
        jz      ?_012                                   ; 041C _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 041E _ 8B. 45, FC
        lea     edx, [eax+3H]                           ; 0421 _ 8D. 50, 03
        movzx   eax, byte [ebp-14H]                     ; 0424 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0428 _ 88. 02
?_012:  movsx   eax, byte [ebp-9H]                      ; 042A _ 0F BE. 45, F7
        and     eax, 08H                                ; 042E _ 83. E0, 08
        test    eax, eax                                ; 0431 _ 85. C0
        jz      ?_013                                   ; 0433 _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 0435 _ 8B. 45, FC
        lea     edx, [eax+4H]                           ; 0438 _ 8D. 50, 04
        movzx   eax, byte [ebp-14H]                     ; 043B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 043F _ 88. 02
?_013:  movsx   eax, byte [ebp-9H]                      ; 0441 _ 0F BE. 45, F7
        and     eax, 04H                                ; 0445 _ 83. E0, 04
        test    eax, eax                                ; 0448 _ 85. C0
        jz      ?_014                                   ; 044A _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 044C _ 8B. 45, FC
        lea     edx, [eax+5H]                           ; 044F _ 8D. 50, 05
        movzx   eax, byte [ebp-14H]                     ; 0452 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0456 _ 88. 02
?_014:  movsx   eax, byte [ebp-9H]                      ; 0458 _ 0F BE. 45, F7
        and     eax, 02H                                ; 045C _ 83. E0, 02
        test    eax, eax                                ; 045F _ 85. C0
        jz      ?_015                                   ; 0461 _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 0463 _ 8B. 45, FC
        lea     edx, [eax+6H]                           ; 0466 _ 8D. 50, 06
        movzx   eax, byte [ebp-14H]                     ; 0469 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 046D _ 88. 02
?_015:  movsx   eax, byte [ebp-9H]                      ; 046F _ 0F BE. 45, F7
        and     eax, 01H                                ; 0473 _ 83. E0, 01
        test    eax, eax                                ; 0476 _ 85. C0
        jz      ?_016                                   ; 0478 _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 047A _ 8B. 45, FC
        lea     edx, [eax+7H]                           ; 047D _ 8D. 50, 07
        movzx   eax, byte [ebp-14H]                     ; 0480 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0484 _ 88. 02
?_016:  add     dword [ebp-8H], 1                       ; 0486 _ 83. 45, F8, 01
?_017:  cmp     dword [ebp-8H], 15                      ; 048A _ 83. 7D, F8, 0F
        jle     ?_008                                   ; 048E _ 0F 8E, FFFFFF12
        nop                                             ; 0494 _ 90
        leave                                           ; 0495 _ C9
        ret                                             ; 0496 _ C3
; putfont End of function

drawFont:; Function begin
        push    ebp                                     ; 0497 _ 55
        mov     ebp, esp                                ; 0498 _ 89. E5
        sub     esp, 8                                  ; 049A _ 83. EC, 08
        mov     edx, dword [ebp+8H]                     ; 049D _ 8B. 55, 08
        mov     eax, dword [ebp+14H]                    ; 04A0 _ 8B. 45, 14
        mov     byte [ebp-4H], dl                       ; 04A3 _ 88. 55, FC
        mov     byte [ebp-8H], al                       ; 04A6 _ 88. 45, F8
        movsx   eax, byte [ebp-8H]                      ; 04A9 _ 0F BE. 45, F8
        shl     eax, 4                                  ; 04AD _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 04B0 _ 8D. 90, 00000000(d)
        movzx   eax, byte [ebp-4H]                      ; 04B6 _ 0F B6. 45, FC
        push    edx                                     ; 04BA _ 52
        push    dword [ebp+10H]                         ; 04BB _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 04BE _ FF. 75, 0C
        push    eax                                     ; 04C1 _ 50
        call    putfont                                 ; 04C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04C7 _ 83. C4, 10
        nop                                             ; 04CA _ 90
        leave                                           ; 04CB _ C9
        ret                                             ; 04CC _ C3
; drawFont End of function

showString:; Function begin
        push    ebp                                     ; 04CD _ 55
        mov     ebp, esp                                ; 04CE _ 89. E5
        sub     esp, 4                                  ; 04D0 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 04D3 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 04D6 _ 88. 45, FC
        jmp     ?_019                                   ; 04D9 _ EB, 25

?_018:  mov     eax, dword [ebp+14H]                    ; 04DB _ 8B. 45, 14
        movzx   eax, byte [eax]                         ; 04DE _ 0F B6. 00
        movsx   edx, al                                 ; 04E1 _ 0F BE. D0
        movzx   eax, byte [ebp-4H]                      ; 04E4 _ 0F B6. 45, FC
        push    edx                                     ; 04E8 _ 52
        push    dword [ebp+10H]                         ; 04E9 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 04EC _ FF. 75, 0C
        push    eax                                     ; 04EF _ 50
        call    drawFont                                ; 04F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04F5 _ 83. C4, 10
        add     dword [ebp+0CH], 8                      ; 04F8 _ 83. 45, 0C, 08
        add     dword [ebp+14H], 1                      ; 04FC _ 83. 45, 14, 01
?_019:  mov     eax, dword [ebp+14H]                    ; 0500 _ 8B. 45, 14
        movzx   eax, byte [eax]                         ; 0503 _ 0F B6. 00
        test    al, al                                  ; 0506 _ 84. C0
        jnz     ?_018                                   ; 0508 _ 75, D1
        nop                                             ; 050A _ 90
        leave                                           ; 050B _ C9
        ret                                             ; 050C _ C3
; showString End of function



vram:                                                   ; dword
        dd 000A0000H                                    ; 0000 _ 655360 

xsize:  dd 00000140H                                    ; 0004 _ 320 

ysize:  dd 000000C8H, 00000000H                         ; 0008 _ 200 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

table_rgb.1533:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........





?_020:                                                  ; byte
        db 68H, 65H, 6CH, 6CH, 6FH, 20H, 67H, 72H       ; 0000 _ hello gr
        db 65H, 65H, 6EH, 20H, 6FH, 73H, 20H, 21H       ; 0008 _ een os !
        db 00H                                          ; 0010 _ .

?_021:                                                  ; byte
        db 77H, 65H, 6CH, 63H, 6FH, 6DH, 65H, 20H       ; 0011 _ welcome 
        db 21H, 00H                                     ; 0019 _ !.


