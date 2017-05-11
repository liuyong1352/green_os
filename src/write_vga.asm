; Disassembly of file: write_vga.o
; Thu May 11 18:10:20 2017
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global cmian: function
global set_palette: function
global init_palette: function
global boxfill8: function
global putfont: function
global drawFont: function

extern io_store_eflags                                  ; near
extern io_out8                                          ; near
extern io_cli                                           ; near
extern io_load_eflags                                   ; near
extern io_hlt                                           ; near
extern systemFont                                       ; byte


SECTION .text   align=1 execute                         ; section number 1, code

cmian:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 52                                 ; 0004 _ 83. EC, 34
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 0007 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 000D _ 89. 45, F4
        xor     eax, eax                                ; 0010 _ 31. C0
        mov     dword [ebp-28H], 655360                 ; 0012 _ C7. 45, D8, 000A0000
        call    init_palette                            ; 0019 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], 320                    ; 001E _ C7. 45, DC, 00000140
        mov     dword [ebp-20H], 200                    ; 0025 _ C7. 45, E0, 000000C8
        mov     eax, dword [ebp-20H]                    ; 002C _ 8B. 45, E0
        lea     edx, [eax-1DH]                          ; 002F _ 8D. 50, E3
        mov     eax, dword [ebp-24H]                    ; 0032 _ 8B. 45, DC
        sub     eax, 1                                  ; 0035 _ 83. E8, 01
        sub     esp, 4                                  ; 0038 _ 83. EC, 04
        push    edx                                     ; 003B _ 52
        push    eax                                     ; 003C _ 50
        push    0                                       ; 003D _ 6A, 00
        push    0                                       ; 003F _ 6A, 00
        push    14                                      ; 0041 _ 6A, 0E
        push    dword [ebp-24H]                         ; 0043 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 0046 _ FF. 75, D8
        call    boxfill8                                ; 0049 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 004E _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 0051 _ 8B. 45, E0
        lea     ecx, [eax-1CH]                          ; 0054 _ 8D. 48, E4
        mov     eax, dword [ebp-24H]                    ; 0057 _ 8B. 45, DC
        lea     edx, [eax-1H]                           ; 005A _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 005D _ 8B. 45, E0
        sub     eax, 28                                 ; 0060 _ 83. E8, 1C
        sub     esp, 4                                  ; 0063 _ 83. EC, 04
        push    ecx                                     ; 0066 _ 51
        push    edx                                     ; 0067 _ 52
        push    eax                                     ; 0068 _ 50
        push    0                                       ; 0069 _ 6A, 00
        push    8                                       ; 006B _ 6A, 08
        push    dword [ebp-24H]                         ; 006D _ FF. 75, DC
        push    dword [ebp-28H]                         ; 0070 _ FF. 75, D8
        call    boxfill8                                ; 0073 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0078 _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 007B _ 8B. 45, E0
        lea     ecx, [eax-1BH]                          ; 007E _ 8D. 48, E5
        mov     eax, dword [ebp-24H]                    ; 0081 _ 8B. 45, DC
        lea     edx, [eax-1H]                           ; 0084 _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 0087 _ 8B. 45, E0
        sub     eax, 27                                 ; 008A _ 83. E8, 1B
        sub     esp, 4                                  ; 008D _ 83. EC, 04
        push    ecx                                     ; 0090 _ 51
        push    edx                                     ; 0091 _ 52
        push    eax                                     ; 0092 _ 50
        push    0                                       ; 0093 _ 6A, 00
        push    7                                       ; 0095 _ 6A, 07
        push    dword [ebp-24H]                         ; 0097 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 009A _ FF. 75, D8
        call    boxfill8                                ; 009D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00A2 _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 00A5 _ 8B. 45, E0
        lea     ecx, [eax-1H]                           ; 00A8 _ 8D. 48, FF
        mov     eax, dword [ebp-24H]                    ; 00AB _ 8B. 45, DC
        lea     edx, [eax-1H]                           ; 00AE _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 00B1 _ 8B. 45, E0
        sub     eax, 26                                 ; 00B4 _ 83. E8, 1A
        sub     esp, 4                                  ; 00B7 _ 83. EC, 04
        push    ecx                                     ; 00BA _ 51
        push    edx                                     ; 00BB _ 52
        push    eax                                     ; 00BC _ 50
        push    0                                       ; 00BD _ 6A, 00
        push    8                                       ; 00BF _ 6A, 08
        push    dword [ebp-24H]                         ; 00C1 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 00C4 _ FF. 75, D8
        call    boxfill8                                ; 00C7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00CC _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 00CF _ 8B. 45, E0
        lea     edx, [eax-18H]                          ; 00D2 _ 8D. 50, E8
        mov     eax, dword [ebp-20H]                    ; 00D5 _ 8B. 45, E0
        sub     eax, 24                                 ; 00D8 _ 83. E8, 18
        sub     esp, 4                                  ; 00DB _ 83. EC, 04
        push    edx                                     ; 00DE _ 52
        push    59                                      ; 00DF _ 6A, 3B
        push    eax                                     ; 00E1 _ 50
        push    3                                       ; 00E2 _ 6A, 03
        push    7                                       ; 00E4 _ 6A, 07
        push    dword [ebp-24H]                         ; 00E6 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 00E9 _ FF. 75, D8
        call    boxfill8                                ; 00EC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00F1 _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 00F4 _ 8B. 45, E0
        lea     edx, [eax-4H]                           ; 00F7 _ 8D. 50, FC
        mov     eax, dword [ebp-20H]                    ; 00FA _ 8B. 45, E0
        sub     eax, 24                                 ; 00FD _ 83. E8, 18
        sub     esp, 4                                  ; 0100 _ 83. EC, 04
        push    edx                                     ; 0103 _ 52
        push    2                                       ; 0104 _ 6A, 02
        push    eax                                     ; 0106 _ 50
        push    2                                       ; 0107 _ 6A, 02
        push    7                                       ; 0109 _ 6A, 07
        push    dword [ebp-24H]                         ; 010B _ FF. 75, DC
        push    dword [ebp-28H]                         ; 010E _ FF. 75, D8
        call    boxfill8                                ; 0111 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0116 _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 0119 _ 8B. 45, E0
        lea     edx, [eax-4H]                           ; 011C _ 8D. 50, FC
        mov     eax, dword [ebp-20H]                    ; 011F _ 8B. 45, E0
        sub     eax, 4                                  ; 0122 _ 83. E8, 04
        sub     esp, 4                                  ; 0125 _ 83. EC, 04
        push    edx                                     ; 0128 _ 52
        push    59                                      ; 0129 _ 6A, 3B
        push    eax                                     ; 012B _ 50
        push    4                                       ; 012C _ 6A, 04
        push    15                                      ; 012E _ 6A, 0F
        push    dword [ebp-24H]                         ; 0130 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 0133 _ FF. 75, D8
        call    boxfill8                                ; 0136 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 013B _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 013E _ 8B. 45, E0
        lea     edx, [eax-5H]                           ; 0141 _ 8D. 50, FB
        mov     eax, dword [ebp-20H]                    ; 0144 _ 8B. 45, E0
        sub     eax, 23                                 ; 0147 _ 83. E8, 17
        sub     esp, 4                                  ; 014A _ 83. EC, 04
        push    edx                                     ; 014D _ 52
        push    59                                      ; 014E _ 6A, 3B
        push    eax                                     ; 0150 _ 50
        push    59                                      ; 0151 _ 6A, 3B
        push    15                                      ; 0153 _ 6A, 0F
        push    dword [ebp-24H]                         ; 0155 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 0158 _ FF. 75, D8
        call    boxfill8                                ; 015B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0160 _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 0163 _ 8B. 45, E0
        lea     edx, [eax-3H]                           ; 0166 _ 8D. 50, FD
        mov     eax, dword [ebp-20H]                    ; 0169 _ 8B. 45, E0
        sub     eax, 3                                  ; 016C _ 83. E8, 03
        sub     esp, 4                                  ; 016F _ 83. EC, 04
        push    edx                                     ; 0172 _ 52
        push    59                                      ; 0173 _ 6A, 3B
        push    eax                                     ; 0175 _ 50
        push    2                                       ; 0176 _ 6A, 02
        push    0                                       ; 0178 _ 6A, 00
        push    dword [ebp-24H]                         ; 017A _ FF. 75, DC
        push    dword [ebp-28H]                         ; 017D _ FF. 75, D8
        call    boxfill8                                ; 0180 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0185 _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 0188 _ 8B. 45, E0
        lea     edx, [eax-3H]                           ; 018B _ 8D. 50, FD
        mov     eax, dword [ebp-20H]                    ; 018E _ 8B. 45, E0
        sub     eax, 24                                 ; 0191 _ 83. E8, 18
        sub     esp, 4                                  ; 0194 _ 83. EC, 04
        push    edx                                     ; 0197 _ 52
        push    60                                      ; 0198 _ 6A, 3C
        push    eax                                     ; 019A _ 50
        push    60                                      ; 019B _ 6A, 3C
        push    0                                       ; 019D _ 6A, 00
        push    dword [ebp-24H]                         ; 019F _ FF. 75, DC
        push    dword [ebp-28H]                         ; 01A2 _ FF. 75, D8
        call    boxfill8                                ; 01A5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01AA _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 01AD _ 8B. 45, E0
        lea     ebx, [eax-18H]                          ; 01B0 _ 8D. 58, E8
        mov     eax, dword [ebp-24H]                    ; 01B3 _ 8B. 45, DC
        lea     ecx, [eax-4H]                           ; 01B6 _ 8D. 48, FC
        mov     eax, dword [ebp-20H]                    ; 01B9 _ 8B. 45, E0
        lea     edx, [eax-18H]                          ; 01BC _ 8D. 50, E8
        mov     eax, dword [ebp-24H]                    ; 01BF _ 8B. 45, DC
        sub     eax, 47                                 ; 01C2 _ 83. E8, 2F
        sub     esp, 4                                  ; 01C5 _ 83. EC, 04
        push    ebx                                     ; 01C8 _ 53
        push    ecx                                     ; 01C9 _ 51
        push    edx                                     ; 01CA _ 52
        push    eax                                     ; 01CB _ 50
        push    15                                      ; 01CC _ 6A, 0F
        push    dword [ebp-24H]                         ; 01CE _ FF. 75, DC
        push    dword [ebp-28H]                         ; 01D1 _ FF. 75, D8
        call    boxfill8                                ; 01D4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01D9 _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 01DC _ 8B. 45, E0
        lea     ebx, [eax-3H]                           ; 01DF _ 8D. 58, FD
        mov     eax, dword [ebp-24H]                    ; 01E2 _ 8B. 45, DC
        lea     ecx, [eax-2FH]                          ; 01E5 _ 8D. 48, D1
        mov     eax, dword [ebp-20H]                    ; 01E8 _ 8B. 45, E0
        lea     edx, [eax-17H]                          ; 01EB _ 8D. 50, E9
        mov     eax, dword [ebp-24H]                    ; 01EE _ 8B. 45, DC
        sub     eax, 47                                 ; 01F1 _ 83. E8, 2F
        sub     esp, 4                                  ; 01F4 _ 83. EC, 04
        push    ebx                                     ; 01F7 _ 53
        push    ecx                                     ; 01F8 _ 51
        push    edx                                     ; 01F9 _ 52
        push    eax                                     ; 01FA _ 50
        push    15                                      ; 01FB _ 6A, 0F
        push    dword [ebp-24H]                         ; 01FD _ FF. 75, DC
        push    dword [ebp-28H]                         ; 0200 _ FF. 75, D8
        call    boxfill8                                ; 0203 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0208 _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 020B _ 8B. 45, E0
        lea     ebx, [eax-3H]                           ; 020E _ 8D. 58, FD
        mov     eax, dword [ebp-24H]                    ; 0211 _ 8B. 45, DC
        lea     ecx, [eax-4H]                           ; 0214 _ 8D. 48, FC
        mov     eax, dword [ebp-20H]                    ; 0217 _ 8B. 45, E0
        lea     edx, [eax-3H]                           ; 021A _ 8D. 50, FD
        mov     eax, dword [ebp-24H]                    ; 021D _ 8B. 45, DC
        sub     eax, 47                                 ; 0220 _ 83. E8, 2F
        sub     esp, 4                                  ; 0223 _ 83. EC, 04
        push    ebx                                     ; 0226 _ 53
        push    ecx                                     ; 0227 _ 51
        push    edx                                     ; 0228 _ 52
        push    eax                                     ; 0229 _ 50
        push    7                                       ; 022A _ 6A, 07
        push    dword [ebp-24H]                         ; 022C _ FF. 75, DC
        push    dword [ebp-28H]                         ; 022F _ FF. 75, D8
        call    boxfill8                                ; 0232 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0237 _ 83. C4, 20
        mov     eax, dword [ebp-20H]                    ; 023A _ 8B. 45, E0
        lea     ebx, [eax-3H]                           ; 023D _ 8D. 58, FD
        mov     eax, dword [ebp-24H]                    ; 0240 _ 8B. 45, DC
        lea     ecx, [eax-3H]                           ; 0243 _ 8D. 48, FD
        mov     eax, dword [ebp-20H]                    ; 0246 _ 8B. 45, E0
        lea     edx, [eax-18H]                          ; 0249 _ 8D. 50, E8
        mov     eax, dword [ebp-24H]                    ; 024C _ 8B. 45, DC
        sub     eax, 3                                  ; 024F _ 83. E8, 03
        sub     esp, 4                                  ; 0252 _ 83. EC, 04
        push    ebx                                     ; 0255 _ 53
        push    ecx                                     ; 0256 _ 51
        push    edx                                     ; 0257 _ 52
        push    eax                                     ; 0258 _ 50
        push    7                                       ; 0259 _ 6A, 07
        push    dword [ebp-24H]                         ; 025B _ FF. 75, DC
        push    dword [ebp-28H]                         ; 025E _ FF. 75, D8
        call    boxfill8                                ; 0261 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0266 _ 83. C4, 20
        mov     byte [ebp-1CH], 0                       ; 0269 _ C6. 45, E4, 00
        mov     byte [ebp-1BH], 24                      ; 026D _ C6. 45, E5, 18
        mov     byte [ebp-1AH], 24                      ; 0271 _ C6. 45, E6, 18
        mov     byte [ebp-19H], 24                      ; 0275 _ C6. 45, E7, 18
        mov     byte [ebp-18H], 24                      ; 0279 _ C6. 45, E8, 18
        mov     byte [ebp-17H], 36                      ; 027D _ C6. 45, E9, 24
        mov     byte [ebp-16H], 36                      ; 0281 _ C6. 45, EA, 24
        mov     byte [ebp-15H], 36                      ; 0285 _ C6. 45, EB, 24
        mov     byte [ebp-14H], 36                      ; 0289 _ C6. 45, EC, 24
        mov     byte [ebp-13H], 126                     ; 028D _ C6. 45, ED, 7E
        mov     byte [ebp-12H], 66                      ; 0291 _ C6. 45, EE, 42
        mov     byte [ebp-11H], 66                      ; 0295 _ C6. 45, EF, 42
        mov     byte [ebp-10H], 66                      ; 0299 _ C6. 45, F0, 42
        mov     byte [ebp-0FH], -25                     ; 029D _ C6. 45, F1, E7
        mov     byte [ebp-0EH], 0                       ; 02A1 _ C6. 45, F2, 00
        mov     byte [ebp-0DH], 0                       ; 02A5 _ C6. 45, F3, 00
        mov     dword [ebp-34H], 0                      ; 02A9 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 0                      ; 02B0 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 02B7 _ C7. 45, D4, 00000000
        jmp     ?_002                                   ; 02BE _ EB, 42

?_001:  mov     eax, dword [ebp-34H]                    ; 02C0 _ 8B. 45, CC
        shl     eax, 4                                  ; 02C3 _ C1. E0, 04
        add     eax, systemFont                         ; 02C6 _ 05, 00000000(d)
        sub     esp, 8                                  ; 02CB _ 83. EC, 08
        push    eax                                     ; 02CE _ 50
        push    dword [ebp-2CH]                         ; 02CF _ FF. 75, D4
        push    dword [ebp-30H]                         ; 02D2 _ FF. 75, D0
        push    15                                      ; 02D5 _ 6A, 0F
        push    dword [ebp-24H]                         ; 02D7 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 02DA _ FF. 75, D8
        call    putfont                                 ; 02DD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02E2 _ 83. C4, 20
        add     dword [ebp-34H], 1                      ; 02E5 _ 83. 45, CC, 01
        add     dword [ebp-30H], 8                      ; 02E9 _ 83. 45, D0, 08
        mov     eax, dword [ebp-34H]                    ; 02ED _ 8B. 45, CC
        and     eax, 1FH                                ; 02F0 _ 83. E0, 1F
        test    eax, eax                                ; 02F3 _ 85. C0
        jnz     ?_002                                   ; 02F5 _ 75, 0B
        mov     dword [ebp-30H], 0                      ; 02F7 _ C7. 45, D0, 00000000
        add     dword [ebp-2CH], 16                     ; 02FE _ 83. 45, D4, 10
?_002:  cmp     dword [ebp-34H], 254                    ; 0302 _ 81. 7D, CC, 000000FE
        jle     ?_001                                   ; 0309 _ 7E, B5
        mov     eax, systemFont+410H                    ; 030B _ B8, 00000410(d)
        sub     esp, 8                                  ; 0310 _ 83. EC, 08
        push    eax                                     ; 0313 _ 50
        push    0                                       ; 0314 _ 6A, 00
        push    0                                       ; 0316 _ 6A, 00
        push    7                                       ; 0318 _ 6A, 07
        push    dword [ebp-24H]                         ; 031A _ FF. 75, DC
        push    dword [ebp-28H]                         ; 031D _ FF. 75, D8
        call    putfont                                 ; 0320 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0325 _ 83. C4, 20
        mov     eax, systemFont+430H                    ; 0328 _ B8, 00000430(d)
        sub     esp, 8                                  ; 032D _ 83. EC, 08
        push    eax                                     ; 0330 _ 50
        push    0                                       ; 0331 _ 6A, 00
        push    8                                       ; 0333 _ 6A, 08
        push    7                                       ; 0335 _ 6A, 07
        push    dword [ebp-24H]                         ; 0337 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 033A _ FF. 75, D8
        call    putfont                                 ; 033D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0342 _ 83. C4, 20
        mov     eax, systemFont+420H                    ; 0345 _ B8, 00000420(d)
        sub     esp, 8                                  ; 034A _ 83. EC, 08
        push    eax                                     ; 034D _ 50
        push    0                                       ; 034E _ 6A, 00
        push    16                                      ; 0350 _ 6A, 10
        push    7                                       ; 0352 _ 6A, 07
        push    dword [ebp-24H]                         ; 0354 _ FF. 75, DC
        push    dword [ebp-28H]                         ; 0357 _ FF. 75, D8
        call    putfont                                 ; 035A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 035F _ 83. C4, 20
?_003:  call    io_hlt                                  ; 0362 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 0367 _ EB, F9
; cmian End of function

set_palette:; Function begin
        push    ebp                                     ; 0369 _ 55
        mov     ebp, esp                                ; 036A _ 89. E5
        sub     esp, 24                                 ; 036C _ 83. EC, 18
        call    io_load_eflags                          ; 036F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0374 _ 89. 45, F4
        call    io_cli                                  ; 0377 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 037C _ 83. EC, 08
        push    dword [ebp+8H]                          ; 037F _ FF. 75, 08
        push    968                                     ; 0382 _ 68, 000003C8
        call    io_out8                                 ; 0387 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 038C _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 038F _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0392 _ 89. 45, F0
        jmp     ?_005                                   ; 0395 _ EB, 65

?_004:  mov     eax, dword [ebp+10H]                    ; 0397 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 039A _ 0F B6. 00
        shr     al, 2                                   ; 039D _ C0. E8, 02
        movzx   eax, al                                 ; 03A0 _ 0F B6. C0
        sub     esp, 8                                  ; 03A3 _ 83. EC, 08
        push    eax                                     ; 03A6 _ 50
        push    969                                     ; 03A7 _ 68, 000003C9
        call    io_out8                                 ; 03AC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03B1 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03B4 _ 8B. 45, 10
        add     eax, 1                                  ; 03B7 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 03BA _ 0F B6. 00
        shr     al, 2                                   ; 03BD _ C0. E8, 02
        movzx   eax, al                                 ; 03C0 _ 0F B6. C0
        sub     esp, 8                                  ; 03C3 _ 83. EC, 08
        push    eax                                     ; 03C6 _ 50
        push    969                                     ; 03C7 _ 68, 000003C9
        call    io_out8                                 ; 03CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D1 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03D4 _ 8B. 45, 10
        add     eax, 2                                  ; 03D7 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 03DA _ 0F B6. 00
        shr     al, 2                                   ; 03DD _ C0. E8, 02
        movzx   eax, al                                 ; 03E0 _ 0F B6. C0
        sub     esp, 8                                  ; 03E3 _ 83. EC, 08
        push    eax                                     ; 03E6 _ 50
        push    969                                     ; 03E7 _ 68, 000003C9
        call    io_out8                                 ; 03EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F1 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 03F4 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 03F8 _ 83. 45, F0, 01
?_005:  mov     eax, dword [ebp-10H]                    ; 03FC _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 03FF _ 3B. 45, 0C
        jle     ?_004                                   ; 0402 _ 7E, 93
        sub     esp, 12                                 ; 0404 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0407 _ FF. 75, F4
        call    io_store_eflags                         ; 040A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 040F _ 83. C4, 10
        nop                                             ; 0412 _ 90
        leave                                           ; 0413 _ C9
        ret                                             ; 0414 _ C3
; set_palette End of function

init_palette:; Function begin
        push    ebp                                     ; 0415 _ 55
        mov     ebp, esp                                ; 0416 _ 89. E5
        sub     esp, 8                                  ; 0418 _ 83. EC, 08
        sub     esp, 4                                  ; 041B _ 83. EC, 04
        push    table_rgb.1542                          ; 041E _ 68, 00000000(d)
        push    15                                      ; 0423 _ 6A, 0F
        push    0                                       ; 0425 _ 6A, 00
        call    set_palette                             ; 0427 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 042C _ 83. C4, 10
        nop                                             ; 042F _ 90
        leave                                           ; 0430 _ C9
        ret                                             ; 0431 _ C3
; init_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0432 _ 55
        mov     ebp, esp                                ; 0433 _ 89. E5
        sub     esp, 20                                 ; 0435 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0438 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 043B _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 043E _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0441 _ 89. 45, FC
        jmp     ?_009                                   ; 0444 _ EB, 33

?_006:  mov     eax, dword [ebp+14H]                    ; 0446 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0449 _ 89. 45, F8
        jmp     ?_008                                   ; 044C _ EB, 1F

?_007:  mov     eax, dword [ebp-4H]                     ; 044E _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0451 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0455 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0457 _ 8B. 45, F8
        add     eax, edx                                ; 045A _ 01. D0
        mov     edx, eax                                ; 045C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 045E _ 8B. 45, 08
        add     edx, eax                                ; 0461 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0463 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0467 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0469 _ 83. 45, F8, 01
?_008:  mov     eax, dword [ebp-8H]                     ; 046D _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0470 _ 3B. 45, 1C
        jle     ?_007                                   ; 0473 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0475 _ 83. 45, FC, 01
?_009:  mov     eax, dword [ebp-4H]                     ; 0479 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 047C _ 3B. 45, 20
        jle     ?_006                                   ; 047F _ 7E, C5
        nop                                             ; 0481 _ 90
        leave                                           ; 0482 _ C9
        ret                                             ; 0483 _ C3
; boxfill8 End of function

putfont:; Function begin
        push    ebp                                     ; 0484 _ 55
        mov     ebp, esp                                ; 0485 _ 89. E5
        sub     esp, 20                                 ; 0487 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 048A _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 048D _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0490 _ C7. 45, F8, 00000000
        jmp     ?_019                                   ; 0497 _ E9, 000000DD

?_010:  mov     edx, dword [ebp-8H]                     ; 049C _ 8B. 55, F8
        mov     eax, dword [ebp+1CH]                    ; 049F _ 8B. 45, 1C
        add     eax, edx                                ; 04A2 _ 01. D0
        movzx   eax, byte [eax]                         ; 04A4 _ 0F B6. 00
        mov     byte [ebp-9H], al                       ; 04A7 _ 88. 45, F7
        mov     edx, dword [ebp+18H]                    ; 04AA _ 8B. 55, 18
        mov     eax, dword [ebp-8H]                     ; 04AD _ 8B. 45, F8
        add     eax, edx                                ; 04B0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 04B2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04B6 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 04B8 _ 8B. 45, 14
        add     edx, eax                                ; 04BB _ 01. C2
        mov     eax, dword [ebp+8H]                     ; 04BD _ 8B. 45, 08
        add     eax, edx                                ; 04C0 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 04C2 _ 89. 45, FC
        cmp     byte [ebp-9H], 0                        ; 04C5 _ 80. 7D, F7, 00
        jns     ?_011                                   ; 04C9 _ 79, 09
        movzx   edx, byte [ebp-14H]                     ; 04CB _ 0F B6. 55, EC
        mov     eax, dword [ebp-4H]                     ; 04CF _ 8B. 45, FC
        mov     byte [eax], dl                          ; 04D2 _ 88. 10
?_011:  movsx   eax, byte [ebp-9H]                      ; 04D4 _ 0F BE. 45, F7
        and     eax, 40H                                ; 04D8 _ 83. E0, 40
        test    eax, eax                                ; 04DB _ 85. C0
        jz      ?_012                                   ; 04DD _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 04DF _ 8B. 45, FC
        lea     edx, [eax+1H]                           ; 04E2 _ 8D. 50, 01
        movzx   eax, byte [ebp-14H]                     ; 04E5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 04E9 _ 88. 02
?_012:  movsx   eax, byte [ebp-9H]                      ; 04EB _ 0F BE. 45, F7
        and     eax, 20H                                ; 04EF _ 83. E0, 20
        test    eax, eax                                ; 04F2 _ 85. C0
        jz      ?_013                                   ; 04F4 _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 04F6 _ 8B. 45, FC
        lea     edx, [eax+2H]                           ; 04F9 _ 8D. 50, 02
        movzx   eax, byte [ebp-14H]                     ; 04FC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0500 _ 88. 02
?_013:  movsx   eax, byte [ebp-9H]                      ; 0502 _ 0F BE. 45, F7
        and     eax, 10H                                ; 0506 _ 83. E0, 10
        test    eax, eax                                ; 0509 _ 85. C0
        jz      ?_014                                   ; 050B _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 050D _ 8B. 45, FC
        lea     edx, [eax+3H]                           ; 0510 _ 8D. 50, 03
        movzx   eax, byte [ebp-14H]                     ; 0513 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0517 _ 88. 02
?_014:  movsx   eax, byte [ebp-9H]                      ; 0519 _ 0F BE. 45, F7
        and     eax, 08H                                ; 051D _ 83. E0, 08
        test    eax, eax                                ; 0520 _ 85. C0
        jz      ?_015                                   ; 0522 _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 0524 _ 8B. 45, FC
        lea     edx, [eax+4H]                           ; 0527 _ 8D. 50, 04
        movzx   eax, byte [ebp-14H]                     ; 052A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 052E _ 88. 02
?_015:  movsx   eax, byte [ebp-9H]                      ; 0530 _ 0F BE. 45, F7
        and     eax, 04H                                ; 0534 _ 83. E0, 04
        test    eax, eax                                ; 0537 _ 85. C0
        jz      ?_016                                   ; 0539 _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 053B _ 8B. 45, FC
        lea     edx, [eax+5H]                           ; 053E _ 8D. 50, 05
        movzx   eax, byte [ebp-14H]                     ; 0541 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0545 _ 88. 02
?_016:  movsx   eax, byte [ebp-9H]                      ; 0547 _ 0F BE. 45, F7
        and     eax, 02H                                ; 054B _ 83. E0, 02
        test    eax, eax                                ; 054E _ 85. C0
        jz      ?_017                                   ; 0550 _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 0552 _ 8B. 45, FC
        lea     edx, [eax+6H]                           ; 0555 _ 8D. 50, 06
        movzx   eax, byte [ebp-14H]                     ; 0558 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 055C _ 88. 02
?_017:  movsx   eax, byte [ebp-9H]                      ; 055E _ 0F BE. 45, F7
        and     eax, 01H                                ; 0562 _ 83. E0, 01
        test    eax, eax                                ; 0565 _ 85. C0
        jz      ?_018                                   ; 0567 _ 74, 0C
        mov     eax, dword [ebp-4H]                     ; 0569 _ 8B. 45, FC
        lea     edx, [eax+7H]                           ; 056C _ 8D. 50, 07
        movzx   eax, byte [ebp-14H]                     ; 056F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0573 _ 88. 02
?_018:  add     dword [ebp-8H], 1                       ; 0575 _ 83. 45, F8, 01
?_019:  cmp     dword [ebp-8H], 15                      ; 0579 _ 83. 7D, F8, 0F
        jle     ?_010                                   ; 057D _ 0F 8E, FFFFFF19
        nop                                             ; 0583 _ 90
        leave                                           ; 0584 _ C9
        ret                                             ; 0585 _ C3
; putfont End of function

drawFont:; Function begin
        push    ebp                                     ; 0586 _ 55
        mov     ebp, esp                                ; 0587 _ 89. E5
        sub     esp, 8                                  ; 0589 _ 83. EC, 08
        mov     edx, dword [ebp+10H]                    ; 058C _ 8B. 55, 10
        mov     eax, dword [ebp+1CH]                    ; 058F _ 8B. 45, 1C
        mov     byte [ebp-4H], dl                       ; 0592 _ 88. 55, FC
        mov     byte [ebp-8H], al                       ; 0595 _ 88. 45, F8
        nop                                             ; 0598 _ 90
        leave                                           ; 0599 _ C9
        ret                                             ; 059A _ C3
; drawFont End of function


SECTION .data   align=32 noexecute                      ; section number 2, data

table_rgb.1542:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0000 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........


SECTION .bss    align=1 noexecute                       ; section number 3, bss


