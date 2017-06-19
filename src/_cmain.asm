; Disassembly of file: cmain.o
; Mon Jun 19 10:30:30 2017
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro, privileged instructions






cmain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 228                                ; 0004 _ 81. EC, 000000E4
        call    init_palette                            ; 000A _ E8, FFFFFFFC(rel)
        call    init_pit                                ; 000F _ E8, FFFFFFFC(rel)
        call    getTimerCTL                             ; 0014 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0019 _ 89. 45, EC
        mov     ecx, 0                                  ; 001C _ B9, 00000000
        mov     eax, 24                                 ; 0021 _ B8, 00000018
        and     eax, 0FFFFFFFCH                         ; 0026 _ 83. E0, FC
        mov     edx, eax                                ; 0029 _ 89. C2
        mov     eax, 0                                  ; 002B _ B8, 00000000
?_001:  mov     dword [ebp+eax-60H], ecx                ; 0030 _ 89. 4C 05, A0
        add     eax, 4                                  ; 0034 _ 83. C0, 04
        cmp     eax, edx                                ; 0037 _ 39. D0
        jc      ?_001                                   ; 0039 _ 72, F5
        mov     ecx, 0                                  ; 003B _ B9, 00000000
        mov     eax, 24                                 ; 0040 _ B8, 00000018
        and     eax, 0FFFFFFFCH                         ; 0045 _ 83. E0, FC
        mov     edx, eax                                ; 0048 _ 89. C2
        mov     eax, 0                                  ; 004A _ B8, 00000000
?_002:  mov     dword [ebp+eax-78H], ecx                ; 004F _ 89. 4C 05, 88
        add     eax, 4                                  ; 0053 _ 83. C0, 04
        cmp     eax, edx                                ; 0056 _ 39. D0
        jc      ?_002                                   ; 0058 _ 72, F5
        mov     ecx, 0                                  ; 005A _ B9, 00000000
        mov     eax, 24                                 ; 005F _ B8, 00000018
        and     eax, 0FFFFFFFCH                         ; 0064 _ 83. E0, FC
        mov     edx, eax                                ; 0067 _ 89. C2
        mov     eax, 0                                  ; 0069 _ B8, 00000000
?_003:  mov     dword [ebp+eax-90H], ecx                ; 006E _ 89. 8C 05, FFFFFF70
        add     eax, 4                                  ; 0075 _ 83. C0, 04
        cmp     eax, edx                                ; 0078 _ 39. D0
        jc      ?_003                                   ; 007A _ 72, F2
        sub     esp, 4                                  ; 007C _ 83. EC, 04
        push    timerbuf.1715                           ; 007F _ 68, 00000038(d)
        push    4                                       ; 0084 _ 6A, 04
        lea     eax, [ebp-60H]                          ; 0086 _ 8D. 45, A0
        push    eax                                     ; 0089 _ 50
        call    fifo_init                               ; 008A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 008F _ 83. C4, 10
        call    timer_alloc                             ; 0092 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0097 _ 89. 45, E8
        sub     esp, 4                                  ; 009A _ 83. EC, 04
        push    10                                      ; 009D _ 6A, 0A
        lea     eax, [ebp-60H]                          ; 009F _ 8D. 45, A0
        push    eax                                     ; 00A2 _ 50
        push    dword [ebp-18H]                         ; 00A3 _ FF. 75, E8
        call    timer_init                              ; 00A6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00AB _ 83. C4, 10
        sub     esp, 8                                  ; 00AE _ 83. EC, 08
        push    1000                                    ; 00B1 _ 68, 000003E8
        push    dword [ebp-18H]                         ; 00B6 _ FF. 75, E8
        call    timer_settime                           ; 00B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00BE _ 83. C4, 10
        sub     esp, 4                                  ; 00C1 _ 83. EC, 04
        push    timerbuf2.1716                          ; 00C4 _ 68, 0000003C(d)
        push    4                                       ; 00C9 _ 6A, 04
        lea     eax, [ebp-78H]                          ; 00CB _ 8D. 45, 88
        push    eax                                     ; 00CE _ 50
        call    fifo_init                               ; 00CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D4 _ 83. C4, 10
        call    timer_alloc                             ; 00D7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 00DC _ 89. 45, E4
        sub     esp, 4                                  ; 00DF _ 83. EC, 04
        push    3                                       ; 00E2 _ 6A, 03
        lea     eax, [ebp-78H]                          ; 00E4 _ 8D. 45, 88
        push    eax                                     ; 00E7 _ 50
        push    dword [ebp-1CH]                         ; 00E8 _ FF. 75, E4
        call    timer_init                              ; 00EB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F0 _ 83. C4, 10
        sub     esp, 8                                  ; 00F3 _ 83. EC, 08
        push    300                                     ; 00F6 _ 68, 0000012C
        push    dword [ebp-1CH]                         ; 00FB _ FF. 75, E4
        call    timer_settime                           ; 00FE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0103 _ 83. C4, 10
        sub     esp, 4                                  ; 0106 _ 83. EC, 04
        push    timerbuf3.1717                          ; 0109 _ 68, 00000040(d)
        push    4                                       ; 010E _ 6A, 04
        lea     eax, [ebp-90H]                          ; 0110 _ 8D. 85, FFFFFF70
        push    eax                                     ; 0116 _ 50
        call    fifo_init                               ; 0117 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 011C _ 83. C4, 10
        call    timer_alloc                             ; 011F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0124 _ 89. 45, E0
        sub     esp, 4                                  ; 0127 _ 83. EC, 04
        push    1                                       ; 012A _ 6A, 01
        lea     eax, [ebp-90H]                          ; 012C _ 8D. 85, FFFFFF70
        push    eax                                     ; 0132 _ 50
        push    dword [ebp-20H]                         ; 0133 _ FF. 75, E0
        call    timer_init                              ; 0136 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 013B _ 83. C4, 10
        sub     esp, 8                                  ; 013E _ 83. EC, 08
        push    50                                      ; 0141 _ 6A, 32
        push    dword [ebp-20H]                         ; 0143 _ FF. 75, E0
        call    timer_settime                           ; 0146 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 014B _ 83. C4, 10
        sub     esp, 4                                  ; 014E _ 83. EC, 04
        push    keybuf.1709                             ; 0151 _ 68, 00000060(d)
        push    32                                      ; 0156 _ 6A, 20
        push    keyfifo                                 ; 0158 _ 68, 00000000(d)
        call    fifo_init                               ; 015D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0162 _ 83. C4, 10
        sub     esp, 4                                  ; 0165 _ 83. EC, 04
        push    mousebuf.1710                           ; 0168 _ 68, 00000080(d)
        push    128                                     ; 016D _ 68, 00000080
        push    mousefifo                               ; 0172 _ 68, 00000018(d)
        call    fifo_init                               ; 0177 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 017C _ 83. C4, 10
        call    init_keyboard                           ; 017F _ E8, FFFFFFFC(rel)
        sti                                             ; 0184 _ FB
        mov     eax, dword [xsize]                      ; 0185 _ A1, 00000004(d)
        sub     eax, 16                                 ; 018A _ 83. E8, 10
        mov     edx, eax                                ; 018D _ 89. C2
        shr     edx, 31                                 ; 018F _ C1. EA, 1F
        add     eax, edx                                ; 0192 _ 01. D0
        sar     eax, 1                                  ; 0194 _ D1. F8
        mov     dword [ebp-0CH], eax                    ; 0196 _ 89. 45, F4
        mov     eax, dword [ysize]                      ; 0199 _ A1, 00000008(d)
        sub     eax, 16                                 ; 019E _ 83. E8, 10
        mov     edx, eax                                ; 01A1 _ 89. C2
        shr     edx, 31                                 ; 01A3 _ C1. EA, 1F
        add     eax, edx                                ; 01A6 _ 01. D0
        sar     eax, 1                                  ; 01A8 _ D1. F8
        mov     dword [ebp-10H], eax                    ; 01AA _ 89. 45, F0
        call    enable_mouse                            ; 01AD _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9DH], 0                       ; 01B2 _ C6. 85, FFFFFF63, 00
        call    get_smap_buf                            ; 01B9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 01BE _ 89. 45, DC
        mov     eax, dword [memman]                     ; 01C1 _ A1, 00000000(d)
        sub     esp, 12                                 ; 01C6 _ 83. EC, 0C
        push    eax                                     ; 01C9 _ 50
        call    memman_init                             ; 01CA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01CF _ 83. C4, 10
        mov     eax, dword [memman]                     ; 01D2 _ A1, 00000000(d)
        sub     esp, 4                                  ; 01D7 _ 83. EC, 04
        push    534773760                               ; 01DA _ 68, 1FE00000
        push    1081344                                 ; 01DF _ 68, 00108000
        push    eax                                     ; 01E4 _ 50
        call    memman_free                             ; 01E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01EA _ 83. C4, 10
        mov     ebx, dword [ysize]                      ; 01ED _ 8B. 1D, 00000008(d)
        mov     ecx, dword [xsize]                      ; 01F3 _ 8B. 0D, 00000004(d)
        mov     edx, dword [vram]                       ; 01F9 _ 8B. 15, 00000000(d)
        mov     eax, dword [memman]                     ; 01FF _ A1, 00000000(d)
        push    ebx                                     ; 0204 _ 53
        push    ecx                                     ; 0205 _ 51
        push    edx                                     ; 0206 _ 52
        push    eax                                     ; 0207 _ 50
        call    shtctl_init                             ; 0208 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 020D _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 0210 _ 89. 45, D8
        mov     edx, dword [xsize]                      ; 0213 _ 8B. 15, 00000004(d)
        mov     eax, dword [ysize]                      ; 0219 _ A1, 00000008(d)
        imul    eax, edx                                ; 021E _ 0F AF. C2
        add     eax, eax                                ; 0221 _ 01. C0
        mov     edx, eax                                ; 0223 _ 89. C2
        mov     eax, dword [memman]                     ; 0225 _ A1, 00000000(d)
        sub     esp, 8                                  ; 022A _ 83. EC, 08
        push    edx                                     ; 022D _ 52
        push    eax                                     ; 022E _ 50
        call    memman_alloc_4k                         ; 022F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0234 _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 0237 _ 89. 45, D4
        mov     eax, dword [memman]                     ; 023A _ A1, 00000000(d)
        sub     esp, 8                                  ; 023F _ 83. EC, 08
        push    10880                                   ; 0242 _ 68, 00002A80
        push    eax                                     ; 0247 _ 50
        call    memman_alloc_4k                         ; 0248 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 024D _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 0250 _ 89. 45, D0
        sub     esp, 12                                 ; 0253 _ 83. EC, 0C
        push    dword [ebp-28H]                         ; 0256 _ FF. 75, D8
        call    sheet_alloc                             ; 0259 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 025E _ 83. C4, 10
        mov     dword [ebp-34H], eax                    ; 0261 _ 89. 45, CC
        sub     esp, 12                                 ; 0264 _ 83. EC, 0C
        push    dword [ebp-28H]                         ; 0267 _ FF. 75, D8
        call    sheet_alloc                             ; 026A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 026F _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 0272 _ 89. 45, C8
        sub     esp, 12                                 ; 0275 _ 83. EC, 0C
        push    dword [ebp-28H]                         ; 0278 _ FF. 75, D8
        call    sheet_alloc                             ; 027B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0280 _ 83. C4, 10
        mov     dword [ebp-3CH], eax                    ; 0283 _ 89. 45, C4
        mov     edx, dword [ysize]                      ; 0286 _ 8B. 15, 00000008(d)
        mov     eax, dword [xsize]                      ; 028C _ A1, 00000004(d)
        sub     esp, 12                                 ; 0291 _ 83. EC, 0C
        push    -1                                      ; 0294 _ 6A, FF
        push    edx                                     ; 0296 _ 52
        push    eax                                     ; 0297 _ 50
        push    dword [ebp-2CH]                         ; 0298 _ FF. 75, D4
        push    dword [ebp-34H]                         ; 029B _ FF. 75, CC
        call    sheet_setbuf                            ; 029E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02A3 _ 83. C4, 20
        sub     esp, 12                                 ; 02A6 _ 83. EC, 0C
        push    99                                      ; 02A9 _ 6A, 63
        push    16                                      ; 02AB _ 6A, 10
        push    16                                      ; 02AD _ 6A, 10
        push    buf_mouse.1729                          ; 02AF _ 68, 00000100(d)
        push    dword [ebp-38H]                         ; 02B4 _ FF. 75, C8
        call    sheet_setbuf                            ; 02B7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02BC _ 83. C4, 20
        sub     esp, 12                                 ; 02BF _ 83. EC, 0C
        push    -1                                      ; 02C2 _ 6A, FF
        push    68                                      ; 02C4 _ 6A, 44
        push    160                                     ; 02C6 _ 68, 000000A0
        push    dword [ebp-30H]                         ; 02CB _ FF. 75, D0
        push    dword [ebp-3CH]                         ; 02CE _ FF. 75, C4
        call    sheet_setbuf                            ; 02D1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02D6 _ 83. C4, 20
        mov     edx, dword [ysize]                      ; 02D9 _ 8B. 15, 00000008(d)
        mov     eax, dword [xsize]                      ; 02DF _ A1, 00000004(d)
        sub     esp, 4                                  ; 02E4 _ 83. EC, 04
        push    edx                                     ; 02E7 _ 52
        push    eax                                     ; 02E8 _ 50
        push    dword [ebp-2CH]                         ; 02E9 _ FF. 75, D4
        call    init_screen                             ; 02EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02F1 _ 83. C4, 10
        sub     esp, 8                                  ; 02F4 _ 83. EC, 08
        push    99                                      ; 02F7 _ 6A, 63
        push    buf_mouse.1729                          ; 02F9 _ 68, 00000100(d)
        call    init_mouse                              ; 02FE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0303 _ 83. C4, 10
        push    ?_172                                   ; 0306 _ 68, 00000000(d)
        push    68                                      ; 030B _ 6A, 44
        push    160                                     ; 030D _ 68, 000000A0
        push    dword [ebp-30H]                         ; 0312 _ FF. 75, D0
        call    make_window8                            ; 0315 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 031A _ 83. C4, 10
        sub     esp, 8                                  ; 031D _ 83. EC, 08
        push    ?_173                                   ; 0320 _ 68, 00000007(d)
        push    0                                       ; 0325 _ 6A, 00
        push    28                                      ; 0327 _ 6A, 1C
        push    24                                      ; 0329 _ 6A, 18
        push    160                                     ; 032B _ 68, 000000A0
        push    dword [ebp-30H]                         ; 0330 _ FF. 75, D0
        call    showString                              ; 0333 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0338 _ 83. C4, 20
        sub     esp, 8                                  ; 033B _ 83. EC, 08
        push    ?_174                                   ; 033E _ 68, 00000012(d)
        push    0                                       ; 0343 _ 6A, 00
        push    44                                      ; 0345 _ 6A, 2C
        push    24                                      ; 0347 _ 6A, 18
        push    160                                     ; 0349 _ 68, 000000A0
        push    dword [ebp-30H]                         ; 034E _ FF. 75, D0
        call    showString                              ; 0351 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0356 _ 83. C4, 20
        push    0                                       ; 0359 _ 6A, 00
        push    0                                       ; 035B _ 6A, 00
        push    dword [ebp-34H]                         ; 035D _ FF. 75, CC
        push    dword [ebp-28H]                         ; 0360 _ FF. 75, D8
        call    sheet_slide                             ; 0363 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0368 _ 83. C4, 10
        push    dword [ebp-10H]                         ; 036B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 036E _ FF. 75, F4
        push    dword [ebp-38H]                         ; 0371 _ FF. 75, C8
        push    dword [ebp-28H]                         ; 0374 _ FF. 75, D8
        call    sheet_slide                             ; 0377 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 037C _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 037F _ 8B. 45, F0
        lea     edx, [eax-1EH]                          ; 0382 _ 8D. 50, E2
        mov     eax, dword [ebp-0CH]                    ; 0385 _ 8B. 45, F4
        sub     eax, 70                                 ; 0388 _ 83. E8, 46
        push    edx                                     ; 038B _ 52
        push    eax                                     ; 038C _ 50
        push    dword [ebp-3CH]                         ; 038D _ FF. 75, C4
        push    dword [ebp-28H]                         ; 0390 _ FF. 75, D8
        call    sheet_slide                             ; 0393 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0398 _ 83. C4, 10
        sub     esp, 4                                  ; 039B _ 83. EC, 04
        push    0                                       ; 039E _ 6A, 00
        push    dword [ebp-34H]                         ; 03A0 _ FF. 75, CC
        push    dword [ebp-28H]                         ; 03A3 _ FF. 75, D8
        call    sheet_updown                            ; 03A6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03AB _ 83. C4, 10
        sub     esp, 4                                  ; 03AE _ 83. EC, 04
        push    1                                       ; 03B1 _ 6A, 01
        push    dword [ebp-3CH]                         ; 03B3 _ FF. 75, C4
        push    dword [ebp-28H]                         ; 03B6 _ FF. 75, D8
        call    sheet_updown                            ; 03B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03BE _ 83. C4, 10
        sub     esp, 4                                  ; 03C1 _ 83. EC, 04
        push    2                                       ; 03C4 _ 6A, 02
        push    dword [ebp-38H]                         ; 03C6 _ FF. 75, C8
        push    dword [ebp-28H]                         ; 03C9 _ FF. 75, D8
        call    sheet_updown                            ; 03CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D1 _ 83. C4, 10
        mov     dword [ebp-40H], 0                      ; 03D4 _ C7. 45, C0, 00000000
?_004:  mov     eax, dword [ebp-14H]                    ; 03DB _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 03DE _ 8B. 00
        sub     esp, 4                                  ; 03E0 _ 83. EC, 04
        push    eax                                     ; 03E3 _ 50
        push    ?_175                                   ; 03E4 _ 68, 00000018(d)
        lea     eax, [ebp-0E0H]                         ; 03E9 _ 8D. 85, FFFFFF20
        push    eax                                     ; 03EF _ 50
        call    sprintf                                 ; 03F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F5 _ 83. C4, 10
        sub     esp, 4                                  ; 03F8 _ 83. EC, 04
        push    43                                      ; 03FB _ 6A, 2B
        push    119                                     ; 03FD _ 6A, 77
        push    28                                      ; 03FF _ 6A, 1C
        push    40                                      ; 0401 _ 6A, 28
        push    8                                       ; 0403 _ 6A, 08
        push    160                                     ; 0405 _ 68, 000000A0
        push    dword [ebp-30H]                         ; 040A _ FF. 75, D0
        call    boxfill                                 ; 040D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0412 _ 83. C4, 20
        sub     esp, 8                                  ; 0415 _ 83. EC, 08
        lea     eax, [ebp-0E0H]                         ; 0418 _ 8D. 85, FFFFFF20
        push    eax                                     ; 041E _ 50
        push    0                                       ; 041F _ 6A, 00
        push    28                                      ; 0421 _ 6A, 1C
        push    40                                      ; 0423 _ 6A, 28
        push    160                                     ; 0425 _ 68, 000000A0
        push    dword [ebp-30H]                         ; 042A _ FF. 75, D0
        call    showString                              ; 042D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0432 _ 83. C4, 20
        sub     esp, 8                                  ; 0435 _ 83. EC, 08
        push    44                                      ; 0438 _ 6A, 2C
        push    120                                     ; 043A _ 6A, 78
        push    28                                      ; 043C _ 6A, 1C
        push    40                                      ; 043E _ 6A, 28
        push    dword [ebp-3CH]                         ; 0440 _ FF. 75, C4
        push    dword [ebp-28H]                         ; 0443 _ FF. 75, D8
        call    sheet_refresh                           ; 0446 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 044B _ 83. C4, 20
        cli                                             ; 044E _ FA
        sub     esp, 12                                 ; 044F _ 83. EC, 0C
        push    keyfifo                                 ; 0452 _ 68, 00000000(d)
        call    fifo_status                             ; 0457 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 045C _ 83. C4, 10
        test    eax, eax                                ; 045F _ 85. C0
        je      ?_006                                   ; 0461 _ 0F 84, 0000011C
        sub     esp, 12                                 ; 0467 _ 83. EC, 0C
        push    keyfifo                                 ; 046A _ 68, 00000000(d)
        call    fifo_get                                ; 046F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0474 _ 83. C4, 10
        mov     byte [ebp-41H], al                      ; 0477 _ 88. 45, BF
        sti                                             ; 047A _ FB
        cmp     byte [ebp-41H], 28                      ; 047B _ 80. 7D, BF, 1C
        jnz     ?_005                                   ; 047F _ 75, 6A
        mov     eax, dword [ysize]                      ; 0481 _ A1, 00000008(d)
        lea     ecx, [eax-10H]                          ; 0486 _ 8D. 48, F0
        mov     eax, dword [xsize]                      ; 0489 _ A1, 00000004(d)
        sub     esp, 8                                  ; 048E _ 83. EC, 08
        lea     edx, [ebp-0E0H]                         ; 0491 _ 8D. 95, FFFFFF20
        push    edx                                     ; 0497 _ 52
        push    0                                       ; 0498 _ 6A, 00
        push    ecx                                     ; 049A _ 51
        push    0                                       ; 049B _ 6A, 00
        push    eax                                     ; 049D _ 50
        push    dword [ebp-2CH]                         ; 049E _ FF. 75, D4
        call    showString                              ; 04A1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04A6 _ 83. C4, 20
        mov     edx, dword [ysize]                      ; 04A9 _ 8B. 15, 00000008(d)
        mov     eax, dword [xsize]                      ; 04AF _ A1, 00000004(d)
        sub     esp, 8                                  ; 04B4 _ 83. EC, 08
        push    edx                                     ; 04B7 _ 52
        push    eax                                     ; 04B8 _ 50
        push    0                                       ; 04B9 _ 6A, 00
        push    0                                       ; 04BB _ 6A, 00
        push    dword [ebp-34H]                         ; 04BD _ FF. 75, CC
        push    dword [ebp-28H]                         ; 04C0 _ FF. 75, D8
        call    sheet_refresh                           ; 04C3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04C8 _ 83. C4, 20
        mov     edx, dword [ysize]                      ; 04CB _ 8B. 15, 00000008(d)
        mov     eax, dword [xsize]                      ; 04D1 _ A1, 00000004(d)
        sub     esp, 4                                  ; 04D6 _ 83. EC, 04
        push    edx                                     ; 04D9 _ 52
        push    eax                                     ; 04DA _ 50
        push    dword [ebp-2CH]                         ; 04DB _ FF. 75, D4
        call    init_screen                             ; 04DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04E3 _ 83. C4, 10
        jmp     ?_004                                   ; 04E6 _ E9, FFFFFEF0

?_005:  movsx   eax, byte [ebp-41H]                     ; 04EB _ 0F BE. 45, BF
        movzx   eax, byte [keytable+eax]                ; 04EF _ 0F B6. 80, 00000000(d)
        test    al, al                                  ; 04F6 _ 84. C0
        je      ?_004                                   ; 04F8 _ 0F 84, FFFFFEDD
        mov     eax, dword [x.1735]                     ; 04FE _ A1, 00000200(d)
        add     eax, 16                                 ; 0503 _ 83. C0, 10
        mov     dword [x.1735], eax                     ; 0506 _ A3, 00000200(d)
        movsx   eax, byte [ebp-41H]                     ; 050B _ 0F BE. 45, BF
        movzx   eax, byte [keytable+eax]                ; 050F _ 0F B6. 80, 00000000(d)
        mov     byte [ebp-0E2H], al                     ; 0516 _ 88. 85, FFFFFF1E
        mov     byte [ebp-0E1H], 0                      ; 051C _ C6. 85, FFFFFF1F, 00
        mov     ecx, dword [y.1736]                     ; 0523 _ 8B. 0D, 00000204(d)
        mov     edx, dword [x.1735]                     ; 0529 _ 8B. 15, 00000200(d)
        mov     eax, dword [xsize]                      ; 052F _ A1, 00000004(d)
        sub     esp, 8                                  ; 0534 _ 83. EC, 08
        lea     ebx, [ebp-0E2H]                         ; 0537 _ 8D. 9D, FFFFFF1E
        push    ebx                                     ; 053D _ 53
        push    0                                       ; 053E _ 6A, 00
        push    ecx                                     ; 0540 _ 51
        push    edx                                     ; 0541 _ 52
        push    eax                                     ; 0542 _ 50
        push    dword [ebp-2CH]                         ; 0543 _ FF. 75, D4
        call    showString                              ; 0546 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 054B _ 83. C4, 20
        mov     eax, dword [y.1736]                     ; 054E _ A1, 00000204(d)
        lea     ebx, [eax+10H]                          ; 0553 _ 8D. 58, 10
        mov     eax, dword [x.1735]                     ; 0556 _ A1, 00000200(d)
        lea     ecx, [eax+10H]                          ; 055B _ 8D. 48, 10
        mov     edx, dword [y.1736]                     ; 055E _ 8B. 15, 00000204(d)
        mov     eax, dword [x.1735]                     ; 0564 _ A1, 00000200(d)
        sub     esp, 8                                  ; 0569 _ 83. EC, 08
        push    ebx                                     ; 056C _ 53
        push    ecx                                     ; 056D _ 51
        push    edx                                     ; 056E _ 52
        push    eax                                     ; 056F _ 50
        push    dword [ebp-34H]                         ; 0570 _ FF. 75, CC
        push    dword [ebp-28H]                         ; 0573 _ FF. 75, D8
        call    sheet_refresh                           ; 0576 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 057B _ 83. C4, 20
        jmp     ?_004                                   ; 057E _ E9, FFFFFE58

?_006:  sub     esp, 12                                 ; 0583 _ 83. EC, 0C
        push    mousefifo                               ; 0586 _ 68, 00000018(d)
        call    fifo_status                             ; 058B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0590 _ 83. C4, 10
        test    eax, eax                                ; 0593 _ 85. C0
        je      ?_011                                   ; 0595 _ 0F 84, 000000AB
        sub     esp, 12                                 ; 059B _ 83. EC, 0C
        push    mousefifo                               ; 059E _ 68, 00000018(d)
        call    fifo_get                                ; 05A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05A8 _ 83. C4, 10
        mov     byte [ebp-42H], al                      ; 05AB _ 88. 45, BE
        sti                                             ; 05AE _ FB
        movzx   eax, byte [ebp-42H]                     ; 05AF _ 0F B6. 45, BE
        movzx   eax, al                                 ; 05B3 _ 0F B6. C0
        sub     esp, 8                                  ; 05B6 _ 83. EC, 08
        push    eax                                     ; 05B9 _ 50
        lea     eax, [ebp-0A0H]                         ; 05BA _ 8D. 85, FFFFFF60
        push    eax                                     ; 05C0 _ 50
        call    mouse_decode                            ; 05C1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05C6 _ 83. C4, 10
        test    eax, eax                                ; 05C9 _ 85. C0
        je      ?_004                                   ; 05CB _ 0F 84, FFFFFE0A
        mov     eax, dword [ebp-9CH]                    ; 05D1 _ 8B. 85, FFFFFF64
        add     dword [ebp-0CH], eax                    ; 05D7 _ 01. 45, F4
        mov     eax, dword [ebp-98H]                    ; 05DA _ 8B. 85, FFFFFF68
        add     dword [ebp-10H], eax                    ; 05E0 _ 01. 45, F0
        cmp     dword [ebp-0CH], 0                      ; 05E3 _ 83. 7D, F4, 00
        jns     ?_007                                   ; 05E7 _ 79, 07
        mov     dword [ebp-0CH], 0                      ; 05E9 _ C7. 45, F4, 00000000
?_007:  cmp     dword [ebp-10H], 0                      ; 05F0 _ 83. 7D, F0, 00
        jns     ?_008                                   ; 05F4 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 05F6 _ C7. 45, F0, 00000000
?_008:  mov     eax, dword [xsize]                      ; 05FD _ A1, 00000004(d)
        sub     eax, 16                                 ; 0602 _ 83. E8, 10
        cmp     eax, dword [ebp-0CH]                    ; 0605 _ 3B. 45, F4
        jge     ?_009                                   ; 0608 _ 7D, 0B
        mov     eax, dword [xsize]                      ; 060A _ A1, 00000004(d)
        sub     eax, 16                                 ; 060F _ 83. E8, 10
        mov     dword [ebp-0CH], eax                    ; 0612 _ 89. 45, F4
?_009:  mov     eax, dword [ysize]                      ; 0615 _ A1, 00000008(d)
        sub     eax, 16                                 ; 061A _ 83. E8, 10
        cmp     eax, dword [ebp-10H]                    ; 061D _ 3B. 45, F0
        jge     ?_010                                   ; 0620 _ 7D, 0B
        mov     eax, dword [ysize]                      ; 0622 _ A1, 00000008(d)
        sub     eax, 16                                 ; 0627 _ 83. E8, 10
        mov     dword [ebp-10H], eax                    ; 062A _ 89. 45, F0
?_010:  push    dword [ebp-10H]                         ; 062D _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0630 _ FF. 75, F4
        push    dword [ebp-38H]                         ; 0633 _ FF. 75, C8
        push    dword [ebp-28H]                         ; 0636 _ FF. 75, D8
        call    sheet_slide                             ; 0639 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 063E _ 83. C4, 10
        jmp     ?_004                                   ; 0641 _ E9, FFFFFD95

?_011:  sub     esp, 12                                 ; 0646 _ 83. EC, 0C
        lea     eax, [ebp-60H]                          ; 0649 _ 8D. 45, A0
        push    eax                                     ; 064C _ 50
        call    fifo_status                             ; 064D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0652 _ 83. C4, 10
        test    eax, eax                                ; 0655 _ 85. C0
        jz      ?_012                                   ; 0657 _ 74, 72
        sub     esp, 12                                 ; 0659 _ 83. EC, 0C
        lea     eax, [ebp-60H]                          ; 065C _ 8D. 45, A0
        push    eax                                     ; 065F _ 50
        call    fifo_get                                ; 0660 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0665 _ 83. C4, 10
        mov     byte [ebp-43H], al                      ; 0668 _ 88. 45, BD
        sti                                             ; 066B _ FB
        movsx   eax, byte [ebp-43H]                     ; 066C _ 0F BE. 45, BD
        sub     esp, 4                                  ; 0670 _ 83. EC, 04
        push    eax                                     ; 0673 _ 50
        push    ?_176                                   ; 0674 _ 68, 0000001B(d)
        lea     eax, [ebp-0E0H]                         ; 0679 _ 8D. 85, FFFFFF20
        push    eax                                     ; 067F _ 50
        call    sprintf                                 ; 0680 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0685 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 0688 _ A1, 00000004(d)
        sub     esp, 8                                  ; 068D _ 83. EC, 08
        lea     edx, [ebp-0E0H]                         ; 0690 _ 8D. 95, FFFFFF20
        push    edx                                     ; 0696 _ 52
        push    0                                       ; 0697 _ 6A, 00
        push    0                                       ; 0699 _ 6A, 00
        push    0                                       ; 069B _ 6A, 00
        push    eax                                     ; 069D _ 50
        push    dword [ebp-2CH]                         ; 069E _ FF. 75, D4
        call    showString                              ; 06A1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06A6 _ 83. C4, 20
        mov     eax, dword [xsize]                      ; 06A9 _ A1, 00000004(d)
        sub     esp, 8                                  ; 06AE _ 83. EC, 08
        push    16                                      ; 06B1 _ 6A, 10
        push    eax                                     ; 06B3 _ 50
        push    0                                       ; 06B4 _ 6A, 00
        push    0                                       ; 06B6 _ 6A, 00
        push    dword [ebp-34H]                         ; 06B8 _ FF. 75, CC
        push    dword [ebp-28H]                         ; 06BB _ FF. 75, D8
        call    sheet_refresh                           ; 06BE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06C3 _ 83. C4, 20
        jmp     ?_004                                   ; 06C6 _ E9, FFFFFD10

?_012:  sub     esp, 12                                 ; 06CB _ 83. EC, 0C
        lea     eax, [ebp-78H]                          ; 06CE _ 8D. 45, 88
        push    eax                                     ; 06D1 _ 50
        call    fifo_status                             ; 06D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06D7 _ 83. C4, 10
        test    eax, eax                                ; 06DA _ 85. C0
        jz      ?_013                                   ; 06DC _ 74, 72
        sub     esp, 12                                 ; 06DE _ 83. EC, 0C
        lea     eax, [ebp-78H]                          ; 06E1 _ 8D. 45, 88
        push    eax                                     ; 06E4 _ 50
        call    fifo_get                                ; 06E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06EA _ 83. C4, 10
        mov     byte [ebp-44H], al                      ; 06ED _ 88. 45, BC
        sti                                             ; 06F0 _ FB
        movsx   eax, byte [ebp-44H]                     ; 06F1 _ 0F BE. 45, BC
        sub     esp, 4                                  ; 06F5 _ 83. EC, 04
        push    eax                                     ; 06F8 _ 50
        push    ?_176                                   ; 06F9 _ 68, 0000001B(d)
        lea     eax, [ebp-0E0H]                         ; 06FE _ 8D. 85, FFFFFF20
        push    eax                                     ; 0704 _ 50
        call    sprintf                                 ; 0705 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 070A _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 070D _ A1, 00000004(d)
        sub     esp, 8                                  ; 0712 _ 83. EC, 08
        lea     edx, [ebp-0E0H]                         ; 0715 _ 8D. 95, FFFFFF20
        push    edx                                     ; 071B _ 52
        push    0                                       ; 071C _ 6A, 00
        push    16                                      ; 071E _ 6A, 10
        push    0                                       ; 0720 _ 6A, 00
        push    eax                                     ; 0722 _ 50
        push    dword [ebp-2CH]                         ; 0723 _ FF. 75, D4
        call    showString                              ; 0726 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 072B _ 83. C4, 20
        mov     eax, dword [xsize]                      ; 072E _ A1, 00000004(d)
        sub     esp, 8                                  ; 0733 _ 83. EC, 08
        push    32                                      ; 0736 _ 6A, 20
        push    eax                                     ; 0738 _ 50
        push    16                                      ; 0739 _ 6A, 10
        push    0                                       ; 073B _ 6A, 00
        push    dword [ebp-34H]                         ; 073D _ FF. 75, CC
        push    dword [ebp-28H]                         ; 0740 _ FF. 75, D8
        call    sheet_refresh                           ; 0743 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0748 _ 83. C4, 20
        jmp     ?_004                                   ; 074B _ E9, FFFFFC8B

?_013:  sub     esp, 12                                 ; 0750 _ 83. EC, 0C
        lea     eax, [ebp-90H]                          ; 0753 _ 8D. 85, FFFFFF70
        push    eax                                     ; 0759 _ 50
        call    fifo_status                             ; 075A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 075F _ 83. C4, 10
        test    eax, eax                                ; 0762 _ 85. C0
        je      ?_016                                   ; 0764 _ 0F 84, 000000B6
        sub     esp, 12                                 ; 076A _ 83. EC, 0C
        lea     eax, [ebp-90H]                          ; 076D _ 8D. 85, FFFFFF70
        push    eax                                     ; 0773 _ 50
        call    fifo_get                                ; 0774 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0779 _ 83. C4, 10
        mov     byte [ebp-45H], al                      ; 077C _ 88. 45, BB
        sti                                             ; 077F _ FB
        cmp     byte [ebp-45H], 0                       ; 0780 _ 80. 7D, BB, 00
        jz      ?_014                                   ; 0784 _ 74, 37
        sub     esp, 4                                  ; 0786 _ 83. EC, 04
        push    0                                       ; 0789 _ 6A, 00
        lea     eax, [ebp-90H]                          ; 078B _ 8D. 85, FFFFFF70
        push    eax                                     ; 0791 _ 50
        push    dword [ebp-20H]                         ; 0792 _ FF. 75, E0
        call    timer_init                              ; 0795 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 079A _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 079D _ A1, 00000004(d)
        sub     esp, 4                                  ; 07A2 _ 83. EC, 04
        push    111                                     ; 07A5 _ 6A, 6F
        push    15                                      ; 07A7 _ 6A, 0F
        push    96                                      ; 07A9 _ 6A, 60
        push    8                                       ; 07AB _ 6A, 08
        push    7                                       ; 07AD _ 6A, 07
        push    eax                                     ; 07AF _ 50
        push    dword [ebp-2CH]                         ; 07B0 _ FF. 75, D4
        call    boxfill                                 ; 07B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07B8 _ 83. C4, 20
        jmp     ?_015                                   ; 07BB _ EB, 35

?_014:  sub     esp, 4                                  ; 07BD _ 83. EC, 04
        push    1                                       ; 07C0 _ 6A, 01
        lea     eax, [ebp-90H]                          ; 07C2 _ 8D. 85, FFFFFF70
        push    eax                                     ; 07C8 _ 50
        push    dword [ebp-20H]                         ; 07C9 _ FF. 75, E0
        call    timer_init                              ; 07CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07D1 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 07D4 _ A1, 00000004(d)
        sub     esp, 4                                  ; 07D9 _ 83. EC, 04
        push    111                                     ; 07DC _ 6A, 6F
        push    15                                      ; 07DE _ 6A, 0F
        push    96                                      ; 07E0 _ 6A, 60
        push    8                                       ; 07E2 _ 6A, 08
        push    14                                      ; 07E4 _ 6A, 0E
        push    eax                                     ; 07E6 _ 50
        push    dword [ebp-2CH]                         ; 07E7 _ FF. 75, D4
        call    boxfill                                 ; 07EA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07EF _ 83. C4, 20
?_015:  sub     esp, 8                                  ; 07F2 _ 83. EC, 08
        push    50                                      ; 07F5 _ 6A, 32
        push    dword [ebp-20H]                         ; 07F7 _ FF. 75, E0
        call    timer_settime                           ; 07FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07FF _ 83. C4, 10
        sub     esp, 8                                  ; 0802 _ 83. EC, 08
        push    111                                     ; 0805 _ 6A, 6F
        push    15                                      ; 0807 _ 6A, 0F
        push    96                                      ; 0809 _ 6A, 60
        push    8                                       ; 080B _ 6A, 08
        push    dword [ebp-34H]                         ; 080D _ FF. 75, CC
        push    dword [ebp-28H]                         ; 0810 _ FF. 75, D8
        call    sheet_refresh                           ; 0813 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0818 _ 83. C4, 20
        jmp     ?_004                                   ; 081B _ E9, FFFFFBBB

?_016:  sti                                             ; 0820 _ FB
        jmp     ?_004                                   ; 0821 _ E9, FFFFFBB5
; cmain End of function

printdTotalMem:; Function begin
        push    ebp                                     ; 0826 _ 55
        mov     ebp, esp                                ; 0827 _ 89. E5
        sub     esp, 24                                 ; 0829 _ 83. EC, 18
        mov     dword [ebp-0CH], 1048576                ; 082C _ C7. 45, F4, 00100000
        mov     eax, dword [memman]                     ; 0833 _ A1, 00000000(d)
        sub     esp, 12                                 ; 0838 _ 83. EC, 0C
        push    eax                                     ; 083B _ 50
        call    memman_total                            ; 083C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0841 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0844 _ 89. 45, F0
        sub     esp, 12                                 ; 0847 _ 83. EC, 0C
        push    ?_177                                   ; 084A _ 68, 00000023(d)
        call    printd                                  ; 084F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0854 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 0857 _ 8B. 45, F0
        cdq                                             ; 085A _ 99
        idiv    dword [ebp-0CH]                         ; 085B _ F7. 7D, F4
        sub     esp, 12                                 ; 085E _ 83. EC, 0C
        push    eax                                     ; 0861 _ 50
        call    printi                                  ; 0862 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0867 _ 83. C4, 10
        sub     esp, 12                                 ; 086A _ 83. EC, 0C
        push    ?_178                                   ; 086D _ 68, 0000002D(d)
        call    printd                                  ; 0872 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0877 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 087A _ 8B. 45, F0
        lea     edx, [eax+3FFH]                         ; 087D _ 8D. 90, 000003FF
        test    eax, eax                                ; 0883 _ 85. C0
        cmovs   eax, edx                                ; 0885 _ 0F 48. C2
        sar     eax, 10                                 ; 0888 _ C1. F8, 0A
        sub     esp, 12                                 ; 088B _ 83. EC, 0C
        push    eax                                     ; 088E _ 50
        call    printi                                  ; 088F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0894 _ 83. C4, 10
        sub     esp, 12                                 ; 0897 _ 83. EC, 0C
        push    ?_179                                   ; 089A _ 68, 00000032(d)
        call    printd                                  ; 089F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08A4 _ 83. C4, 10
        nop                                             ; 08A7 _ 90
        leave                                           ; 08A8 _ C9
        ret                                             ; 08A9 _ C3
; printdTotalMem End of function

testMem:; Function begin
        push    ebp                                     ; 08AA _ 55
        mov     ebp, esp                                ; 08AB _ 89. E5
        sub     esp, 24                                 ; 08AD _ 83. EC, 18
        sub     esp, 12                                 ; 08B0 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 08B3 _ FF. 75, 08
        call    printdTotalMem                          ; 08B6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08BB _ 83. C4, 10
        mov     eax, dword [memman]                     ; 08BE _ A1, 00000000(d)
        sub     esp, 8                                  ; 08C3 _ 83. EC, 08
        push    209715200                               ; 08C6 _ 68, 0C800000
        push    eax                                     ; 08CB _ 50
        call    memman_alloc                            ; 08CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08D1 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 08D4 _ 89. 45, F4
        sub     esp, 12                                 ; 08D7 _ 83. EC, 0C
        push    ?_180                                   ; 08DA _ 68, 00000035(d)
        call    printd                                  ; 08DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08E4 _ 83. C4, 10
        sub     esp, 12                                 ; 08E7 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 08EA _ FF. 75, 08
        call    printdTotalMem                          ; 08ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08F2 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 08F5 _ A1, 00000000(d)
        sub     esp, 8                                  ; 08FA _ 83. EC, 08
        push    1                                       ; 08FD _ 6A, 01
        push    eax                                     ; 08FF _ 50
        call    memman_alloc_4k                         ; 0900 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0905 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0908 _ 89. 45, F0
        sub     esp, 12                                 ; 090B _ 83. EC, 0C
        push    ?_180                                   ; 090E _ 68, 00000035(d)
        call    printd                                  ; 0913 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0918 _ 83. C4, 10
        sub     esp, 12                                 ; 091B _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 091E _ FF. 75, 08
        call    printdTotalMem                          ; 0921 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0926 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0929 _ A1, 00000000(d)
        sub     esp, 8                                  ; 092E _ 83. EC, 08
        push    4296                                    ; 0931 _ 68, 000010C8
        push    eax                                     ; 0936 _ 50
        call    memman_alloc_4k                         ; 0937 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 093C _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 093F _ 89. 45, EC
        sub     esp, 12                                 ; 0942 _ 83. EC, 0C
        push    ?_180                                   ; 0945 _ 68, 00000035(d)
        call    printd                                  ; 094A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 094F _ 83. C4, 10
        sub     esp, 12                                 ; 0952 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 0955 _ FF. 75, 08
        call    printdTotalMem                          ; 0958 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 095D _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0960 _ A1, 00000000(d)
        sub     esp, 4                                  ; 0965 _ 83. EC, 04
        push    1                                       ; 0968 _ 6A, 01
        push    dword [ebp-10H]                         ; 096A _ FF. 75, F0
        push    eax                                     ; 096D _ 50
        call    memman_free_4k                          ; 096E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0973 _ 83. C4, 10
        sub     esp, 12                                 ; 0976 _ 83. EC, 0C
        push    ?_181                                   ; 0979 _ 68, 0000003C(d)
        call    printd                                  ; 097E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0983 _ 83. C4, 10
        sub     esp, 12                                 ; 0986 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 0989 _ FF. 75, 08
        call    printdTotalMem                          ; 098C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0991 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0994 _ A1, 00000000(d)
        sub     esp, 4                                  ; 0999 _ 83. EC, 04
        push    4296                                    ; 099C _ 68, 000010C8
        push    dword [ebp-14H]                         ; 09A1 _ FF. 75, EC
        push    eax                                     ; 09A4 _ 50
        call    memman_free_4k                          ; 09A5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09AA _ 83. C4, 10
        sub     esp, 12                                 ; 09AD _ 83. EC, 0C
        push    ?_181                                   ; 09B0 _ 68, 0000003C(d)
        call    printd                                  ; 09B5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09BA _ 83. C4, 10
        sub     esp, 12                                 ; 09BD _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 09C0 _ FF. 75, 08
        call    printdTotalMem                          ; 09C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09C8 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 09CB _ A1, 00000000(d)
        sub     esp, 4                                  ; 09D0 _ 83. EC, 04
        push    209715200                               ; 09D3 _ 68, 0C800000
        push    dword [ebp-0CH]                         ; 09D8 _ FF. 75, F4
        push    eax                                     ; 09DB _ 50
        call    memman_free                             ; 09DC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09E1 _ 83. C4, 10
        sub     esp, 12                                 ; 09E4 _ 83. EC, 0C
        push    ?_181                                   ; 09E7 _ 68, 0000003C(d)
        call    printd                                  ; 09EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09F1 _ 83. C4, 10
        sub     esp, 12                                 ; 09F4 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 09F7 _ FF. 75, 08
        call    printdTotalMem                          ; 09FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09FF _ 83. C4, 10
        nop                                             ; 0A02 _ 90
        leave                                           ; 0A03 _ C9
        ret                                             ; 0A04 _ C3
; testMem End of function

toHex:  ; Function begin
        push    ebp                                     ; 0A05 _ 55
        mov     ebp, esp                                ; 0A06 _ 89. E5
        sub     esp, 20                                 ; 0A08 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0A0B _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0A0E _ 88. 45, EC
        mov     dword [ebp-4H], ?_182                   ; 0A11 _ C7. 45, FC, 00000043(d)
        movzx   eax, byte [ebp-14H]                     ; 0A18 _ 0F B6. 45, EC
        sar     al, 4                                   ; 0A1C _ C0. F8, 04
        movsx   eax, al                                 ; 0A1F _ 0F BE. C0
        and     eax, 0FH                                ; 0A22 _ 83. E0, 0F
        mov     edx, eax                                ; 0A25 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A27 _ 8B. 45, FC
        add     eax, edx                                ; 0A2A _ 01. D0
        movzx   edx, byte [eax]                         ; 0A2C _ 0F B6. 10
        mov     eax, dword [ebp+0CH]                    ; 0A2F _ 8B. 45, 0C
        mov     byte [eax], dl                          ; 0A32 _ 88. 10
        mov     eax, dword [ebp+0CH]                    ; 0A34 _ 8B. 45, 0C
        lea     edx, [eax+1H]                           ; 0A37 _ 8D. 50, 01
        movsx   eax, byte [ebp-14H]                     ; 0A3A _ 0F BE. 45, EC
        and     eax, 0FH                                ; 0A3E _ 83. E0, 0F
        mov     ecx, eax                                ; 0A41 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0A43 _ 8B. 45, FC
        add     eax, ecx                                ; 0A46 _ 01. C8
        movzx   eax, byte [eax]                         ; 0A48 _ 0F B6. 00
        mov     byte [edx], al                          ; 0A4B _ 88. 02
        nop                                             ; 0A4D _ 90
        leave                                           ; 0A4E _ C9
        ret                                             ; 0A4F _ C3
; toHex End of function

showMemInfo:; Function begin
        push    ebp                                     ; 0A50 _ 55
        mov     ebp, esp                                ; 0A51 _ 89. E5
        sub     esp, 24                                 ; 0A53 _ 83. EC, 18
        mov     dword [ebp-11H], 0                      ; 0A56 _ C7. 45, EF, 00000000
        mov     dword [ebp-0DH], 0                      ; 0A5D _ C7. 45, F3, 00000000
        mov     byte [ebp-9H], 0                        ; 0A64 _ C6. 45, F7, 00
        sub     esp, 12                                 ; 0A68 _ 83. EC, 0C
        push    ?_183                                   ; 0A6B _ 68, 00000054(d)
        call    printd                                  ; 0A70 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A75 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0A78 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0A7B _ 8B. 00
        sub     esp, 8                                  ; 0A7D _ 83. EC, 08
        lea     edx, [ebp-11H]                          ; 0A80 _ 8D. 55, EF
        push    edx                                     ; 0A83 _ 52
        push    eax                                     ; 0A84 _ 50
        call    int2hex                                 ; 0A85 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A8A _ 83. C4, 10
        sub     esp, 12                                 ; 0A8D _ 83. EC, 0C
        lea     eax, [ebp-11H]                          ; 0A90 _ 8D. 45, EF
        push    eax                                     ; 0A93 _ 50
        call    printd                                  ; 0A94 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A99 _ 83. C4, 10
        sub     esp, 12                                 ; 0A9C _ 83. EC, 0C
        push    ?_184                                   ; 0A9F _ 68, 00000061(d)
        call    printd                                  ; 0AA4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AA9 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0AAC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0AAF _ 8B. 40, 04
        sub     esp, 8                                  ; 0AB2 _ 83. EC, 08
        lea     edx, [ebp-11H]                          ; 0AB5 _ 8D. 55, EF
        push    edx                                     ; 0AB8 _ 52
        push    eax                                     ; 0AB9 _ 50
        call    int2hex                                 ; 0ABA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ABF _ 83. C4, 10
        sub     esp, 12                                 ; 0AC2 _ 83. EC, 0C
        lea     eax, [ebp-11H]                          ; 0AC5 _ 8D. 45, EF
        push    eax                                     ; 0AC8 _ 50
        call    printd                                  ; 0AC9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ACE _ 83. C4, 10
        sub     esp, 12                                 ; 0AD1 _ 83. EC, 0C
        push    ?_185                                   ; 0AD4 _ 68, 00000070(d)
        call    printd                                  ; 0AD9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ADE _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0AE1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0AE4 _ 8B. 40, 08
        sub     esp, 8                                  ; 0AE7 _ 83. EC, 08
        lea     edx, [ebp-11H]                          ; 0AEA _ 8D. 55, EF
        push    edx                                     ; 0AED _ 52
        push    eax                                     ; 0AEE _ 50
        call    int2hex                                 ; 0AEF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AF4 _ 83. C4, 10
        sub     esp, 12                                 ; 0AF7 _ 83. EC, 0C
        lea     eax, [ebp-11H]                          ; 0AFA _ 8D. 45, EF
        push    eax                                     ; 0AFD _ 50
        call    printd                                  ; 0AFE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B03 _ 83. C4, 10
        sub     esp, 12                                 ; 0B06 _ 83. EC, 0C
        push    ?_186                                   ; 0B09 _ 68, 0000007C(d)
        call    printd                                  ; 0B0E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B13 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0B16 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B19 _ 8B. 40, 0C
        sub     esp, 8                                  ; 0B1C _ 83. EC, 08
        lea     edx, [ebp-11H]                          ; 0B1F _ 8D. 55, EF
        push    edx                                     ; 0B22 _ 52
        push    eax                                     ; 0B23 _ 50
        call    int2hex                                 ; 0B24 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B29 _ 83. C4, 10
        sub     esp, 12                                 ; 0B2C _ 83. EC, 0C
        lea     eax, [ebp-11H]                          ; 0B2F _ 8D. 45, EF
        push    eax                                     ; 0B32 _ 50
        call    printd                                  ; 0B33 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B38 _ 83. C4, 10
        sub     esp, 12                                 ; 0B3B _ 83. EC, 0C
        push    ?_187                                   ; 0B3E _ 68, 00000089(d)
        call    printd                                  ; 0B43 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B48 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0B4B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B4E _ 8B. 40, 10
        sub     esp, 8                                  ; 0B51 _ 83. EC, 08
        lea     edx, [ebp-11H]                          ; 0B54 _ 8D. 55, EF
        push    edx                                     ; 0B57 _ 52
        push    eax                                     ; 0B58 _ 50
        call    int2hex                                 ; 0B59 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B5E _ 83. C4, 10
        sub     esp, 12                                 ; 0B61 _ 83. EC, 0C
        lea     eax, [ebp-11H]                          ; 0B64 _ 8D. 45, EF
        push    eax                                     ; 0B67 _ 50
        call    printd                                  ; 0B68 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B6D _ 83. C4, 10
        nop                                             ; 0B70 _ 90
        leave                                           ; 0B71 _ C9
        ret                                             ; 0B72 _ C3
; showMemInfo End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0B73 _ 55
        mov     ebp, esp                                ; 0B74 _ 89. E5
        sub     esp, 20                                 ; 0B76 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0B79 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0B7C _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 0B7F _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0B82 _ 0F B6. 40, 03
        mov     byte [ebp-1H], al                       ; 0B86 _ 88. 45, FF
        cmp     byte [ebp-1H], 0                        ; 0B89 _ 80. 7D, FF, 00
        jnz     ?_018                                   ; 0B8D _ 75, 17
        cmp     byte [ebp-14H], -6                      ; 0B8F _ 80. 7D, EC, FA
        jnz     ?_017                                   ; 0B93 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0B95 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0B98 _ C6. 40, 03, 01
?_017:  mov     eax, 0                                  ; 0B9C _ B8, 00000000
        jmp     ?_025                                   ; 0BA1 _ E9, 00000100

?_018:  cmp     byte [ebp-1H], 1                        ; 0BA6 _ 80. 7D, FF, 01
        jnz     ?_020                                   ; 0BAA _ 75, 28
        movzx   eax, byte [ebp-14H]                     ; 0BAC _ 0F B6. 45, EC
        and     eax, 0C8H                               ; 0BB0 _ 25, 000000C8
        cmp     eax, 8                                  ; 0BB5 _ 83. F8, 08
        jnz     ?_019                                   ; 0BB8 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0BBA _ 8B. 45, 08
        movzx   edx, byte [ebp-14H]                     ; 0BBD _ 0F B6. 55, EC
        mov     byte [eax], dl                          ; 0BC1 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0BC3 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0BC6 _ C6. 40, 03, 02
?_019:  mov     eax, 0                                  ; 0BCA _ B8, 00000000
        jmp     ?_025                                   ; 0BCF _ E9, 000000D2

?_020:  cmp     byte [ebp-1H], 2                        ; 0BD4 _ 80. 7D, FF, 02
        jnz     ?_021                                   ; 0BD8 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0BDA _ 8B. 45, 08
        movzx   edx, byte [ebp-14H]                     ; 0BDD _ 0F B6. 55, EC
        mov     byte [eax+1H], dl                       ; 0BE1 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0BE4 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0BE7 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0BEB _ B8, 00000000
        jmp     ?_025                                   ; 0BF0 _ E9, 000000B1

?_021:  cmp     byte [ebp-1H], 3                        ; 0BF5 _ 80. 7D, FF, 03
        jne     ?_024                                   ; 0BF9 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0BFF _ 8B. 45, 08
        movzx   edx, byte [ebp-14H]                     ; 0C02 _ 0F B6. 55, EC
        mov     byte [eax+2H], dl                       ; 0C06 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0C09 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0C0C _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0C10 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C13 _ 0F B6. 00
        movzx   eax, al                                 ; 0C16 _ 0F B6. C0
        and     eax, 07H                                ; 0C19 _ 83. E0, 07
        mov     edx, eax                                ; 0C1C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C1E _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0C21 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0C24 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0C27 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0C2B _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0C2E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0C31 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C34 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0C37 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0C3B _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0C3E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C41 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0C44 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C47 _ 0F B6. 00
        movzx   eax, al                                 ; 0C4A _ 0F B6. C0
        and     eax, 10H                                ; 0C4D _ 83. E0, 10
        test    eax, eax                                ; 0C50 _ 85. C0
        jz      ?_022                                   ; 0C52 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0C54 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0C57 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0C5A _ 0D, FFFFFF00
        mov     edx, eax                                ; 0C5F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C61 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0C64 _ 89. 50, 04
?_022:  mov     eax, dword [ebp+8H]                     ; 0C67 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0C6A _ 0F B6. 00
        movzx   eax, al                                 ; 0C6D _ 0F B6. C0
        and     eax, 20H                                ; 0C70 _ 83. E0, 20
        test    eax, eax                                ; 0C73 _ 85. C0
        jz      ?_023                                   ; 0C75 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0C77 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C7A _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0C7D _ 0D, FFFFFF00
        mov     edx, eax                                ; 0C82 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C84 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C87 _ 89. 50, 08
?_023:  mov     eax, dword [ebp+8H]                     ; 0C8A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0C8D _ 8B. 40, 08
        neg     eax                                     ; 0C90 _ F7. D8
        mov     edx, eax                                ; 0C92 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C94 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0C97 _ 89. 50, 08
        mov     eax, 1                                  ; 0C9A _ B8, 00000001
        jmp     ?_025                                   ; 0C9F _ EB, 05

?_024:  mov     eax, 4294967295                         ; 0CA1 _ B8, FFFFFFFF
?_025:  leave                                           ; 0CA6 _ C9
        ret                                             ; 0CA7 _ C3
; mouse_decode End of function

printd: ; Function begin
        push    ebp                                     ; 0CA8 _ 55
        mov     ebp, esp                                ; 0CA9 _ 89. E5
        push    esi                                     ; 0CAB _ 56
        push    ebx                                     ; 0CAC _ 53
        jmp     ?_029                                   ; 0CAD _ E9, 0000008C

?_026:  mov     eax, dword [ebp+8H]                     ; 0CB2 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0CB5 _ 0F B6. 00
        cmp     al, 10                                  ; 0CB8 _ 3C, 0A
        jnz     ?_027                                   ; 0CBA _ 75, 19
        mov     dword [printd_x], 0                     ; 0CBC _ C7. 05, 00000030(d), 00000000
        mov     eax, dword [printd_y]                   ; 0CC6 _ A1, 00000034(d)
        add     eax, 16                                 ; 0CCB _ 83. C0, 10
        mov     dword [printd_y], eax                   ; 0CCE _ A3, 00000034(d)
        jmp     ?_028                                   ; 0CD3 _ EB, 65

?_027:  mov     eax, dword [ebp+8H]                     ; 0CD5 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0CD8 _ 0F B6. 00
        movsx   esi, al                                 ; 0CDB _ 0F BE. F0
        mov     ebx, dword [printd_y]                   ; 0CDE _ 8B. 1D, 00000034(d)
        mov     ecx, dword [printd_x]                   ; 0CE4 _ 8B. 0D, 00000030(d)
        mov     edx, dword [xsize]                      ; 0CEA _ 8B. 15, 00000004(d)
        mov     eax, dword [vram]                       ; 0CF0 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0CF5 _ 83. EC, 08
        push    esi                                     ; 0CF8 _ 56
        push    0                                       ; 0CF9 _ 6A, 00
        push    ebx                                     ; 0CFB _ 53
        push    ecx                                     ; 0CFC _ 51
        push    edx                                     ; 0CFD _ 52
        push    eax                                     ; 0CFE _ 50
        call    putfont                                 ; 0CFF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D04 _ 83. C4, 20
        mov     eax, dword [printd_x]                   ; 0D07 _ A1, 00000030(d)
        add     eax, 8                                  ; 0D0C _ 83. C0, 08
        mov     dword [printd_x], eax                   ; 0D0F _ A3, 00000030(d)
        mov     edx, dword [printd_x]                   ; 0D14 _ 8B. 15, 00000030(d)
        mov     eax, dword [xsize]                      ; 0D1A _ A1, 00000004(d)
        cmp     edx, eax                                ; 0D1F _ 39. C2
        jnz     ?_028                                   ; 0D21 _ 75, 17
        mov     dword [printd_x], 0                     ; 0D23 _ C7. 05, 00000030(d), 00000000
        mov     eax, dword [printd_y]                   ; 0D2D _ A1, 00000034(d)
        add     eax, 16                                 ; 0D32 _ 83. C0, 10
        mov     dword [printd_y], eax                   ; 0D35 _ A3, 00000034(d)
?_028:  add     dword [ebp+8H], 1                       ; 0D3A _ 83. 45, 08, 01
?_029:  mov     eax, dword [ebp+8H]                     ; 0D3E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0D41 _ 0F B6. 00
        test    al, al                                  ; 0D44 _ 84. C0
        jne     ?_026                                   ; 0D46 _ 0F 85, FFFFFF66
        nop                                             ; 0D4C _ 90
        lea     esp, [ebp-8H]                           ; 0D4D _ 8D. 65, F8
        pop     ebx                                     ; 0D50 _ 5B
        pop     esi                                     ; 0D51 _ 5E
        pop     ebp                                     ; 0D52 _ 5D
        ret                                             ; 0D53 _ C3
; printd End of function

printi: ; Function begin
        push    ebp                                     ; 0D54 _ 55
        mov     ebp, esp                                ; 0D55 _ 89. E5
        sub     esp, 24                                 ; 0D57 _ 83. EC, 18
        mov     dword [ebp-11H], 0                      ; 0D5A _ C7. 45, EF, 00000000
        mov     dword [ebp-0DH], 0                      ; 0D61 _ C7. 45, F3, 00000000
        mov     byte [ebp-9H], 0                        ; 0D68 _ C6. 45, F7, 00
        mov     eax, dword [ebp+8H]                     ; 0D6C _ 8B. 45, 08
        sub     esp, 8                                  ; 0D6F _ 83. EC, 08
        lea     edx, [ebp-11H]                          ; 0D72 _ 8D. 55, EF
        push    edx                                     ; 0D75 _ 52
        push    eax                                     ; 0D76 _ 50
        call    int2hex                                 ; 0D77 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D7C _ 83. C4, 10
        sub     esp, 12                                 ; 0D7F _ 83. EC, 0C
        lea     eax, [ebp-11H]                          ; 0D82 _ 8D. 45, EF
        push    eax                                     ; 0D85 _ 50
        call    printd                                  ; 0D86 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D8B _ 83. C4, 10
        nop                                             ; 0D8E _ 90
        leave                                           ; 0D8F _ C9
        ret                                             ; 0D90 _ C3
; printi End of function

printx: ; Function begin
        push    ebp                                     ; 0D91 _ 55
        mov     ebp, esp                                ; 0D92 _ 89. E5
        sub     esp, 40                                 ; 0D94 _ 83. EC, 28
        mov     eax, dword [ebp+8H]                     ; 0D97 _ 8B. 45, 08
        mov     byte [ebp-1CH], al                      ; 0D9A _ 88. 45, E4
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [ebp-0BH], 0                       ; 0D9D _ 66: C7. 45, F5, 0000
        mov     byte [ebp-9H], 0                        ; 0DA3 _ C6. 45, F7, 00
        movsx   eax, byte [ebp-1CH]                     ; 0DA7 _ 0F BE. 45, E4
        lea     edx, [ebp-0BH]                          ; 0DAB _ 8D. 55, F5
        push    edx                                     ; 0DAE _ 52
        push    eax                                     ; 0DAF _ 50
        call    toHex                                   ; 0DB0 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 0DB5 _ 83. C4, 08
        sub     esp, 12                                 ; 0DB8 _ 83. EC, 0C
        lea     eax, [ebp-0BH]                          ; 0DBB _ 8D. 45, F5
        push    eax                                     ; 0DBE _ 50
        call    printd                                  ; 0DBF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DC4 _ 83. C4, 10
        nop                                             ; 0DC7 _ 90
        leave                                           ; 0DC8 _ C9
        ret                                             ; 0DC9 _ C3
; printx End of function

set_palette:; Function begin
        push    ebp                                     ; 0DCA _ 55
        mov     ebp, esp                                ; 0DCB _ 89. E5
        sub     esp, 24                                 ; 0DCD _ 83. EC, 18
        call    load_eflags                             ; 0DD0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0DD5 _ 89. 45, F0
        cli                                             ; 0DD8 _ FA
        mov     eax, dword [ebp+8H]                     ; 0DD9 _ 8B. 45, 08
        movsx   eax, al                                 ; 0DDC _ 0F BE. C0
        sub     esp, 8                                  ; 0DDF _ 83. EC, 08
        push    eax                                     ; 0DE2 _ 50
        push    968                                     ; 0DE3 _ 68, 000003C8
        call    outb_p                                  ; 0DE8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DED _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0DF0 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0DF3 _ 89. 45, F4
        jmp     ?_031                                   ; 0DF6 _ EB, 65

?_030:  mov     eax, dword [ebp+10H]                    ; 0DF8 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0DFB _ 0F B6. 00
        shr     al, 2                                   ; 0DFE _ C0. E8, 02
        movsx   eax, al                                 ; 0E01 _ 0F BE. C0
        sub     esp, 8                                  ; 0E04 _ 83. EC, 08
        push    eax                                     ; 0E07 _ 50
        push    969                                     ; 0E08 _ 68, 000003C9
        call    outb_p                                  ; 0E0D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E12 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0E15 _ 8B. 45, 10
        add     eax, 1                                  ; 0E18 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0E1B _ 0F B6. 00
        shr     al, 2                                   ; 0E1E _ C0. E8, 02
        movsx   eax, al                                 ; 0E21 _ 0F BE. C0
        sub     esp, 8                                  ; 0E24 _ 83. EC, 08
        push    eax                                     ; 0E27 _ 50
        push    969                                     ; 0E28 _ 68, 000003C9
        call    outb_p                                  ; 0E2D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E32 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0E35 _ 8B. 45, 10
        add     eax, 2                                  ; 0E38 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0E3B _ 0F B6. 00
        shr     al, 2                                   ; 0E3E _ C0. E8, 02
        movsx   eax, al                                 ; 0E41 _ 0F BE. C0
        sub     esp, 8                                  ; 0E44 _ 83. EC, 08
        push    eax                                     ; 0E47 _ 50
        push    969                                     ; 0E48 _ 68, 000003C9
        call    outb_p                                  ; 0E4D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E52 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0E55 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 0E59 _ 83. 45, F4, 01
?_031:  mov     eax, dword [ebp-0CH]                    ; 0E5D _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0E60 _ 3B. 45, 0C
        jle     ?_030                                   ; 0E63 _ 7E, 93
        sub     esp, 12                                 ; 0E65 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0E68 _ FF. 75, F0
        call    store_eflags                            ; 0E6B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E70 _ 83. C4, 10
        nop                                             ; 0E73 _ 90
        leave                                           ; 0E74 _ C9
        ret                                             ; 0E75 _ C3
; set_palette End of function

init_palette:; Function begin
        push    ebp                                     ; 0E76 _ 55
        mov     ebp, esp                                ; 0E77 _ 89. E5
        sub     esp, 8                                  ; 0E79 _ 83. EC, 08
        sub     esp, 4                                  ; 0E7C _ 83. EC, 04
        push    table_rgb.1796                          ; 0E7F _ 68, 00000020(d)
        push    15                                      ; 0E84 _ 6A, 0F
        push    0                                       ; 0E86 _ 6A, 00
        call    set_palette                             ; 0E88 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E8D _ 83. C4, 10
        nop                                             ; 0E90 _ 90
        leave                                           ; 0E91 _ C9
        ret                                             ; 0E92 _ C3
; init_palette End of function

int2hex:; Function begin
        push    ebp                                     ; 0E93 _ 55
        mov     ebp, esp                                ; 0E94 _ 89. E5
        sub     esp, 16                                 ; 0E96 _ 83. EC, 10
        mov     dword [ebp-8H], ?_182                   ; 0E99 _ C7. 45, F8, 00000043(d)
        mov     dword [ebp-0CH], 15                     ; 0EA0 _ C7. 45, F4, 0000000F
        mov     dword [ebp-4H], 8                       ; 0EA7 _ C7. 45, FC, 00000008
?_032:  sub     dword [ebp-4H], 1                       ; 0EAE _ 83. 6D, FC, 01
        mov     edx, dword [ebp-4H]                     ; 0EB2 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 0EB5 _ 8B. 45, 0C
        add     edx, eax                                ; 0EB8 _ 01. C2
        mov     eax, dword [ebp+8H]                     ; 0EBA _ 8B. 45, 08
        and     eax, dword [ebp-0CH]                    ; 0EBD _ 23. 45, F4
        mov     ecx, eax                                ; 0EC0 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 0EC2 _ 8B. 45, F8
        add     eax, ecx                                ; 0EC5 _ 01. C8
        movzx   eax, byte [eax]                         ; 0EC7 _ 0F B6. 00
        mov     byte [edx], al                          ; 0ECA _ 88. 02
        shr     dword [ebp+8H], 4                       ; 0ECC _ C1. 6D, 08, 04
        cmp     dword [ebp-4H], 0                       ; 0ED0 _ 83. 7D, FC, 00
        jnz     ?_032                                   ; 0ED4 _ 75, D8
        nop                                             ; 0ED6 _ 90
        leave                                           ; 0ED7 _ C9
        ret                                             ; 0ED8 _ C3
; int2hex End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0ED9 _ 55
        mov     ebp, esp                                ; 0EDA _ 89. E5
        sub     esp, 8                                  ; 0EDC _ 83. EC, 08
?_033:  sub     esp, 12                                 ; 0EDF _ 83. EC, 0C
        push    100                                     ; 0EE2 _ 6A, 64
        call    inb_p                                   ; 0EE4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EE9 _ 83. C4, 10
        movzx   eax, al                                 ; 0EEC _ 0F B6. C0
        and     eax, 02H                                ; 0EEF _ 83. E0, 02
        test    eax, eax                                ; 0EF2 _ 85. C0
        jz      ?_034                                   ; 0EF4 _ 74, 02
        jmp     ?_033                                   ; 0EF6 _ EB, E7

?_034:  nop                                             ; 0EF8 _ 90
        nop                                             ; 0EF9 _ 90
        leave                                           ; 0EFA _ C9
        ret                                             ; 0EFB _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0EFC _ 55
        mov     ebp, esp                                ; 0EFD _ 89. E5
        sub     esp, 8                                  ; 0EFF _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0F02 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0F07 _ 83. EC, 08
        push    96                                      ; 0F0A _ 6A, 60
        push    100                                     ; 0F0C _ 6A, 64
        call    outb_p                                  ; 0F0E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F13 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0F16 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0F1B _ 83. EC, 08
        push    71                                      ; 0F1E _ 6A, 47
        push    96                                      ; 0F20 _ 6A, 60
        call    outb_p                                  ; 0F22 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F27 _ 83. C4, 10
        nop                                             ; 0F2A _ 90
        leave                                           ; 0F2B _ C9
        ret                                             ; 0F2C _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0F2D _ 55
        mov     ebp, esp                                ; 0F2E _ 89. E5
        sub     esp, 8                                  ; 0F30 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0F33 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0F38 _ 83. EC, 08
        push    -44                                     ; 0F3B _ 6A, D4
        push    100                                     ; 0F3D _ 6A, 64
        call    outb_p                                  ; 0F3F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F44 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0F47 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0F4C _ 83. EC, 08
        push    -12                                     ; 0F4F _ 6A, F4
        push    96                                      ; 0F51 _ 6A, 60
        call    outb_p                                  ; 0F53 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F58 _ 83. C4, 10
        nop                                             ; 0F5B _ 90
        leave                                           ; 0F5C _ C9
        ret                                             ; 0F5D _ C3
; enable_mouse End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0F5E _ 55
        mov     ebp, esp                                ; 0F5F _ 89. E5
        sub     esp, 24                                 ; 0F61 _ 83. EC, 18
        sub     esp, 8                                  ; 0F64 _ 83. EC, 08
        push    33                                      ; 0F67 _ 6A, 21
        push    32                                      ; 0F69 _ 6A, 20
        call    outb_p                                  ; 0F6B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F70 _ 83. C4, 10
        sub     esp, 12                                 ; 0F73 _ 83. EC, 0C
        push    96                                      ; 0F76 _ 6A, 60
        call    inb_p                                   ; 0F78 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F7D _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0F80 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0F83 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0F87 _ 83. EC, 08
        push    eax                                     ; 0F8A _ 50
        push    keyfifo                                 ; 0F8B _ 68, 00000000(d)
        call    fifo_put                                ; 0F90 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F95 _ 83. C4, 10
        nop                                             ; 0F98 _ 90
        leave                                           ; 0F99 _ C9
        ret                                             ; 0F9A _ C3
; intHandlerFromC End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0F9B _ 55
        mov     ebp, esp                                ; 0F9C _ 89. E5
        sub     esp, 24                                 ; 0F9E _ 83. EC, 18
        sub     esp, 8                                  ; 0FA1 _ 83. EC, 08
        push    100                                     ; 0FA4 _ 6A, 64
        push    160                                     ; 0FA6 _ 68, 000000A0
        call    outb_p                                  ; 0FAB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FB0 _ 83. C4, 10
        sub     esp, 8                                  ; 0FB3 _ 83. EC, 08
        push    98                                      ; 0FB6 _ 6A, 62
        push    32                                      ; 0FB8 _ 6A, 20
        call    outb_p                                  ; 0FBA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FBF _ 83. C4, 10
        sub     esp, 12                                 ; 0FC2 _ 83. EC, 0C
        push    96                                      ; 0FC5 _ 6A, 60
        call    inb_p                                   ; 0FC7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FCC _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0FCF _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0FD2 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0FD6 _ 83. EC, 08
        push    eax                                     ; 0FD9 _ 50
        push    mousefifo                               ; 0FDA _ 68, 00000018(d)
        call    fifo_put                                ; 0FDF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FE4 _ 83. C4, 10
        nop                                             ; 0FE7 _ 90
        leave                                           ; 0FE8 _ C9
        ret                                             ; 0FE9 _ C3
; intHandlerForMouse End of function

fifo_status:; Function begin
        push    ebp                                     ; 0FEA _ 55
        mov     ebp, esp                                ; 0FEB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0FED _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0FF0 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0FF3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0FF6 _ 8B. 40, 0C
        sub     edx, eax                                ; 0FF9 _ 29. C2
        mov     eax, edx                                ; 0FFB _ 89. D0
        pop     ebp                                     ; 0FFD _ 5D
        ret                                             ; 0FFE _ C3
; fifo_status End of function

fifo_init:; Function begin
        push    ebp                                     ; 0FFF _ 55
        mov     ebp, esp                                ; 1000 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1002 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1005 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 1008 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 100B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 100E _ 8B. 55, 10
        mov     dword [eax], edx                        ; 1011 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1013 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1016 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 1019 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 101C _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 101F _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 1026 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1029 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1030 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1033 _ C7. 40, 08, 00000000
        nop                                             ; 103A _ 90
        pop     ebp                                     ; 103B _ 5D
        ret                                             ; 103C _ C3
; fifo_init End of function

fifo_put:; Function begin
        push    ebp                                     ; 103D _ 55
        mov     ebp, esp                                ; 103E _ 89. E5
        sub     esp, 4                                  ; 1040 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1043 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1046 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1049 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 104C _ 8B. 40, 0C
        test    eax, eax                                ; 104F _ 85. C0
        jnz     ?_035                                   ; 1051 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 1053 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 1056 _ 8B. 40, 14
        or      eax, 01H                                ; 1059 _ 83. C8, 01
        mov     edx, eax                                ; 105C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 105E _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 1061 _ 89. 50, 14
        mov     eax, 4294967295                         ; 1064 _ B8, FFFFFFFF
        jmp     ?_036                                   ; 1069 _ EB, 4B

?_035:  mov     eax, dword [ebp+8H]                     ; 106B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 106E _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1070 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1073 _ 8B. 40, 04
        add     edx, eax                                ; 1076 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 1078 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 107C _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 107E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1081 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 1084 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1087 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 108A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 108D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1090 _ 8B. 40, 04
        mov     edx, dword [ebp+8H]                     ; 1093 _ 8B. 55, 08
        mov     ecx, dword [edx+10H]                    ; 1096 _ 8B. 4A, 10
        cdq                                             ; 1099 _ 99
        idiv    ecx                                     ; 109A _ F7. F9
        mov     eax, dword [ebp+8H]                     ; 109C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 109F _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 10A2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 10A5 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 10A8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 10AB _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 10AE _ 89. 50, 0C
        mov     eax, 0                                  ; 10B1 _ B8, 00000000
?_036:  leave                                           ; 10B6 _ C9
        ret                                             ; 10B7 _ C3
; fifo_put End of function

fifo_get:; Function begin
        push    ebp                                     ; 10B8 _ 55
        mov     ebp, esp                                ; 10B9 _ 89. E5
        sub     esp, 16                                 ; 10BB _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 10BE _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 10C1 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 10C4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 10C7 _ 8B. 40, 10
        cmp     edx, eax                                ; 10CA _ 39. C2
        jnz     ?_037                                   ; 10CC _ 75, 07
        mov     eax, 4294967295                         ; 10CE _ B8, FFFFFFFF
        jmp     ?_038                                   ; 10D3 _ EB, 4C

?_037:  mov     eax, dword [ebp+8H]                     ; 10D5 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 10D8 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 10DA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 10DD _ 8B. 40, 08
        add     eax, edx                                ; 10E0 _ 01. D0
        movzx   eax, byte [eax]                         ; 10E2 _ 0F B6. 00
        movzx   eax, al                                 ; 10E5 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 10E8 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 10EB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 10EE _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 10F1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 10F4 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 10F7 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 10FA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 10FD _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 1100 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1103 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1106 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1109 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 110C _ 8B. 40, 08
        mov     edx, dword [ebp+8H]                     ; 110F _ 8B. 55, 08
        mov     ecx, dword [edx+10H]                    ; 1112 _ 8B. 4A, 10
        cdq                                             ; 1115 _ 99
        idiv    ecx                                     ; 1116 _ F7. F9
        mov     eax, dword [ebp+8H]                     ; 1118 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 111B _ 89. 50, 08
        mov     eax, dword [ebp-4H]                     ; 111E _ 8B. 45, FC
?_038:  leave                                           ; 1121 _ C9
        ret                                             ; 1122 _ C3
; fifo_get End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1123 _ 55
        mov     ebp, esp                                ; 1124 _ 89. E5
        sub     esp, 24                                 ; 1126 _ 83. EC, 18
        sub     esp, 8                                  ; 1129 _ 83. EC, 08
        push    4580                                    ; 112C _ 68, 000011E4
        push    dword [ebp+8H]                          ; 1131 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1134 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1139 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 113C _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 113F _ 83. 7D, F0, 00
        je      ?_042                                   ; 1143 _ 0F 84, 000000B4
        mov     eax, dword [ebp+10H]                    ; 1149 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 114C _ 0F AF. 45, 14
        sub     esp, 8                                  ; 1150 _ 83. EC, 08
        push    eax                                     ; 1153 _ 50
        push    dword [ebp+8H]                          ; 1154 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1157 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 115C _ 83. C4, 10
        mov     edx, eax                                ; 115F _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1161 _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 1164 _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 1167 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 116A _ 8B. 40, 04
        test    eax, eax                                ; 116D _ 85. C0
        jnz     ?_039                                   ; 116F _ 75, 19
        mov     eax, dword [ebp-10H]                    ; 1171 _ 8B. 45, F0
        sub     esp, 4                                  ; 1174 _ 83. EC, 04
        push    4580                                    ; 1177 _ 68, 000011E4
        push    eax                                     ; 117C _ 50
        push    dword [ebp+8H]                          ; 117D _ FF. 75, 08
        call    memman_free_4k                          ; 1180 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1185 _ 83. C4, 10
        jmp     ?_043                                   ; 1188 _ EB, 74

?_039:  mov     eax, dword [ebp-10H]                    ; 118A _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 118D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1190 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 1192 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1195 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 1198 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 119B _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 119E _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 11A1 _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 11A4 _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 11A7 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 11AE _ C7. 45, F4, 00000000
        jmp     ?_041                                   ; 11B5 _ EB, 3E

?_040:  mov     ecx, dword [ebp-10H]                    ; 11B7 _ 8B. 4D, F0
        mov     edx, dword [ebp-0CH]                    ; 11BA _ 8B. 55, F4
        mov     eax, edx                                ; 11BD _ 89. D0
        shl     eax, 3                                  ; 11BF _ C1. E0, 03
        add     eax, edx                                ; 11C2 _ 01. D0
        shl     eax, 2                                  ; 11C4 _ C1. E0, 02
        add     eax, ecx                                ; 11C7 _ 01. C8
        add     eax, 508                                ; 11C9 _ 05, 000001FC
        mov     dword [eax], 0                          ; 11CE _ C7. 00, 00000000
        mov     ecx, dword [ebp-10H]                    ; 11D4 _ 8B. 4D, F0
        mov     edx, dword [ebp-0CH]                    ; 11D7 _ 8B. 55, F4
        mov     eax, edx                                ; 11DA _ 89. D0
        shl     eax, 3                                  ; 11DC _ C1. E0, 03
        add     eax, edx                                ; 11DF _ 01. D0
        shl     eax, 2                                  ; 11E1 _ C1. E0, 02
        add     eax, ecx                                ; 11E4 _ 01. C8
        lea     edx, [eax+1E0H]                         ; 11E6 _ 8D. 90, 000001E0
        mov     eax, dword [ebp-10H]                    ; 11EC _ 8B. 45, F0
        mov     dword [edx], eax                        ; 11EF _ 89. 02
        add     dword [ebp-0CH], 1                      ; 11F1 _ 83. 45, F4, 01
?_041:  cmp     dword [ebp-0CH], 113                    ; 11F5 _ 83. 7D, F4, 71
        jle     ?_040                                   ; 11F9 _ 7E, BC
        jmp     ?_043                                   ; 11FB _ EB, 01

?_042:  nop                                             ; 11FD _ 90
?_043:  mov     eax, dword [ebp-10H]                    ; 11FE _ 8B. 45, F0
        leave                                           ; 1201 _ C9
        ret                                             ; 1202 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1203 _ 55
        mov     ebp, esp                                ; 1204 _ 89. E5
        sub     esp, 16                                 ; 1206 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1209 _ C7. 45, FC, 00000000
        jmp     ?_046                                   ; 1210 _ EB, 68

?_044:  mov     ecx, dword [ebp+8H]                     ; 1212 _ 8B. 4D, 08
        mov     edx, dword [ebp-4H]                     ; 1215 _ 8B. 55, FC
        mov     eax, edx                                ; 1218 _ 89. D0
        shl     eax, 3                                  ; 121A _ C1. E0, 03
        add     eax, edx                                ; 121D _ 01. D0
        shl     eax, 2                                  ; 121F _ C1. E0, 02
        add     eax, ecx                                ; 1222 _ 01. C8
        add     eax, 508                                ; 1224 _ 05, 000001FC
        mov     eax, dword [eax]                        ; 1229 _ 8B. 00
        test    eax, eax                                ; 122B _ 85. C0
        jnz     ?_045                                   ; 122D _ 75, 47
        mov     edx, dword [ebp-4H]                     ; 122F _ 8B. 55, FC
        mov     eax, edx                                ; 1232 _ 89. D0
        shl     eax, 3                                  ; 1234 _ C1. E0, 03
        add     eax, edx                                ; 1237 _ 01. D0
        shl     eax, 2                                  ; 1239 _ C1. E0, 02
        lea     edx, [eax+1D0H]                         ; 123C _ 8D. 90, 000001D0
        mov     eax, dword [ebp+8H]                     ; 1242 _ 8B. 45, 08
        add     eax, edx                                ; 1245 _ 01. D0
        add     eax, 12                                 ; 1247 _ 83. C0, 0C
        mov     dword [ebp-8H], eax                     ; 124A _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 124D _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1250 _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 1253 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 1256 _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 1259 _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 125D _ 8B. 45, F8
        mov     dword [eax+20H], 1                      ; 1260 _ C7. 40, 20, 00000001
        mov     eax, dword [ebp-8H]                     ; 1267 _ 8B. 45, F8
        mov     dword [eax+1CH], -1                     ; 126A _ C7. 40, 1C, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 1271 _ 8B. 45, F8
        jmp     ?_047                                   ; 1274 _ EB, 0F

?_045:  add     dword [ebp-4H], 1                       ; 1276 _ 83. 45, FC, 01
?_046:  cmp     dword [ebp-4H], 113                     ; 127A _ 83. 7D, FC, 71
        jle     ?_044                                   ; 127E _ 7E, 92
        mov     eax, 0                                  ; 1280 _ B8, 00000000
?_047:  leave                                           ; 1285 _ C9
        ret                                             ; 1286 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1287 _ 55
        mov     ebp, esp                                ; 1288 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 128A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 128D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1290 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1292 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1295 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 1298 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 129B _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 129E _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 12A1 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 12A4 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 12A7 _ 8B. 55, 18
        mov     dword [eax+18H], edx                    ; 12AA _ 89. 50, 18
        nop                                             ; 12AD _ 90
        pop     ebp                                     ; 12AE _ 5D
        ret                                             ; 12AF _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 12B0 _ 55
        mov     ebp, esp                                ; 12B1 _ 89. E5
        push    esi                                     ; 12B3 _ 56
        push    ebx                                     ; 12B4 _ 53
        sub     esp, 16                                 ; 12B5 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 12B8 _ 8B. 45, 0C
        mov     eax, dword [eax+1CH]                    ; 12BB _ 8B. 40, 1C
        mov     dword [ebp-10H], eax                    ; 12BE _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 12C1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 12C4 _ 8B. 40, 10
        add     eax, 1                                  ; 12C7 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 12CA _ 3B. 45, 10
        jge     ?_048                                   ; 12CD _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 12CF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 12D2 _ 8B. 40, 10
        add     eax, 1                                  ; 12D5 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 12D8 _ 89. 45, 10
?_048:  cmp     dword [ebp+10H], -1                     ; 12DB _ 83. 7D, 10, FF
        jge     ?_049                                   ; 12DF _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 12E1 _ C7. 45, 10, FFFFFFFF
?_049:  mov     eax, dword [ebp+0CH]                    ; 12E8 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 12EB _ 8B. 55, 10
        mov     dword [eax+1CH], edx                    ; 12EE _ 89. 50, 1C
        mov     eax, dword [ebp-10H]                    ; 12F1 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 12F4 _ 3B. 45, 10
        jle     ?_056                                   ; 12F7 _ 0F 8E, 000001D5
        cmp     dword [ebp+10H], 0                      ; 12FD _ 83. 7D, 10, 00
        js      ?_052                                   ; 1301 _ 0F 88, 000000E2
        mov     eax, dword [ebp-10H]                    ; 1307 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 130A _ 89. 45, F4
        jmp     ?_051                                   ; 130D _ EB, 34

?_050:  mov     eax, dword [ebp-0CH]                    ; 130F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1312 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1315 _ 8B. 45, 08
        add     edx, 4                                  ; 1318 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 131B _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 131F _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1322 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1325 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1328 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 132C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 132F _ 8B. 55, F4
        add     edx, 4                                  ; 1332 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1335 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1339 _ 8B. 55, F4
        mov     dword [eax+1CH], edx                    ; 133C _ 89. 50, 1C
        sub     dword [ebp-0CH], 1                      ; 133F _ 83. 6D, F4, 01
?_051:  mov     eax, dword [ebp-0CH]                    ; 1343 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1346 _ 3B. 45, 10
        jg      ?_050                                   ; 1349 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 134B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 134E _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1351 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1354 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1357 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 135B _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 135E _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1361 _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 1364 _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 1367 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 136A _ 8B. 40, 0C
        lea     ebx, [edx+eax]                          ; 136D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1370 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1373 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1376 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1379 _ 8B. 40, 08
        lea     ecx, [edx+eax]                          ; 137C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 137F _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 1382 _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 1385 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1388 _ 8B. 40, 10
        sub     esp, 8                                  ; 138B _ 83. EC, 08
        push    esi                                     ; 138E _ 56
        push    ebx                                     ; 138F _ 53
        push    ecx                                     ; 1390 _ 51
        push    edx                                     ; 1391 _ 52
        push    eax                                     ; 1392 _ 50
        push    dword [ebp+8H]                          ; 1393 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1396 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 139B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 139E _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 13A1 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 13A4 _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 13A7 _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 13AA _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 13AD _ 8B. 40, 0C
        lea     ebx, [edx+eax]                          ; 13B0 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 13B3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 13B6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 13B9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 13BC _ 8B. 40, 08
        lea     ecx, [edx+eax]                          ; 13BF _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 13C2 _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 13C5 _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 13C8 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 13CB _ 8B. 40, 10
        sub     esp, 4                                  ; 13CE _ 83. EC, 04
        push    dword [ebp-10H]                         ; 13D1 _ FF. 75, F0
        push    esi                                     ; 13D4 _ 56
        push    ebx                                     ; 13D5 _ 53
        push    ecx                                     ; 13D6 _ 51
        push    edx                                     ; 13D7 _ 52
        push    eax                                     ; 13D8 _ 50
        push    dword [ebp+8H]                          ; 13D9 _ FF. 75, 08
        call    sheet_refreshsub                        ; 13DC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 13E1 _ 83. C4, 20
        jmp     ?_063                                   ; 13E4 _ E9, 0000023E

?_052:  mov     eax, dword [ebp+8H]                     ; 13E9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 13EC _ 8B. 40, 10
        cmp     eax, dword [ebp-10H]                    ; 13EF _ 3B. 45, F0
        jle     ?_055                                   ; 13F2 _ 7E, 47
        mov     eax, dword [ebp-10H]                    ; 13F4 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 13F7 _ 89. 45, F4
        jmp     ?_054                                   ; 13FA _ EB, 34

?_053:  mov     eax, dword [ebp-0CH]                    ; 13FC _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 13FF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1402 _ 8B. 45, 08
        add     edx, 4                                  ; 1405 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1408 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 140C _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 140F _ 8B. 4D, F4
        add     ecx, 4                                  ; 1412 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1415 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1419 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 141C _ 8B. 55, F4
        add     edx, 4                                  ; 141F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1422 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1426 _ 8B. 55, F4
        mov     dword [eax+1CH], edx                    ; 1429 _ 89. 50, 1C
        add     dword [ebp-0CH], 1                      ; 142C _ 83. 45, F4, 01
?_054:  mov     eax, dword [ebp+8H]                     ; 1430 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1433 _ 8B. 40, 10
        cmp     eax, dword [ebp-0CH]                    ; 1436 _ 3B. 45, F4
        jg      ?_053                                   ; 1439 _ 7F, C1
?_055:  mov     eax, dword [ebp+8H]                     ; 143B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 143E _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1441 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1444 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1447 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 144A _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 144D _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 1450 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1453 _ 8B. 40, 0C
        lea     ebx, [edx+eax]                          ; 1456 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1459 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 145C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 145F _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1462 _ 8B. 40, 08
        lea     ecx, [edx+eax]                          ; 1465 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1468 _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 146B _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 146E _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1471 _ 8B. 40, 10
        sub     esp, 8                                  ; 1474 _ 83. EC, 08
        push    0                                       ; 1477 _ 6A, 00
        push    ebx                                     ; 1479 _ 53
        push    ecx                                     ; 147A _ 51
        push    edx                                     ; 147B _ 52
        push    eax                                     ; 147C _ 50
        push    dword [ebp+8H]                          ; 147D _ FF. 75, 08
        call    sheet_refreshmap                        ; 1480 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1485 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 1488 _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 148B _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 148E _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 1491 _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 1494 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1497 _ 8B. 40, 0C
        lea     ebx, [edx+eax]                          ; 149A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 149D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 14A0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 14A3 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 14A6 _ 8B. 40, 08
        lea     ecx, [edx+eax]                          ; 14A9 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 14AC _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 14AF _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 14B2 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 14B5 _ 8B. 40, 10
        sub     esp, 4                                  ; 14B8 _ 83. EC, 04
        push    esi                                     ; 14BB _ 56
        push    0                                       ; 14BC _ 6A, 00
        push    ebx                                     ; 14BE _ 53
        push    ecx                                     ; 14BF _ 51
        push    edx                                     ; 14C0 _ 52
        push    eax                                     ; 14C1 _ 50
        push    dword [ebp+8H]                          ; 14C2 _ FF. 75, 08
        call    sheet_refreshsub                        ; 14C5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 14CA _ 83. C4, 20
        jmp     ?_063                                   ; 14CD _ E9, 00000155

?_056:  mov     eax, dword [ebp-10H]                    ; 14D2 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 14D5 _ 3B. 45, 10
        jge     ?_063                                   ; 14D8 _ 0F 8D, 00000149
        cmp     dword [ebp-10H], 0                      ; 14DE _ 83. 7D, F0, 00
        js      ?_059                                   ; 14E2 _ 78, 56
        mov     eax, dword [ebp-10H]                    ; 14E4 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 14E7 _ 89. 45, F4
        jmp     ?_058                                   ; 14EA _ EB, 34

?_057:  mov     eax, dword [ebp-0CH]                    ; 14EC _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 14EF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 14F2 _ 8B. 45, 08
        add     edx, 4                                  ; 14F5 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 14F8 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 14FC _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 14FF _ 8B. 4D, F4
        add     ecx, 4                                  ; 1502 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1505 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1509 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 150C _ 8B. 55, F4
        add     edx, 4                                  ; 150F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1512 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1516 _ 8B. 55, F4
        mov     dword [eax+1CH], edx                    ; 1519 _ 89. 50, 1C
        add     dword [ebp-0CH], 1                      ; 151C _ 83. 45, F4, 01
?_058:  mov     eax, dword [ebp-0CH]                    ; 1520 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1523 _ 3B. 45, 10
        jl      ?_057                                   ; 1526 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 1528 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 152B _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 152E _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1531 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1534 _ 89. 54 88, 04
        jmp     ?_062                                   ; 1538 _ EB, 6C

?_059:  mov     eax, dword [ebp+8H]                     ; 153A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 153D _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1540 _ 89. 45, F4
        jmp     ?_061                                   ; 1543 _ EB, 3A

?_060:  mov     eax, dword [ebp-0CH]                    ; 1545 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 1548 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 154B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 154E _ 8B. 55, F4
        add     edx, 4                                  ; 1551 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1554 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1558 _ 8B. 45, 08
        add     ecx, 4                                  ; 155B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 155E _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 1562 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1565 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1568 _ 8B. 45, 08
        add     edx, 4                                  ; 156B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 156E _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1572 _ 8B. 55, F4
        add     edx, 1                                  ; 1575 _ 83. C2, 01
        mov     dword [eax+1CH], edx                    ; 1578 _ 89. 50, 1C
        sub     dword [ebp-0CH], 1                      ; 157B _ 83. 6D, F4, 01
?_061:  mov     eax, dword [ebp-0CH]                    ; 157F _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1582 _ 3B. 45, 10
        jge     ?_060                                   ; 1585 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 1587 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 158A _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 158D _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1590 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1593 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1597 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 159A _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 159D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 15A0 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 15A3 _ 89. 50, 10
?_062:  mov     eax, dword [ebp+0CH]                    ; 15A6 _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 15A9 _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 15AC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 15AF _ 8B. 40, 0C
        lea     ebx, [edx+eax]                          ; 15B2 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 15B5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 15B8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 15BB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 15BE _ 8B. 40, 08
        lea     ecx, [edx+eax]                          ; 15C1 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 15C4 _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 15C7 _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 15CA _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 15CD _ 8B. 40, 10
        sub     esp, 8                                  ; 15D0 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 15D3 _ FF. 75, 10
        push    ebx                                     ; 15D6 _ 53
        push    ecx                                     ; 15D7 _ 51
        push    edx                                     ; 15D8 _ 52
        push    eax                                     ; 15D9 _ 50
        push    dword [ebp+8H]                          ; 15DA _ FF. 75, 08
        call    sheet_refreshmap                        ; 15DD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 15E2 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 15E5 _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 15E8 _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 15EB _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 15EE _ 8B. 40, 0C
        lea     ebx, [edx+eax]                          ; 15F1 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 15F4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 15F7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 15FA _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 15FD _ 8B. 40, 08
        lea     ecx, [edx+eax]                          ; 1600 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1603 _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 1606 _ 8B. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 1609 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 160C _ 8B. 40, 10
        sub     esp, 4                                  ; 160F _ 83. EC, 04
        push    dword [ebp+10H]                         ; 1612 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 1615 _ FF. 75, 10
        push    ebx                                     ; 1618 _ 53
        push    ecx                                     ; 1619 _ 51
        push    edx                                     ; 161A _ 52
        push    eax                                     ; 161B _ 50
        push    dword [ebp+8H]                          ; 161C _ FF. 75, 08
        call    sheet_refreshsub                        ; 161F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1624 _ 83. C4, 20
?_063:  nop                                             ; 1627 _ 90
        lea     esp, [ebp-8H]                           ; 1628 _ 8D. 65, F8
        pop     ebx                                     ; 162B _ 5B
        pop     esi                                     ; 162C _ 5E
        pop     ebp                                     ; 162D _ 5D
        ret                                             ; 162E _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 162F _ 55
        mov     ebp, esp                                ; 1630 _ 89. E5
        push    edi                                     ; 1632 _ 57
        push    esi                                     ; 1633 _ 56
        push    ebx                                     ; 1634 _ 53
        sub     esp, 28                                 ; 1635 _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 1638 _ 8B. 45, 0C
        mov     eax, dword [eax+1CH]                    ; 163B _ 8B. 40, 1C
        test    eax, eax                                ; 163E _ 85. C0
        js      ?_064                                   ; 1640 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 1642 _ 8B. 45, 0C
        mov     ebx, dword [eax+1CH]                    ; 1645 _ 8B. 58, 1C
        mov     eax, dword [ebp+0CH]                    ; 1648 _ 8B. 45, 0C
        mov     ecx, dword [eax+1CH]                    ; 164B _ 8B. 48, 1C
        mov     eax, dword [ebp+0CH]                    ; 164E _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 1651 _ 8B. 50, 14
        mov     eax, dword [ebp+1CH]                    ; 1654 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 1657 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 165A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 165D _ 8B. 50, 10
        mov     eax, dword [ebp+18H]                    ; 1660 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 1663 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 1666 _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 1669 _ 8B. 50, 14
        mov     eax, dword [ebp+14H]                    ; 166C _ 8B. 45, 14
        add     edx, eax                                ; 166F _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1671 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1674 _ 8B. 40, 10
        mov     dword [ebp-1CH], eax                    ; 1677 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 167A _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 167D _ 03. 45, E4
        sub     esp, 4                                  ; 1680 _ 83. EC, 04
        push    ebx                                     ; 1683 _ 53
        push    ecx                                     ; 1684 _ 51
        push    edi                                     ; 1685 _ 57
        push    esi                                     ; 1686 _ 56
        push    edx                                     ; 1687 _ 52
        push    eax                                     ; 1688 _ 50
        push    dword [ebp+8H]                          ; 1689 _ FF. 75, 08
        call    sheet_refreshsub                        ; 168C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1691 _ 83. C4, 20
?_064:  nop                                             ; 1694 _ 90
        lea     esp, [ebp-0CH]                          ; 1695 _ 8D. 65, F4
        pop     ebx                                     ; 1698 _ 5B
        pop     esi                                     ; 1699 _ 5E
        pop     edi                                     ; 169A _ 5F
        pop     ebp                                     ; 169B _ 5D
        ret                                             ; 169C _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 169D _ 55
        mov     ebp, esp                                ; 169E _ 89. E5
        push    esi                                     ; 16A0 _ 56
        push    ebx                                     ; 16A1 _ 53
        sub     esp, 16                                 ; 16A2 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 16A5 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 16A8 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 16AB _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 16AE _ 8B. 45, 0C
        mov     eax, dword [eax+14H]                    ; 16B1 _ 8B. 40, 14
        mov     dword [ebp-10H], eax                    ; 16B4 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 16B7 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 16BA _ 8B. 55, 10
        mov     dword [eax+10H], edx                    ; 16BD _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 16C0 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 16C3 _ 8B. 55, 14
        mov     dword [eax+14H], edx                    ; 16C6 _ 89. 50, 14
        mov     eax, dword [ebp+0CH]                    ; 16C9 _ 8B. 45, 0C
        mov     eax, dword [eax+1CH]                    ; 16CC _ 8B. 40, 1C
        test    eax, eax                                ; 16CF _ 85. C0
        js      ?_065                                   ; 16D1 _ 0F 88, 000000D3
        mov     eax, dword [ebp+0CH]                    ; 16D7 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 16DA _ 8B. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 16DD _ 8B. 45, F0
        add     edx, eax                                ; 16E0 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 16E2 _ 8B. 45, 0C
        mov     ecx, dword [eax+8H]                     ; 16E5 _ 8B. 48, 08
        mov     eax, dword [ebp-0CH]                    ; 16E8 _ 8B. 45, F4
        add     eax, ecx                                ; 16EB _ 01. C8
        sub     esp, 8                                  ; 16ED _ 83. EC, 08
        push    0                                       ; 16F0 _ 6A, 00
        push    edx                                     ; 16F2 _ 52
        push    eax                                     ; 16F3 _ 50
        push    dword [ebp-10H]                         ; 16F4 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 16F7 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 16FA _ FF. 75, 08
        call    sheet_refreshmap                        ; 16FD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1702 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1705 _ 8B. 45, 0C
        mov     eax, dword [eax+1CH]                    ; 1708 _ 8B. 40, 1C
        mov     edx, dword [ebp+0CH]                    ; 170B _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 170E _ 8B. 4A, 0C
        mov     edx, dword [ebp-10H]                    ; 1711 _ 8B. 55, F0
        add     ecx, edx                                ; 1714 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 1716 _ 8B. 55, 0C
        mov     ebx, dword [edx+8H]                     ; 1719 _ 8B. 5A, 08
        mov     edx, dword [ebp-0CH]                    ; 171C _ 8B. 55, F4
        add     edx, ebx                                ; 171F _ 01. DA
        sub     esp, 8                                  ; 1721 _ 83. EC, 08
        push    eax                                     ; 1724 _ 50
        push    ecx                                     ; 1725 _ 51
        push    edx                                     ; 1726 _ 52
        push    dword [ebp-10H]                         ; 1727 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 172A _ FF. 75, F4
        push    dword [ebp+8H]                          ; 172D _ FF. 75, 08
        call    sheet_refreshmap                        ; 1730 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1735 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1738 _ 8B. 45, 0C
        mov     eax, dword [eax+1CH]                    ; 173B _ 8B. 40, 1C
        lea     ecx, [eax-1H]                           ; 173E _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 1741 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1744 _ 8B. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 1747 _ 8B. 45, F0
        add     edx, eax                                ; 174A _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 174C _ 8B. 45, 0C
        mov     ebx, dword [eax+8H]                     ; 174F _ 8B. 58, 08
        mov     eax, dword [ebp-0CH]                    ; 1752 _ 8B. 45, F4
        add     eax, ebx                                ; 1755 _ 01. D8
        sub     esp, 4                                  ; 1757 _ 83. EC, 04
        push    ecx                                     ; 175A _ 51
        push    0                                       ; 175B _ 6A, 00
        push    edx                                     ; 175D _ 52
        push    eax                                     ; 175E _ 50
        push    dword [ebp-10H]                         ; 175F _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1762 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1765 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1768 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 176D _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1770 _ 8B. 45, 0C
        mov     edx, dword [eax+1CH]                    ; 1773 _ 8B. 50, 1C
        mov     eax, dword [ebp+0CH]                    ; 1776 _ 8B. 45, 0C
        mov     eax, dword [eax+1CH]                    ; 1779 _ 8B. 40, 1C
        mov     ecx, dword [ebp+0CH]                    ; 177C _ 8B. 4D, 0C
        mov     ebx, dword [ecx+0CH]                    ; 177F _ 8B. 59, 0C
        mov     ecx, dword [ebp+14H]                    ; 1782 _ 8B. 4D, 14
        add     ebx, ecx                                ; 1785 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 1787 _ 8B. 4D, 0C
        mov     esi, dword [ecx+8H]                     ; 178A _ 8B. 71, 08
        mov     ecx, dword [ebp+10H]                    ; 178D _ 8B. 4D, 10
        add     ecx, esi                                ; 1790 _ 01. F1
        sub     esp, 4                                  ; 1792 _ 83. EC, 04
        push    edx                                     ; 1795 _ 52
        push    eax                                     ; 1796 _ 50
        push    ebx                                     ; 1797 _ 53
        push    ecx                                     ; 1798 _ 51
        push    dword [ebp+14H]                         ; 1799 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 179C _ FF. 75, 10
        push    dword [ebp+8H]                          ; 179F _ FF. 75, 08
        call    sheet_refreshsub                        ; 17A2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17A7 _ 83. C4, 20
?_065:  nop                                             ; 17AA _ 90
        lea     esp, [ebp-8H]                           ; 17AB _ 8D. 65, F8
        pop     ebx                                     ; 17AE _ 5B
        pop     esi                                     ; 17AF _ 5E
        pop     ebp                                     ; 17B0 _ 5D
        ret                                             ; 17B1 _ C3
; sheet_slide End of function

sheet_draw:; Function begin
        push    ebp                                     ; 17B2 _ 55
        mov     ebp, esp                                ; 17B3 _ 89. E5
        sub     esp, 48                                 ; 17B5 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 17B8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 17BB _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 17BD _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 17C0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17C3 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 17C5 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 17C8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 17CB _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 17CE _ 89. 45, EC
        mov     eax, dword [ebp+0CH]                    ; 17D1 _ 8B. 45, 0C
        mov     edx, dword [ebp+8H]                     ; 17D4 _ 8B. 55, 08
        add     edx, 476                                ; 17D7 _ 81. C2, 000001DC
        sub     eax, edx                                ; 17DD _ 29. D0
        sar     eax, 2                                  ; 17DF _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 17E2 _ 69. C0, 38E38E39
        mov     byte [ebp-15H], al                      ; 17E8 _ 88. 45, EB
        mov     dword [ebp-8H], 0                       ; 17EB _ C7. 45, F8, 00000000
        jmp     ?_070                                   ; 17F2 _ E9, 000000CD

?_066:  mov     eax, dword [ebp+0CH]                    ; 17F7 _ 8B. 45, 0C
        mov     edx, dword [eax+14H]                    ; 17FA _ 8B. 50, 14
        mov     eax, dword [ebp-8H]                     ; 17FD _ 8B. 45, F8
        add     eax, edx                                ; 1800 _ 01. D0
        mov     dword [ebp-1CH], eax                    ; 1802 _ 89. 45, E4
        mov     dword [ebp-4H], 0                       ; 1805 _ C7. 45, FC, 00000000
        jmp     ?_069                                   ; 180C _ E9, 000000A0

?_067:  mov     eax, dword [ebp+0CH]                    ; 1811 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1814 _ 8B. 50, 10
        mov     eax, dword [ebp-4H]                     ; 1817 _ 8B. 45, FC
        add     eax, edx                                ; 181A _ 01. D0
        mov     dword [ebp-20H], eax                    ; 181C _ 89. 45, E0
        mov     eax, dword [ebp+10H]                    ; 181F _ 8B. 45, 10
        cmp     eax, dword [ebp-20H]                    ; 1822 _ 3B. 45, E0
        jg      ?_068                                   ; 1825 _ 0F 8F, 00000082
        mov     eax, dword [ebp-20H]                    ; 182B _ 8B. 45, E0
        cmp     eax, dword [ebp+18H]                    ; 182E _ 3B. 45, 18
        jge     ?_068                                   ; 1831 _ 7D, 7A
        mov     eax, dword [ebp+14H]                    ; 1833 _ 8B. 45, 14
        cmp     eax, dword [ebp-1CH]                    ; 1836 _ 3B. 45, E4
        jg      ?_068                                   ; 1839 _ 7F, 72
        mov     eax, dword [ebp-1CH]                    ; 183B _ 8B. 45, E4
        cmp     eax, dword [ebp+1CH]                    ; 183E _ 3B. 45, 1C
        jge     ?_068                                   ; 1841 _ 7D, 6A
        mov     eax, dword [ebp+0CH]                    ; 1843 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1846 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 1849 _ 0F AF. 45, F8
        mov     edx, eax                                ; 184D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 184F _ 8B. 45, FC
        add     eax, edx                                ; 1852 _ 01. D0
        mov     edx, eax                                ; 1854 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1856 _ 8B. 45, F4
        add     eax, edx                                ; 1859 _ 01. D0
        movzx   eax, byte [eax]                         ; 185B _ 0F B6. 00
        mov     byte [ebp-21H], al                      ; 185E _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1861 _ 0F B6. 55, DF
        mov     eax, dword [ebp+0CH]                    ; 1865 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1868 _ 8B. 40, 18
        cmp     edx, eax                                ; 186B _ 39. C2
        jz      ?_068                                   ; 186D _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 186F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1872 _ 8B. 40, 08
        imul    eax, dword [ebp-1CH]                    ; 1875 _ 0F AF. 45, E4
        mov     edx, eax                                ; 1879 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 187B _ 8B. 45, E0
        add     eax, edx                                ; 187E _ 01. D0
        mov     edx, eax                                ; 1880 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1882 _ 8B. 45, EC
        add     eax, edx                                ; 1885 _ 01. D0
        movzx   eax, byte [eax]                         ; 1887 _ 0F B6. 00
        cmp     al, byte [ebp-15H]                      ; 188A _ 3A. 45, EB
        jnz     ?_068                                   ; 188D _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 188F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1892 _ 8B. 40, 08
        imul    eax, dword [ebp-1CH]                    ; 1895 _ 0F AF. 45, E4
        mov     edx, eax                                ; 1899 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 189B _ 8B. 45, E0
        add     eax, edx                                ; 189E _ 01. D0
        mov     edx, eax                                ; 18A0 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 18A2 _ 8B. 45, F0
        add     edx, eax                                ; 18A5 _ 01. C2
        movzx   eax, byte [ebp-21H]                     ; 18A7 _ 0F B6. 45, DF
        mov     byte [edx], al                          ; 18AB _ 88. 02
?_068:  add     dword [ebp-4H], 1                       ; 18AD _ 83. 45, FC, 01
?_069:  mov     eax, dword [ebp+0CH]                    ; 18B1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 18B4 _ 8B. 40, 08
        cmp     eax, dword [ebp-4H]                     ; 18B7 _ 3B. 45, FC
        jg      ?_067                                   ; 18BA _ 0F 8F, FFFFFF51
        add     dword [ebp-8H], 1                       ; 18C0 _ 83. 45, F8, 01
?_070:  mov     eax, dword [ebp+0CH]                    ; 18C4 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 18C7 _ 8B. 40, 0C
        cmp     eax, dword [ebp-8H]                     ; 18CA _ 3B. 45, F8
        jg      ?_066                                   ; 18CD _ 0F 8F, FFFFFF24
        nop                                             ; 18D3 _ 90
        leave                                           ; 18D4 _ C9
        ret                                             ; 18D5 _ C3
; sheet_draw End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 18D6 _ 55
        mov     ebp, esp                                ; 18D7 _ 89. E5
        sub     esp, 16                                 ; 18D9 _ 83. EC, 10
        mov     eax, dword [ebp+1CH]                    ; 18DC _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 18DF _ 89. 45, FC
        jmp     ?_072                                   ; 18E2 _ EB, 29

?_071:  mov     eax, dword [ebp+8H]                     ; 18E4 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 18E7 _ 8B. 55, FC
        add     edx, 4                                  ; 18EA _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 18ED _ 8B. 44 90, 04
        push    dword [ebp+18H]                         ; 18F1 _ FF. 75, 18
        push    dword [ebp+14H]                         ; 18F4 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 18F7 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 18FA _ FF. 75, 0C
        push    eax                                     ; 18FD _ 50
        push    dword [ebp+8H]                          ; 18FE _ FF. 75, 08
        call    sheet_draw                              ; 1901 _ E8, FFFFFFFC(rel)
        add     esp, 24                                 ; 1906 _ 83. C4, 18
        add     dword [ebp-4H], 1                       ; 1909 _ 83. 45, FC, 01
?_072:  mov     eax, dword [ebp-4H]                     ; 190D _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 1910 _ 3B. 45, 20
        jle     ?_071                                   ; 1913 _ 7E, CF
        nop                                             ; 1915 _ 90
        leave                                           ; 1916 _ C9
        ret                                             ; 1917 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 1918 _ 55
        mov     ebp, esp                                ; 1919 _ 89. E5
        sub     esp, 64                                 ; 191B _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 191E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1921 _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 1924 _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 1927 _ 83. 7D, 0C, 00
        jns     ?_073                                   ; 192B _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 192D _ C7. 45, 0C, 00000000
?_073:  cmp     dword [ebp+10H], 0                      ; 1934 _ 83. 7D, 10, 00
        jns     ?_074                                   ; 1938 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 193A _ C7. 45, 10, 00000000
?_074:  mov     eax, dword [ebp+8H]                     ; 1941 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1944 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 1947 _ 3B. 45, 14
        jge     ?_075                                   ; 194A _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 194C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 194F _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 1952 _ 89. 45, 14
?_075:  mov     eax, dword [ebp+8H]                     ; 1955 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1958 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 195B _ 3B. 45, 18
        jge     ?_076                                   ; 195E _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 1960 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1963 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 1966 _ 89. 45, 18
?_076:  mov     eax, dword [ebp+1CH]                    ; 1969 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 196C _ 89. 45, FC
        jmp     ?_087                                   ; 196F _ E9, 00000146

?_077:  mov     eax, dword [ebp+8H]                     ; 1974 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1977 _ 8B. 55, FC
        add     edx, 4                                  ; 197A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 197D _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 1981 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 1984 _ 8B. 45, DC
        mov     edx, dword [ebp+8H]                     ; 1987 _ 8B. 55, 08
        add     edx, 476                                ; 198A _ 81. C2, 000001DC
        sub     eax, edx                                ; 1990 _ 29. D0
        sar     eax, 2                                  ; 1992 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 1995 _ 69. C0, 38E38E39
        mov     byte [ebp-25H], al                      ; 199B _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 199E _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 19A1 _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 19A3 _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 19A6 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 19A9 _ 8B. 40, 10
        mov     edx, dword [ebp+0CH]                    ; 19AC _ 8B. 55, 0C
        sub     edx, eax                                ; 19AF _ 29. C2
        mov     eax, edx                                ; 19B1 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 19B3 _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 19B6 _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 19B9 _ 8B. 40, 14
        mov     edx, dword [ebp+10H]                    ; 19BC _ 8B. 55, 10
        sub     edx, eax                                ; 19BF _ 29. C2
        mov     eax, edx                                ; 19C1 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 19C3 _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 19C6 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 19C9 _ 8B. 40, 10
        mov     edx, dword [ebp+14H]                    ; 19CC _ 8B. 55, 14
        sub     edx, eax                                ; 19CF _ 29. C2
        mov     eax, edx                                ; 19D1 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 19D3 _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 19D6 _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 19D9 _ 8B. 40, 14
        mov     edx, dword [ebp+18H]                    ; 19DC _ 8B. 55, 18
        sub     edx, eax                                ; 19DF _ 29. C2
        mov     eax, edx                                ; 19E1 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 19E3 _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 19E6 _ 83. 7D, F0, 00
        jns     ?_078                                   ; 19EA _ 79, 07
        mov     dword [ebp-10H], 0                      ; 19EC _ C7. 45, F0, 00000000
?_078:  cmp     dword [ebp-14H], 0                      ; 19F3 _ 83. 7D, EC, 00
        jns     ?_079                                   ; 19F7 _ 79, 07
        mov     dword [ebp-14H], 0                      ; 19F9 _ C7. 45, EC, 00000000
?_079:  mov     eax, dword [ebp-24H]                    ; 1A00 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 1A03 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 1A06 _ 3B. 45, E8
        jge     ?_080                                   ; 1A09 _ 7D, 09
        mov     eax, dword [ebp-24H]                    ; 1A0B _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 1A0E _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 1A11 _ 89. 45, E8
?_080:  mov     eax, dword [ebp-24H]                    ; 1A14 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 1A17 _ 8B. 40, 0C
        cmp     eax, dword [ebp-1CH]                    ; 1A1A _ 3B. 45, E4
        jge     ?_081                                   ; 1A1D _ 7D, 09
        mov     eax, dword [ebp-24H]                    ; 1A1F _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 1A22 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 1A25 _ 89. 45, E4
?_081:  mov     eax, dword [ebp-14H]                    ; 1A28 _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 1A2B _ 89. 45, F4
        jmp     ?_086                                   ; 1A2E _ EB, 7A

?_082:  mov     eax, dword [ebp-24H]                    ; 1A30 _ 8B. 45, DC
        mov     edx, dword [eax+14H]                    ; 1A33 _ 8B. 50, 14
        mov     eax, dword [ebp-0CH]                    ; 1A36 _ 8B. 45, F4
        add     eax, edx                                ; 1A39 _ 01. D0
        mov     dword [ebp-30H], eax                    ; 1A3B _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 1A3E _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 1A41 _ 89. 45, F8
        jmp     ?_085                                   ; 1A44 _ EB, 58

?_083:  mov     eax, dword [ebp-24H]                    ; 1A46 _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 1A49 _ 8B. 50, 10
        mov     eax, dword [ebp-8H]                     ; 1A4C _ 8B. 45, F8
        add     eax, edx                                ; 1A4F _ 01. D0
        mov     dword [ebp-34H], eax                    ; 1A51 _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 1A54 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 1A57 _ 8B. 40, 08
        imul    eax, dword [ebp-0CH]                    ; 1A5A _ 0F AF. 45, F4
        mov     edx, eax                                ; 1A5E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1A60 _ 8B. 45, F8
        add     eax, edx                                ; 1A63 _ 01. D0
        mov     edx, eax                                ; 1A65 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 1A67 _ 8B. 45, D4
        add     eax, edx                                ; 1A6A _ 01. D0
        movzx   eax, byte [eax]                         ; 1A6C _ 0F B6. 00
        movzx   edx, al                                 ; 1A6F _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 1A72 _ 8B. 45, DC
        mov     eax, dword [eax+18H]                    ; 1A75 _ 8B. 40, 18
        cmp     edx, eax                                ; 1A78 _ 39. C2
        jz      ?_084                                   ; 1A7A _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 1A7C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1A7F _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 1A82 _ 0F AF. 45, D0
        mov     edx, eax                                ; 1A86 _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 1A88 _ 8B. 45, CC
        add     eax, edx                                ; 1A8B _ 01. D0
        mov     edx, eax                                ; 1A8D _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 1A8F _ 8B. 45, E0
        add     edx, eax                                ; 1A92 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 1A94 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 1A98 _ 88. 02
?_084:  add     dword [ebp-8H], 1                       ; 1A9A _ 83. 45, F8, 01
?_085:  mov     eax, dword [ebp-8H]                     ; 1A9E _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 1AA1 _ 3B. 45, E8
        jl      ?_083                                   ; 1AA4 _ 7C, A0
        add     dword [ebp-0CH], 1                      ; 1AA6 _ 83. 45, F4, 01
?_086:  mov     eax, dword [ebp-0CH]                    ; 1AAA _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 1AAD _ 3B. 45, E4
        jl      ?_082                                   ; 1AB0 _ 0F 8C, FFFFFF7A
        add     dword [ebp-4H], 1                       ; 1AB6 _ 83. 45, FC, 01
?_087:  mov     eax, dword [ebp+8H]                     ; 1ABA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1ABD _ 8B. 40, 10
        cmp     eax, dword [ebp-4H]                     ; 1AC0 _ 3B. 45, FC
        jge     ?_077                                   ; 1AC3 _ 0F 8D, FFFFFEAB
        nop                                             ; 1AC9 _ 90
        leave                                           ; 1ACA _ C9
        ret                                             ; 1ACB _ C3
; sheet_refreshmap End of function

getTimerCTL:; Function begin
        push    ebp                                     ; 1ACC _ 55
        mov     ebp, esp                                ; 1ACD _ 89. E5
        mov     eax, timerctl                           ; 1ACF _ B8, 00000220(d)
        pop     ebp                                     ; 1AD4 _ 5D
        ret                                             ; 1AD5 _ C3
; getTimerCTL End of function

init_pit:; Function begin
        push    ebp                                     ; 1AD6 _ 55
        mov     ebp, esp                                ; 1AD7 _ 89. E5
        sub     esp, 24                                 ; 1AD9 _ 83. EC, 18
        sub     esp, 8                                  ; 1ADC _ 83. EC, 08
        push    52                                      ; 1ADF _ 6A, 34
        push    67                                      ; 1AE1 _ 6A, 43
        call    outb_p                                  ; 1AE3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AE8 _ 83. C4, 10
        sub     esp, 8                                  ; 1AEB _ 83. EC, 08
        push    -100                                    ; 1AEE _ 6A, 9C
        push    64                                      ; 1AF0 _ 6A, 40
        call    outb_p                                  ; 1AF2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AF7 _ 83. C4, 10
        sub     esp, 8                                  ; 1AFA _ 83. EC, 08
        push    46                                      ; 1AFD _ 6A, 2E
        push    64                                      ; 1AFF _ 6A, 40
        call    outb_p                                  ; 1B01 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B06 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 1B09 _ C7. 05, 00000220(d), 00000000
        mov     dword [?_189], -1                       ; 1B13 _ C7. 05, 00000224(d), FFFFFFFF
        mov     dword [?_190], 0                        ; 1B1D _ C7. 05, 00000228(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 1B27 _ C7. 45, F4, 00000000
        jmp     ?_089                                   ; 1B2E _ EB, 18

?_088:  mov     eax, dword [ebp-0CH]                    ; 1B30 _ 8B. 45, F4
        add     eax, 16                                 ; 1B33 _ 83. C0, 10
        shl     eax, 4                                  ; 1B36 _ C1. E0, 04
        add     eax, ?_192                              ; 1B39 _ 05, 00000230(d)
        mov     dword [eax], 0                          ; 1B3E _ C7. 00, 00000000
        add     dword [ebp-0CH], 1                      ; 1B44 _ 83. 45, F4, 01
?_089:  cmp     dword [ebp-0CH], 63                     ; 1B48 _ 83. 7D, F4, 3F
        jle     ?_088                                   ; 1B4C _ 7E, E2
        nop                                             ; 1B4E _ 90
        leave                                           ; 1B4F _ C9
        ret                                             ; 1B50 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 1B51 _ 55
        mov     ebp, esp                                ; 1B52 _ 89. E5
        sub     esp, 16                                 ; 1B54 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1B57 _ C7. 45, FC, 00000000
        jmp     ?_092                                   ; 1B5E _ EB, 3F

?_090:  mov     eax, dword [ebp-4H]                     ; 1B60 _ 8B. 45, FC
        add     eax, 16                                 ; 1B63 _ 83. C0, 10
        shl     eax, 4                                  ; 1B66 _ C1. E0, 04
        add     eax, ?_192                              ; 1B69 _ 05, 00000230(d)
        mov     eax, dword [eax]                        ; 1B6E _ 8B. 00
        test    eax, eax                                ; 1B70 _ 85. C0
        jnz     ?_091                                   ; 1B72 _ 75, 27
        mov     eax, dword [ebp-4H]                     ; 1B74 _ 8B. 45, FC
        add     eax, 16                                 ; 1B77 _ 83. C0, 10
        shl     eax, 4                                  ; 1B7A _ C1. E0, 04
        add     eax, ?_192                              ; 1B7D _ 05, 00000230(d)
        mov     dword [eax], 1                          ; 1B82 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 1B88 _ 8B. 45, FC
        add     eax, 16                                 ; 1B8B _ 83. C0, 10
        shl     eax, 4                                  ; 1B8E _ C1. E0, 04
        add     eax, timerctl                           ; 1B91 _ 05, 00000220(d)
        add     eax, 12                                 ; 1B96 _ 83. C0, 0C
        jmp     ?_093                                   ; 1B99 _ EB, 0F

?_091:  add     dword [ebp-4H], 1                       ; 1B9B _ 83. 45, FC, 01
?_092:  cmp     dword [ebp-4H], 63                      ; 1B9F _ 83. 7D, FC, 3F
        jle     ?_090                                   ; 1BA3 _ 7E, BB
        mov     eax, 0                                  ; 1BA5 _ B8, 00000000
?_093:  leave                                           ; 1BAA _ C9
        ret                                             ; 1BAB _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 1BAC _ 55
        mov     ebp, esp                                ; 1BAD _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1BAF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1BB2 _ C7. 40, 04, 00000000
        nop                                             ; 1BB9 _ 90
        pop     ebp                                     ; 1BBA _ 5D
        ret                                             ; 1BBB _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 1BBC _ 55
        mov     ebp, esp                                ; 1BBD _ 89. E5
        sub     esp, 4                                  ; 1BBF _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 1BC2 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 1BC5 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1BC8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1BCB _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 1BCE _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1BD1 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1BD4 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 1BD8 _ 88. 50, 0C
        nop                                             ; 1BDB _ 90
        leave                                           ; 1BDC _ C9
        ret                                             ; 1BDD _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 1BDE _ 55
        mov     ebp, esp                                ; 1BDF _ 89. E5
        sub     esp, 24                                 ; 1BE1 _ 83. EC, 18
        mov     edx, dword [timerctl]                   ; 1BE4 _ 8B. 15, 00000220(d)
        mov     eax, dword [ebp+0CH]                    ; 1BEA _ 8B. 45, 0C
        add     edx, eax                                ; 1BED _ 01. C2
        mov     eax, dword [ebp+8H]                     ; 1BEF _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1BF2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1BF4 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 1BF7 _ C7. 40, 04, 00000002
        call    load_eflags                             ; 1BFE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1C03 _ 89. 45, EC
        cli                                             ; 1C06 _ FA
        mov     dword [ebp-0CH], 0                      ; 1C07 _ C7. 45, F4, 00000000
        jmp     ?_095                                   ; 1C0E _ EB, 19

?_094:  mov     eax, dword [ebp-0CH]                    ; 1C10 _ 8B. 45, F4
        mov     eax, dword [?_191+eax*4]                ; 1C13 _ 8B. 04 85, 0000022C(d)
        mov     edx, dword [eax]                        ; 1C1A _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1C1C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C1F _ 8B. 00
        cmp     edx, eax                                ; 1C21 _ 39. C2
        jnc     ?_096                                   ; 1C23 _ 73, 13
        add     dword [ebp-0CH], 1                      ; 1C25 _ 83. 45, F4, 01
?_095:  mov     edx, dword [?_190]                      ; 1C29 _ 8B. 15, 00000228(d)
        mov     eax, dword [ebp-0CH]                    ; 1C2F _ 8B. 45, F4
        cmp     edx, eax                                ; 1C32 _ 39. C2
        ja      ?_094                                   ; 1C34 _ 77, DA
        jmp     ?_097                                   ; 1C36 _ EB, 01

?_096:  nop                                             ; 1C38 _ 90
?_097:  mov     eax, dword [?_190]                      ; 1C39 _ A1, 00000228(d)
        mov     dword [ebp-10H], eax                    ; 1C3E _ 89. 45, F0
        jmp     ?_099                                   ; 1C41 _ EB, 1B

?_098:  mov     eax, dword [ebp-10H]                    ; 1C43 _ 8B. 45, F0
        sub     eax, 1                                  ; 1C46 _ 83. E8, 01
        mov     edx, dword [?_191+eax*4]                ; 1C49 _ 8B. 14 85, 0000022C(d)
        mov     eax, dword [ebp-10H]                    ; 1C50 _ 8B. 45, F0
        mov     dword [?_191+eax*4], edx                ; 1C53 _ 89. 14 85, 0000022C(d)
        sub     dword [ebp-10H], 1                      ; 1C5A _ 83. 6D, F0, 01
?_099:  mov     eax, dword [ebp-10H]                    ; 1C5E _ 8B. 45, F0
        cmp     eax, dword [ebp-0CH]                    ; 1C61 _ 3B. 45, F4
        jg      ?_098                                   ; 1C64 _ 7F, DD
        mov     eax, dword [?_190]                      ; 1C66 _ A1, 00000228(d)
        add     eax, 1                                  ; 1C6B _ 83. C0, 01
        mov     dword [?_190], eax                      ; 1C6E _ A3, 00000228(d)
        mov     eax, dword [ebp-0CH]                    ; 1C73 _ 8B. 45, F4
        mov     edx, dword [ebp+8H]                     ; 1C76 _ 8B. 55, 08
        mov     dword [?_191+eax*4], edx                ; 1C79 _ 89. 14 85, 0000022C(d)
        mov     eax, dword [?_191]                      ; 1C80 _ A1, 0000022C(d)
        mov     eax, dword [eax]                        ; 1C85 _ 8B. 00
        mov     dword [?_189], eax                      ; 1C87 _ A3, 00000224(d)
        sub     esp, 12                                 ; 1C8C _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 1C8F _ FF. 75, EC
        call    store_eflags                            ; 1C92 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C97 _ 83. C4, 10
        nop                                             ; 1C9A _ 90
        leave                                           ; 1C9B _ C9
        ret                                             ; 1C9C _ C3
; timer_settime End of function

inthandler20:; Function begin
        push    ebp                                     ; 1C9D _ 55
        mov     ebp, esp                                ; 1C9E _ 89. E5
        sub     esp, 24                                 ; 1CA0 _ 83. EC, 18
        sub     esp, 8                                  ; 1CA3 _ 83. EC, 08
        push    96                                      ; 1CA6 _ 6A, 60
        push    32                                      ; 1CA8 _ 6A, 20
        call    outb_p                                  ; 1CAA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1CAF _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 1CB2 _ A1, 00000220(d)
        add     eax, 1                                  ; 1CB7 _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 1CBA _ A3, 00000220(d)
        mov     edx, dword [?_189]                      ; 1CBF _ 8B. 15, 00000224(d)
        mov     eax, dword [timerctl]                   ; 1CC5 _ A1, 00000220(d)
        cmp     edx, eax                                ; 1CCA _ 39. C2
        ja      ?_107                                   ; 1CCC _ 0F 87, 000000D7
        mov     dword [ebp-0CH], 0                      ; 1CD2 _ C7. 45, F4, 00000000
        jmp     ?_101                                   ; 1CD9 _ EB, 55

?_100:  mov     eax, dword [ebp-0CH]                    ; 1CDB _ 8B. 45, F4
        mov     eax, dword [?_191+eax*4]                ; 1CDE _ 8B. 04 85, 0000022C(d)
        mov     edx, dword [eax]                        ; 1CE5 _ 8B. 10
        mov     eax, dword [timerctl]                   ; 1CE7 _ A1, 00000220(d)
        cmp     edx, eax                                ; 1CEC _ 39. C2
        ja      ?_102                                   ; 1CEE _ 77, 4F
        mov     eax, dword [ebp-0CH]                    ; 1CF0 _ 8B. 45, F4
        mov     eax, dword [?_191+eax*4]                ; 1CF3 _ 8B. 04 85, 0000022C(d)
        mov     dword [eax+4H], 1                       ; 1CFA _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-0CH]                    ; 1D01 _ 8B. 45, F4
        mov     eax, dword [?_191+eax*4]                ; 1D04 _ 8B. 04 85, 0000022C(d)
        movzx   eax, byte [eax+0CH]                     ; 1D0B _ 0F B6. 40, 0C
        movzx   edx, al                                 ; 1D0F _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 1D12 _ 8B. 45, F4
        mov     eax, dword [?_191+eax*4]                ; 1D15 _ 8B. 04 85, 0000022C(d)
        mov     eax, dword [eax+8H]                     ; 1D1C _ 8B. 40, 08
        sub     esp, 8                                  ; 1D1F _ 83. EC, 08
        push    edx                                     ; 1D22 _ 52
        push    eax                                     ; 1D23 _ 50
        call    fifo_put                                ; 1D24 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1D29 _ 83. C4, 10
        add     dword [ebp-0CH], 1                      ; 1D2C _ 83. 45, F4, 01
?_101:  mov     edx, dword [?_190]                      ; 1D30 _ 8B. 15, 00000228(d)
        mov     eax, dword [ebp-0CH]                    ; 1D36 _ 8B. 45, F4
        cmp     edx, eax                                ; 1D39 _ 39. C2
        ja      ?_100                                   ; 1D3B _ 77, 9E
        jmp     ?_103                                   ; 1D3D _ EB, 01

?_102:  nop                                             ; 1D3F _ 90
?_103:  mov     edx, dword [?_190]                      ; 1D40 _ 8B. 15, 00000228(d)
        mov     eax, dword [ebp-0CH]                    ; 1D46 _ 8B. 45, F4
        sub     edx, eax                                ; 1D49 _ 29. C2
        mov     eax, edx                                ; 1D4B _ 89. D0
        mov     dword [?_190], eax                      ; 1D4D _ A3, 00000228(d)
        mov     dword [ebp-10H], 0                      ; 1D52 _ C7. 45, F0, 00000000
        jmp     ?_105                                   ; 1D59 _ EB, 1D

?_104:  mov     edx, dword [ebp-0CH]                    ; 1D5B _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 1D5E _ 8B. 45, F0
        add     eax, edx                                ; 1D61 _ 01. D0
        mov     edx, dword [?_191+eax*4]                ; 1D63 _ 8B. 14 85, 0000022C(d)
        mov     eax, dword [ebp-10H]                    ; 1D6A _ 8B. 45, F0
        mov     dword [?_191+eax*4], edx                ; 1D6D _ 89. 14 85, 0000022C(d)
        add     dword [ebp-10H], 1                      ; 1D74 _ 83. 45, F0, 01
?_105:  mov     edx, dword [?_190]                      ; 1D78 _ 8B. 15, 00000228(d)
        mov     eax, dword [ebp-10H]                    ; 1D7E _ 8B. 45, F0
        cmp     edx, eax                                ; 1D81 _ 39. C2
        ja      ?_104                                   ; 1D83 _ 77, D6
        mov     eax, dword [?_190]                      ; 1D85 _ A1, 00000228(d)
        test    eax, eax                                ; 1D8A _ 85. C0
        jz      ?_106                                   ; 1D8C _ 74, 0E
        mov     eax, dword [?_191]                      ; 1D8E _ A1, 0000022C(d)
        mov     eax, dword [eax]                        ; 1D93 _ 8B. 00
        mov     dword [?_189], eax                      ; 1D95 _ A3, 00000224(d)
        jmp     ?_108                                   ; 1D9A _ EB, 0E

?_106:  mov     dword [?_189], -1                       ; 1D9C _ C7. 05, 00000224(d), FFFFFFFF
        nop                                             ; 1DA6 _ 90
        jmp     ?_108                                   ; 1DA7 _ EB, 01

?_107:  nop                                             ; 1DA9 _ 90
?_108:  leave                                           ; 1DAA _ C9
        ret                                             ; 1DAB _ C3
; inthandler20 End of function

memman_init:; Function begin
        push    ebp                                     ; 1DAC _ 55
        mov     ebp, esp                                ; 1DAD _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1DAF _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1DB2 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1DB8 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1DBB _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1DC2 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1DC5 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1DCC _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1DCF _ C7. 40, 0C, 00000000
        nop                                             ; 1DD6 _ 90
        pop     ebp                                     ; 1DD7 _ 5D
        ret                                             ; 1DD8 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1DD9 _ 55
        mov     ebp, esp                                ; 1DDA _ 89. E5
        sub     esp, 16                                 ; 1DDC _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1DDF _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 1DE6 _ C7. 45, FC, 00000000
        jmp     ?_110                                   ; 1DED _ EB, 14

?_109:  mov     eax, dword [ebp+8H]                     ; 1DEF _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1DF2 _ 8B. 55, FC
        add     edx, 2                                  ; 1DF5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1DF8 _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1DFC _ 01. 45, F8
        add     dword [ebp-4H], 1                       ; 1DFF _ 83. 45, FC, 01
?_110:  mov     eax, dword [ebp+8H]                     ; 1E03 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E06 _ 8B. 00
        cmp     eax, dword [ebp-4H]                     ; 1E08 _ 3B. 45, FC
        ja      ?_109                                   ; 1E0B _ 77, E2
        mov     eax, dword [ebp-8H]                     ; 1E0D _ 8B. 45, F8
        leave                                           ; 1E10 _ C9
        ret                                             ; 1E11 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1E12 _ 55
        mov     ebp, esp                                ; 1E13 _ 89. E5
        push    ebx                                     ; 1E15 _ 53
        sub     esp, 16                                 ; 1E16 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1E19 _ C7. 45, F8, 00000000
        jmp     ?_116                                   ; 1E20 _ E9, 000000BE

?_111:  mov     eax, dword [ebp+8H]                     ; 1E25 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E28 _ 8B. 55, F8
        add     edx, 2                                  ; 1E2B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1E2E _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 1E32 _ 3B. 45, 0C
        jnc     ?_112                                   ; 1E35 _ 73, 09
        add     dword [ebp-8H], 1                       ; 1E37 _ 83. 45, F8, 01
        jmp     ?_116                                   ; 1E3B _ E9, 000000A3

?_112:  mov     eax, dword [ebp+8H]                     ; 1E40 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E43 _ 8B. 55, F8
        add     edx, 2                                  ; 1E46 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E49 _ 8B. 04 D0
        mov     dword [ebp-0CH], eax                    ; 1E4C _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1E4F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E52 _ 8B. 55, F8
        add     edx, 2                                  ; 1E55 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1E58 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1E5B _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1E5E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E61 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E64 _ 8B. 55, F8
        add     edx, 2                                  ; 1E67 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1E6A _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1E6D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E70 _ 8B. 55, F8
        add     edx, 2                                  ; 1E73 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1E76 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1E7A _ 2B. 45, 0C
        mov     edx, eax                                ; 1E7D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1E7F _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1E82 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1E85 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1E88 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1E8C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E8F _ 8B. 55, F8
        add     edx, 2                                  ; 1E92 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1E95 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1E99 _ 85. C0
        jnz     ?_115                                   ; 1E9B _ 75, 41
        mov     eax, dword [ebp+8H]                     ; 1E9D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EA0 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1EA2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1EA5 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1EA8 _ 89. 10
        jmp     ?_114                                   ; 1EAA _ EB, 28

?_113:  mov     eax, dword [ebp-8H]                     ; 1EAC _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 1EAF _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 1EB2 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1EB5 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1EB8 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1EBB _ 8B. 45, 08
        add     edx, 2                                  ; 1EBE _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1EC1 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1EC4 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1EC6 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1EC9 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1ECC _ 89. 54 D9, 04
        add     dword [ebp-8H], 1                       ; 1ED0 _ 83. 45, F8, 01
?_114:  mov     eax, dword [ebp+8H]                     ; 1ED4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1ED7 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1ED9 _ 3B. 45, F8
        ja      ?_113                                   ; 1EDC _ 77, CE
?_115:  mov     eax, dword [ebp-0CH]                    ; 1EDE _ 8B. 45, F4
        jmp     ?_117                                   ; 1EE1 _ EB, 13

?_116:  mov     eax, dword [ebp+8H]                     ; 1EE3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EE6 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1EE8 _ 3B. 45, F8
        ja      ?_111                                   ; 1EEB _ 0F 87, FFFFFF34
        mov     eax, 0                                  ; 1EF1 _ B8, 00000000
?_117:  add     esp, 16                                 ; 1EF6 _ 83. C4, 10
        pop     ebx                                     ; 1EF9 _ 5B
        pop     ebp                                     ; 1EFA _ 5D
        ret                                             ; 1EFB _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1EFC _ 55
        mov     ebp, esp                                ; 1EFD _ 89. E5
        push    ebx                                     ; 1EFF _ 53
        sub     esp, 16                                 ; 1F00 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 1F03 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F06 _ 8B. 00
        test    eax, eax                                ; 1F08 _ 85. C0
        jnz     ?_118                                   ; 1F0A _ 75, 29
        mov     eax, dword [ebp+8H]                     ; 1F0C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1F0F _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 1F12 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1F15 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1F18 _ 8B. 55, 10
        mov     dword [eax+14H], edx                    ; 1F1B _ 89. 50, 14
        mov     eax, dword [ebp+8H]                     ; 1F1E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F21 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1F23 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F26 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1F29 _ 89. 10
        mov     eax, 1                                  ; 1F2B _ B8, 00000001
        jmp     ?_133                                   ; 1F30 _ E9, 00000248

?_118:  mov     dword [ebp-8H], 0                       ; 1F35 _ C7. 45, F8, 00000000
        jmp     ?_120                                   ; 1F3C _ EB, 15

?_119:  mov     eax, dword [ebp+8H]                     ; 1F3E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F41 _ 8B. 55, F8
        add     edx, 2                                  ; 1F44 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1F47 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 1F4A _ 3B. 45, 0C
        jnc     ?_121                                   ; 1F4D _ 73, 10
        add     dword [ebp-8H], 1                       ; 1F4F _ 83. 45, F8, 01
?_120:  mov     eax, dword [ebp+8H]                     ; 1F53 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F56 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1F58 _ 3B. 45, F8
        ja      ?_119                                   ; 1F5B _ 77, E1
        jmp     ?_122                                   ; 1F5D _ EB, 01

?_121:  nop                                             ; 1F5F _ 90
?_122:  cmp     dword [ebp-8H], 0                       ; 1F60 _ 83. 7D, F8, 00
        je      ?_127                                   ; 1F64 _ 0F 84, 000000F7
        mov     eax, dword [ebp-8H]                     ; 1F6A _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1F6D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1F70 _ 8B. 45, 08
        add     edx, 2                                  ; 1F73 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1F76 _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 1F79 _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 1F7C _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1F7F _ 8B. 45, 08
        add     ecx, 2                                  ; 1F82 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1F85 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1F89 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 1F8B _ 3B. 45, 0C
        jne     ?_127                                   ; 1F8E _ 0F 85, 000000CD
        mov     eax, dword [ebp-8H]                     ; 1F94 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 1F97 _ 8D. 58, FF
        mov     eax, dword [ebp-8H]                     ; 1F9A _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1F9D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1FA0 _ 8B. 45, 08
        add     edx, 2                                  ; 1FA3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1FA6 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1FAA _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1FAD _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1FB0 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1FB3 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1FB6 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1FBA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FBD _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1FBF _ 3B. 45, F8
        jnz     ?_123                                   ; 1FC2 _ 75, 0A
        mov     eax, 1                                  ; 1FC4 _ B8, 00000001
        jmp     ?_133                                   ; 1FC9 _ E9, 000001AF

?_123:  mov     eax, dword [ebp+8H]                     ; 1FCE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1FD1 _ 8B. 55, F8
        add     edx, 2                                  ; 1FD4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1FD7 _ 8B. 04 D0
        mov     ecx, dword [ebp+0CH]                    ; 1FDA _ 8B. 4D, 0C
        mov     edx, dword [ebp+10H]                    ; 1FDD _ 8B. 55, 10
        add     edx, ecx                                ; 1FE0 _ 01. CA
        cmp     eax, edx                                ; 1FE2 _ 39. D0
        jnz     ?_126                                   ; 1FE4 _ 75, 71
        mov     eax, dword [ebp-8H]                     ; 1FE6 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 1FE9 _ 8D. 58, FF
        mov     eax, dword [ebp-8H]                     ; 1FEC _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1FEF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1FF2 _ 8B. 45, 08
        add     edx, 2                                  ; 1FF5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1FF8 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1FFC _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1FFF _ 8B. 4D, F8
        add     ecx, 2                                  ; 2002 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2005 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 2009 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 200C _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 200F _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2012 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2016 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2019 _ 8B. 00
        lea     edx, [eax-1H]                           ; 201B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 201E _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2021 _ 89. 10
        jmp     ?_125                                   ; 2023 _ EB, 28

?_124:  mov     eax, dword [ebp-8H]                     ; 2025 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 2028 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 202B _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 202E _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 2031 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2034 _ 8B. 45, 08
        add     edx, 2                                  ; 2037 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 203A _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 203D _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 203F _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2042 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2045 _ 89. 54 D9, 04
        add     dword [ebp-8H], 1                       ; 2049 _ 83. 45, F8, 01
?_125:  mov     eax, dword [ebp+8H]                     ; 204D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2050 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2052 _ 3B. 45, F8
        ja      ?_124                                   ; 2055 _ 77, CE
?_126:  mov     eax, 1                                  ; 2057 _ B8, 00000001
        jmp     ?_133                                   ; 205C _ E9, 0000011C

?_127:  mov     eax, dword [ebp+8H]                     ; 2061 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2064 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2066 _ 3B. 45, F8
        jbe     ?_128                                   ; 2069 _ 76, 52
        mov     edx, dword [ebp+0CH]                    ; 206B _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 206E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2071 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2074 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2077 _ 8B. 55, F8
        add     edx, 2                                  ; 207A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 207D _ 8B. 04 D0
        cmp     ecx, eax                                ; 2080 _ 39. C1
        jnz     ?_128                                   ; 2082 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 2084 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2087 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 208A _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 208D _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2090 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2093 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2096 _ 8B. 55, F8
        add     edx, 2                                  ; 2099 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 209C _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 20A0 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 20A3 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 20A6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 20A9 _ 8B. 55, F8
        add     edx, 2                                  ; 20AC _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 20AF _ 89. 4C D0, 04
        mov     eax, 1                                  ; 20B3 _ B8, 00000001
        jmp     ?_133                                   ; 20B8 _ E9, 000000C0

?_128:  mov     eax, dword [ebp+8H]                     ; 20BD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20C0 _ 8B. 00
        cmp     eax, 4089                               ; 20C2 _ 3D, 00000FF9
        jg      ?_132                                   ; 20C7 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 20CD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20D0 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 20D2 _ 89. 45, F4
        jmp     ?_130                                   ; 20D5 _ EB, 28

?_129:  mov     eax, dword [ebp-0CH]                    ; 20D7 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 20DA _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 20DD _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 20E0 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 20E3 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 20E6 _ 8B. 45, 08
        add     edx, 2                                  ; 20E9 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 20EC _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 20EF _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 20F1 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 20F4 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 20F7 _ 89. 54 D9, 04
        sub     dword [ebp-0CH], 1                      ; 20FB _ 83. 6D, F4, 01
?_130:  mov     eax, dword [ebp-0CH]                    ; 20FF _ 8B. 45, F4
        cmp     dword [ebp-8H], eax                     ; 2102 _ 39. 45, F8
        jc      ?_129                                   ; 2105 _ 72, D0
        mov     eax, dword [ebp+8H]                     ; 2107 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 210A _ 8B. 00
        lea     edx, [eax+1H]                           ; 210C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 210F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2112 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2114 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2117 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 211A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 211D _ 8B. 00
        cmp     edx, eax                                ; 211F _ 39. C2
        jge     ?_131                                   ; 2121 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 2123 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2126 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2128 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 212B _ 89. 50, 04
?_131:  mov     eax, dword [ebp+8H]                     ; 212E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2131 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 2134 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2137 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 213A _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 213D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2140 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 2143 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2146 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 2149 _ 89. 54 C8, 04
        mov     eax, 1                                  ; 214D _ B8, 00000001
        jmp     ?_133                                   ; 2152 _ EB, 29

?_132:  mov     eax, dword [ebp+8H]                     ; 2154 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2157 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 215A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 215D _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2160 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2163 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2166 _ 8B. 40, 08
        mov     edx, eax                                ; 2169 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 216B _ 8B. 45, 10
        add     eax, edx                                ; 216E _ 01. D0
        mov     edx, eax                                ; 2170 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2172 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2175 _ 89. 50, 08
        mov     eax, 0                                  ; 2178 _ B8, 00000000
?_133:  add     esp, 16                                 ; 217D _ 83. C4, 10
        pop     ebx                                     ; 2180 _ 5B
        pop     ebp                                     ; 2181 _ 5D
        ret                                             ; 2182 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 2183 _ 55
        mov     ebp, esp                                ; 2184 _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 2186 _ 8B. 45, 0C
        add     eax, 4095                               ; 2189 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 218E _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 2193 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 2196 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2199 _ FF. 75, 08
        call    memman_alloc                            ; 219C _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 21A1 _ 83. C4, 08
        leave                                           ; 21A4 _ C9
        ret                                             ; 21A5 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 21A6 _ 55
        mov     ebp, esp                                ; 21A7 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 21A9 _ 8B. 45, 10
        add     eax, 4095                               ; 21AC _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 21B1 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 21B6 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 21B9 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 21BC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 21BF _ FF. 75, 08
        call    memman_free                             ; 21C2 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 21C7 _ 83. C4, 0C
        leave                                           ; 21CA _ C9
        ret                                             ; 21CB _ C3
; memman_free_4k End of function

delay:  ; Function begin
        push    ebp                                     ; 21CC _ 55
        mov     ebp, esp                                ; 21CD _ 89. E5
        sub     esp, 16                                 ; 21CF _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 21D2 _ 8B. 45, 08
        imul    eax, eax, 1000                          ; 21D5 _ 69. C0, 000003E8
        mov     dword [ebp-0CH], eax                    ; 21DB _ 89. 45, F4
        mov     dword [ebp-8H], 0                       ; 21DE _ C7. 45, F8, 00000000
        jmp     ?_135                                   ; 21E5 _ EB, 12

?_134:  mov     eax, dword [ebp-8H]                     ; 21E7 _ 8B. 45, F8
        add     eax, 1                                  ; 21EA _ 83. C0, 01
        and     eax, 0FFFH                              ; 21ED _ 25, 00000FFF
        mov     dword [ebp-4H], eax                     ; 21F2 _ 89. 45, FC
        add     dword [ebp-8H], 1                       ; 21F5 _ 83. 45, F8, 01
?_135:  mov     eax, dword [ebp-8H]                     ; 21F9 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 21FC _ 3B. 45, F4
        jl      ?_134                                   ; 21FF _ 7C, E6
        mov     eax, dword [ebp-4H]                     ; 2201 _ 8B. 45, FC
        leave                                           ; 2204 _ C9
        ret                                             ; 2205 _ C3
; delay End of function

putfont:; Function begin
        push    ebp                                     ; 2206 _ 55
        mov     ebp, esp                                ; 2207 _ 89. E5
        sub     esp, 24                                 ; 2209 _ 83. EC, 18
        mov     edx, dword [ebp+18H]                    ; 220C _ 8B. 55, 18
        mov     eax, dword [ebp+1CH]                    ; 220F _ 8B. 45, 1C
        mov     byte [ebp-14H], dl                      ; 2212 _ 88. 55, EC
        mov     byte [ebp-18H], al                      ; 2215 _ 88. 45, E8
        mov     dword [ebp-4H], 0                       ; 2218 _ C7. 45, FC, 00000000
        movsx   eax, byte [ebp-18H]                     ; 221F _ 0F BE. 45, E8
        shl     eax, 4                                  ; 2223 _ C1. E0, 04
        add     eax, systemFont                         ; 2226 _ 05, 00000000(d)
        mov     dword [ebp-8H], eax                     ; 222B _ 89. 45, F8
        jmp     ?_145                                   ; 222E _ E9, 000000DD

?_136:  mov     edx, dword [ebp-4H]                     ; 2233 _ 8B. 55, FC
        mov     eax, dword [ebp-8H]                     ; 2236 _ 8B. 45, F8
        add     eax, edx                                ; 2239 _ 01. D0
        movzx   eax, byte [eax]                         ; 223B _ 0F B6. 00
        mov     byte [ebp-9H], al                       ; 223E _ 88. 45, F7
        mov     edx, dword [ebp+14H]                    ; 2241 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 2244 _ 8B. 45, FC
        add     eax, edx                                ; 2247 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2249 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 224D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 224F _ 8B. 45, 10
        add     edx, eax                                ; 2252 _ 01. C2
        mov     eax, dword [ebp+8H]                     ; 2254 _ 8B. 45, 08
        add     eax, edx                                ; 2257 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 2259 _ 89. 45, F0
        cmp     byte [ebp-9H], 0                        ; 225C _ 80. 7D, F7, 00
        jns     ?_137                                   ; 2260 _ 79, 09
        mov     eax, dword [ebp-10H]                    ; 2262 _ 8B. 45, F0
        movzx   edx, byte [ebp-14H]                     ; 2265 _ 0F B6. 55, EC
        mov     byte [eax], dl                          ; 2269 _ 88. 10
?_137:  movsx   eax, byte [ebp-9H]                      ; 226B _ 0F BE. 45, F7
        and     eax, 40H                                ; 226F _ 83. E0, 40
        test    eax, eax                                ; 2272 _ 85. C0
        jz      ?_138                                   ; 2274 _ 74, 0C
        mov     eax, dword [ebp-10H]                    ; 2276 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2279 _ 8D. 50, 01
        movzx   eax, byte [ebp-14H]                     ; 227C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2280 _ 88. 02
?_138:  movsx   eax, byte [ebp-9H]                      ; 2282 _ 0F BE. 45, F7
        and     eax, 20H                                ; 2286 _ 83. E0, 20
        test    eax, eax                                ; 2289 _ 85. C0
        jz      ?_139                                   ; 228B _ 74, 0C
        mov     eax, dword [ebp-10H]                    ; 228D _ 8B. 45, F0
        lea     edx, [eax+2H]                           ; 2290 _ 8D. 50, 02
        movzx   eax, byte [ebp-14H]                     ; 2293 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2297 _ 88. 02
?_139:  movsx   eax, byte [ebp-9H]                      ; 2299 _ 0F BE. 45, F7
        and     eax, 10H                                ; 229D _ 83. E0, 10
        test    eax, eax                                ; 22A0 _ 85. C0
        jz      ?_140                                   ; 22A2 _ 74, 0C
        mov     eax, dword [ebp-10H]                    ; 22A4 _ 8B. 45, F0
        lea     edx, [eax+3H]                           ; 22A7 _ 8D. 50, 03
        movzx   eax, byte [ebp-14H]                     ; 22AA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 22AE _ 88. 02
?_140:  movsx   eax, byte [ebp-9H]                      ; 22B0 _ 0F BE. 45, F7
        and     eax, 08H                                ; 22B4 _ 83. E0, 08
        test    eax, eax                                ; 22B7 _ 85. C0
        jz      ?_141                                   ; 22B9 _ 74, 0C
        mov     eax, dword [ebp-10H]                    ; 22BB _ 8B. 45, F0
        lea     edx, [eax+4H]                           ; 22BE _ 8D. 50, 04
        movzx   eax, byte [ebp-14H]                     ; 22C1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 22C5 _ 88. 02
?_141:  movsx   eax, byte [ebp-9H]                      ; 22C7 _ 0F BE. 45, F7
        and     eax, 04H                                ; 22CB _ 83. E0, 04
        test    eax, eax                                ; 22CE _ 85. C0
        jz      ?_142                                   ; 22D0 _ 74, 0C
        mov     eax, dword [ebp-10H]                    ; 22D2 _ 8B. 45, F0
        lea     edx, [eax+5H]                           ; 22D5 _ 8D. 50, 05
        movzx   eax, byte [ebp-14H]                     ; 22D8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 22DC _ 88. 02
?_142:  movsx   eax, byte [ebp-9H]                      ; 22DE _ 0F BE. 45, F7
        and     eax, 02H                                ; 22E2 _ 83. E0, 02
        test    eax, eax                                ; 22E5 _ 85. C0
        jz      ?_143                                   ; 22E7 _ 74, 0C
        mov     eax, dword [ebp-10H]                    ; 22E9 _ 8B. 45, F0
        lea     edx, [eax+6H]                           ; 22EC _ 8D. 50, 06
        movzx   eax, byte [ebp-14H]                     ; 22EF _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 22F3 _ 88. 02
?_143:  movsx   eax, byte [ebp-9H]                      ; 22F5 _ 0F BE. 45, F7
        and     eax, 01H                                ; 22F9 _ 83. E0, 01
        test    eax, eax                                ; 22FC _ 85. C0
        jz      ?_144                                   ; 22FE _ 74, 0C
        mov     eax, dword [ebp-10H]                    ; 2300 _ 8B. 45, F0
        lea     edx, [eax+7H]                           ; 2303 _ 8D. 50, 07
        movzx   eax, byte [ebp-14H]                     ; 2306 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 230A _ 88. 02
?_144:  add     dword [ebp-4H], 1                       ; 230C _ 83. 45, FC, 01
?_145:  cmp     dword [ebp-4H], 15                      ; 2310 _ 83. 7D, FC, 0F
        jle     ?_136                                   ; 2314 _ 0F 8E, FFFFFF19
        nop                                             ; 231A _ 90
        leave                                           ; 231B _ C9
        ret                                             ; 231C _ C3
; putfont End of function

showString:; Function begin
        push    ebp                                     ; 231D _ 55
        mov     ebp, esp                                ; 231E _ 89. E5
        sub     esp, 4                                  ; 2320 _ 83. EC, 04
        mov     eax, dword [ebp+18H]                    ; 2323 _ 8B. 45, 18
        mov     byte [ebp-4H], al                       ; 2326 _ 88. 45, FC
        jmp     ?_147                                   ; 2329 _ EB, 2B

?_146:  mov     eax, dword [ebp+1CH]                    ; 232B _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 232E _ 0F B6. 00
        movsx   edx, al                                 ; 2331 _ 0F BE. D0
        movsx   eax, byte [ebp-4H]                      ; 2334 _ 0F BE. 45, FC
        push    edx                                     ; 2338 _ 52
        push    eax                                     ; 2339 _ 50
        push    dword [ebp+14H]                         ; 233A _ FF. 75, 14
        push    dword [ebp+10H]                         ; 233D _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 2340 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2343 _ FF. 75, 08
        call    putfont                                 ; 2346 _ E8, FFFFFFFC(rel)
        add     esp, 24                                 ; 234B _ 83. C4, 18
        add     dword [ebp+10H], 8                      ; 234E _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 2352 _ 83. 45, 1C, 01
?_147:  mov     eax, dword [ebp+1CH]                    ; 2356 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2359 _ 0F B6. 00
        test    al, al                                  ; 235C _ 84. C0
        jnz     ?_146                                   ; 235E _ 75, CB
        nop                                             ; 2360 _ 90
        leave                                           ; 2361 _ C9
        ret                                             ; 2362 _ C3
; showString End of function

boxfill:; Function begin
        push    ebp                                     ; 2363 _ 55
        mov     ebp, esp                                ; 2364 _ 89. E5
        sub     esp, 20                                 ; 2366 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 2369 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 236C _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 236F _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 2372 _ 89. 45, F8
        jmp     ?_151                                   ; 2375 _ EB, 33

?_148:  mov     eax, dword [ebp+14H]                    ; 2377 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 237A _ 89. 45, FC
        jmp     ?_150                                   ; 237D _ EB, 1F

?_149:  mov     eax, dword [ebp-8H]                     ; 237F _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 2382 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2386 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2388 _ 8B. 45, FC
        add     eax, edx                                ; 238B _ 01. D0
        mov     edx, eax                                ; 238D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 238F _ 8B. 45, 08
        add     edx, eax                                ; 2392 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2394 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2398 _ 88. 02
        add     dword [ebp-4H], 1                       ; 239A _ 83. 45, FC, 01
?_150:  mov     eax, dword [ebp-4H]                     ; 239E _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 23A1 _ 3B. 45, 1C
        jle     ?_149                                   ; 23A4 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 23A6 _ 83. 45, F8, 01
?_151:  mov     eax, dword [ebp-8H]                     ; 23AA _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 23AD _ 3B. 45, 20
        jle     ?_148                                   ; 23B0 _ 7E, C5
        nop                                             ; 23B2 _ 90
        leave                                           ; 23B3 _ C9
        ret                                             ; 23B4 _ C3
; boxfill End of function

init_screen:; Function begin
        push    ebp                                     ; 23B5 _ 55
        mov     ebp, esp                                ; 23B6 _ 89. E5
        push    ebx                                     ; 23B8 _ 53
        mov     eax, dword [ebp+10H]                    ; 23B9 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 23BC _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 23BF _ 8B. 45, 0C
        sub     eax, 1                                  ; 23C2 _ 83. E8, 01
        push    edx                                     ; 23C5 _ 52
        push    eax                                     ; 23C6 _ 50
        push    0                                       ; 23C7 _ 6A, 00
        push    0                                       ; 23C9 _ 6A, 00
        push    14                                      ; 23CB _ 6A, 0E
        push    dword [ebp+0CH]                         ; 23CD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 23D0 _ FF. 75, 08
        call    boxfill                                 ; 23D3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 23D8 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 23DB _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 23DE _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 23E1 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 23E4 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 23E7 _ 8B. 45, 10
        sub     eax, 28                                 ; 23EA _ 83. E8, 1C
        push    ecx                                     ; 23ED _ 51
        push    edx                                     ; 23EE _ 52
        push    eax                                     ; 23EF _ 50
        push    0                                       ; 23F0 _ 6A, 00
        push    8                                       ; 23F2 _ 6A, 08
        push    dword [ebp+0CH]                         ; 23F4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 23F7 _ FF. 75, 08
        call    boxfill                                 ; 23FA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 23FF _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 2402 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 2405 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 2408 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 240B _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 240E _ 8B. 45, 10
        sub     eax, 27                                 ; 2411 _ 83. E8, 1B
        push    ecx                                     ; 2414 _ 51
        push    edx                                     ; 2415 _ 52
        push    eax                                     ; 2416 _ 50
        push    0                                       ; 2417 _ 6A, 00
        push    7                                       ; 2419 _ 6A, 07
        push    dword [ebp+0CH]                         ; 241B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 241E _ FF. 75, 08
        call    boxfill                                 ; 2421 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2426 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 2429 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 242C _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 242F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2432 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2435 _ 8B. 45, 10
        sub     eax, 26                                 ; 2438 _ 83. E8, 1A
        push    ecx                                     ; 243B _ 51
        push    edx                                     ; 243C _ 52
        push    eax                                     ; 243D _ 50
        push    0                                       ; 243E _ 6A, 00
        push    8                                       ; 2440 _ 6A, 08
        push    dword [ebp+0CH]                         ; 2442 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2445 _ FF. 75, 08
        call    boxfill                                 ; 2448 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 244D _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 2450 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2453 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 2456 _ 8B. 45, 10
        sub     eax, 24                                 ; 2459 _ 83. E8, 18
        push    edx                                     ; 245C _ 52
        push    59                                      ; 245D _ 6A, 3B
        push    eax                                     ; 245F _ 50
        push    3                                       ; 2460 _ 6A, 03
        push    7                                       ; 2462 _ 6A, 07
        push    dword [ebp+0CH]                         ; 2464 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2467 _ FF. 75, 08
        call    boxfill                                 ; 246A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 246F _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 2472 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2475 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2478 _ 8B. 45, 10
        sub     eax, 24                                 ; 247B _ 83. E8, 18
        push    edx                                     ; 247E _ 52
        push    2                                       ; 247F _ 6A, 02
        push    eax                                     ; 2481 _ 50
        push    2                                       ; 2482 _ 6A, 02
        push    7                                       ; 2484 _ 6A, 07
        push    dword [ebp+0CH]                         ; 2486 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2489 _ FF. 75, 08
        call    boxfill                                 ; 248C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2491 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 2494 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2497 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 249A _ 8B. 45, 10
        sub     eax, 4                                  ; 249D _ 83. E8, 04
        push    edx                                     ; 24A0 _ 52
        push    59                                      ; 24A1 _ 6A, 3B
        push    eax                                     ; 24A3 _ 50
        push    4                                       ; 24A4 _ 6A, 04
        push    15                                      ; 24A6 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 24A8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 24AB _ FF. 75, 08
        call    boxfill                                 ; 24AE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 24B3 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 24B6 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 24B9 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 24BC _ 8B. 45, 10
        sub     eax, 23                                 ; 24BF _ 83. E8, 17
        push    edx                                     ; 24C2 _ 52
        push    59                                      ; 24C3 _ 6A, 3B
        push    eax                                     ; 24C5 _ 50
        push    59                                      ; 24C6 _ 6A, 3B
        push    15                                      ; 24C8 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 24CA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 24CD _ FF. 75, 08
        call    boxfill                                 ; 24D0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 24D5 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 24D8 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 24DB _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 24DE _ 8B. 45, 10
        sub     eax, 3                                  ; 24E1 _ 83. E8, 03
        push    edx                                     ; 24E4 _ 52
        push    59                                      ; 24E5 _ 6A, 3B
        push    eax                                     ; 24E7 _ 50
        push    2                                       ; 24E8 _ 6A, 02
        push    0                                       ; 24EA _ 6A, 00
        push    dword [ebp+0CH]                         ; 24EC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 24EF _ FF. 75, 08
        call    boxfill                                 ; 24F2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 24F7 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 24FA _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 24FD _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2500 _ 8B. 45, 10
        sub     eax, 24                                 ; 2503 _ 83. E8, 18
        push    edx                                     ; 2506 _ 52
        push    60                                      ; 2507 _ 6A, 3C
        push    eax                                     ; 2509 _ 50
        push    60                                      ; 250A _ 6A, 3C
        push    0                                       ; 250C _ 6A, 00
        push    dword [ebp+0CH]                         ; 250E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2511 _ FF. 75, 08
        call    boxfill                                 ; 2514 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2519 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 251C _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 251F _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2522 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2525 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2528 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 252B _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 252E _ 8B. 45, 0C
        sub     eax, 47                                 ; 2531 _ 83. E8, 2F
        push    ebx                                     ; 2534 _ 53
        push    ecx                                     ; 2535 _ 51
        push    edx                                     ; 2536 _ 52
        push    eax                                     ; 2537 _ 50
        push    15                                      ; 2538 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 253A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 253D _ FF. 75, 08
        call    boxfill                                 ; 2540 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2545 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 2548 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 254B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 254E _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 2551 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 2554 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 2557 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 255A _ 8B. 45, 0C
        sub     eax, 47                                 ; 255D _ 83. E8, 2F
        push    ebx                                     ; 2560 _ 53
        push    ecx                                     ; 2561 _ 51
        push    edx                                     ; 2562 _ 52
        push    eax                                     ; 2563 _ 50
        push    15                                      ; 2564 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2566 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2569 _ FF. 75, 08
        call    boxfill                                 ; 256C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2571 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 2574 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2577 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 257A _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 257D _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2580 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2583 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 2586 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2589 _ 83. E8, 2F
        push    ebx                                     ; 258C _ 53
        push    ecx                                     ; 258D _ 51
        push    edx                                     ; 258E _ 52
        push    eax                                     ; 258F _ 50
        push    7                                       ; 2590 _ 6A, 07
        push    dword [ebp+0CH]                         ; 2592 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2595 _ FF. 75, 08
        call    boxfill                                 ; 2598 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 259D _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 25A0 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 25A3 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 25A6 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 25A9 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 25AC _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 25AF _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 25B2 _ 8B. 45, 0C
        sub     eax, 3                                  ; 25B5 _ 83. E8, 03
        push    ebx                                     ; 25B8 _ 53
        push    ecx                                     ; 25B9 _ 51
        push    edx                                     ; 25BA _ 52
        push    eax                                     ; 25BB _ 50
        push    7                                       ; 25BC _ 6A, 07
        push    dword [ebp+0CH]                         ; 25BE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 25C1 _ FF. 75, 08
        call    boxfill                                 ; 25C4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 25C9 _ 83. C4, 1C
        nop                                             ; 25CC _ 90
        mov     ebx, dword [ebp-4H]                     ; 25CD _ 8B. 5D, FC
        leave                                           ; 25D0 _ C9
        ret                                             ; 25D1 _ C3
; init_screen End of function

make_window8:; Function begin
        push    ebp                                     ; 25D2 _ 55
        mov     ebp, esp                                ; 25D3 _ 89. E5
        sub     esp, 16                                 ; 25D5 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 25D8 _ 8B. 45, 0C
        sub     eax, 1                                  ; 25DB _ 83. E8, 01
        push    0                                       ; 25DE _ 6A, 00
        push    eax                                     ; 25E0 _ 50
        push    0                                       ; 25E1 _ 6A, 00
        push    0                                       ; 25E3 _ 6A, 00
        push    8                                       ; 25E5 _ 6A, 08
        push    dword [ebp+0CH]                         ; 25E7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 25EA _ FF. 75, 08
        call    boxfill                                 ; 25ED _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 25F2 _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 25F5 _ 8B. 45, 0C
        sub     eax, 2                                  ; 25F8 _ 83. E8, 02
        push    1                                       ; 25FB _ 6A, 01
        push    eax                                     ; 25FD _ 50
        push    1                                       ; 25FE _ 6A, 01
        push    1                                       ; 2600 _ 6A, 01
        push    7                                       ; 2602 _ 6A, 07
        push    dword [ebp+0CH]                         ; 2604 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2607 _ FF. 75, 08
        call    boxfill                                 ; 260A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 260F _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 2612 _ 8B. 45, 10
        sub     eax, 1                                  ; 2615 _ 83. E8, 01
        push    eax                                     ; 2618 _ 50
        push    0                                       ; 2619 _ 6A, 00
        push    0                                       ; 261B _ 6A, 00
        push    0                                       ; 261D _ 6A, 00
        push    8                                       ; 261F _ 6A, 08
        push    dword [ebp+0CH]                         ; 2621 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2624 _ FF. 75, 08
        call    boxfill                                 ; 2627 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 262C _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 262F _ 8B. 45, 10
        sub     eax, 1                                  ; 2632 _ 83. E8, 01
        push    eax                                     ; 2635 _ 50
        push    1                                       ; 2636 _ 6A, 01
        push    1                                       ; 2638 _ 6A, 01
        push    1                                       ; 263A _ 6A, 01
        push    7                                       ; 263C _ 6A, 07
        push    dword [ebp+0CH]                         ; 263E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2641 _ FF. 75, 08
        call    boxfill                                 ; 2644 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2649 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 264C _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 264F _ 8D. 48, FE
        mov     eax, dword [ebp+0CH]                    ; 2652 _ 8B. 45, 0C
        lea     edx, [eax-2H]                           ; 2655 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2658 _ 8B. 45, 0C
        sub     eax, 2                                  ; 265B _ 83. E8, 02
        push    ecx                                     ; 265E _ 51
        push    edx                                     ; 265F _ 52
        push    1                                       ; 2660 _ 6A, 01
        push    eax                                     ; 2662 _ 50
        push    15                                      ; 2663 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2665 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2668 _ FF. 75, 08
        call    boxfill                                 ; 266B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2670 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 2673 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2676 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2679 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 267C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 267F _ 8B. 45, 0C
        sub     eax, 1                                  ; 2682 _ 83. E8, 01
        push    ecx                                     ; 2685 _ 51
        push    edx                                     ; 2686 _ 52
        push    0                                       ; 2687 _ 6A, 00
        push    eax                                     ; 2689 _ 50
        push    0                                       ; 268A _ 6A, 00
        push    dword [ebp+0CH]                         ; 268C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 268F _ FF. 75, 08
        call    boxfill                                 ; 2692 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2697 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 269A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 269D _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 26A0 _ 8B. 45, 0C
        sub     eax, 3                                  ; 26A3 _ 83. E8, 03
        push    edx                                     ; 26A6 _ 52
        push    eax                                     ; 26A7 _ 50
        push    2                                       ; 26A8 _ 6A, 02
        push    2                                       ; 26AA _ 6A, 02
        push    8                                       ; 26AC _ 6A, 08
        push    dword [ebp+0CH]                         ; 26AE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 26B1 _ FF. 75, 08
        call    boxfill                                 ; 26B4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 26B9 _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 26BC _ 8B. 45, 0C
        sub     eax, 4                                  ; 26BF _ 83. E8, 04
        push    20                                      ; 26C2 _ 6A, 14
        push    eax                                     ; 26C4 _ 50
        push    3                                       ; 26C5 _ 6A, 03
        push    3                                       ; 26C7 _ 6A, 03
        push    12                                      ; 26C9 _ 6A, 0C
        push    dword [ebp+0CH]                         ; 26CB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 26CE _ FF. 75, 08
        call    boxfill                                 ; 26D1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 26D6 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 26D9 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 26DC _ 8D. 48, FE
        mov     eax, dword [ebp+0CH]                    ; 26DF _ 8B. 45, 0C
        lea     edx, [eax-2H]                           ; 26E2 _ 8D. 50, FE
        mov     eax, dword [ebp+10H]                    ; 26E5 _ 8B. 45, 10
        sub     eax, 2                                  ; 26E8 _ 83. E8, 02
        push    ecx                                     ; 26EB _ 51
        push    edx                                     ; 26EC _ 52
        push    eax                                     ; 26ED _ 50
        push    1                                       ; 26EE _ 6A, 01
        push    15                                      ; 26F0 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 26F2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 26F5 _ FF. 75, 08
        call    boxfill                                 ; 26F8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 26FD _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 2700 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2703 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2706 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2709 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 270C _ 8B. 45, 10
        sub     eax, 1                                  ; 270F _ 83. E8, 01
        push    ecx                                     ; 2712 _ 51
        push    edx                                     ; 2713 _ 52
        push    eax                                     ; 2714 _ 50
        push    0                                       ; 2715 _ 6A, 00
        push    0                                       ; 2717 _ 6A, 00
        push    dword [ebp+0CH]                         ; 2719 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 271C _ FF. 75, 08
        call    boxfill                                 ; 271F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2724 _ 83. C4, 1C
        push    dword [ebp+14H]                         ; 2727 _ FF. 75, 14
        push    7                                       ; 272A _ 6A, 07
        push    4                                       ; 272C _ 6A, 04
        push    24                                      ; 272E _ 6A, 18
        push    dword [ebp+0CH]                         ; 2730 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2733 _ FF. 75, 08
        call    showString                              ; 2736 _ E8, FFFFFFFC(rel)
        add     esp, 24                                 ; 273B _ 83. C4, 18
        mov     dword [ebp-4H], 0                       ; 273E _ C7. 45, FC, 00000000
        jmp     ?_159                                   ; 2745 _ EB, 7B

?_152:  mov     dword [ebp-8H], 0                       ; 2747 _ C7. 45, F8, 00000000
        jmp     ?_158                                   ; 274E _ EB, 68

?_153:  mov     eax, dword [ebp-4H]                     ; 2750 _ 8B. 45, FC
        shl     eax, 4                                  ; 2753 _ C1. E0, 04
        mov     edx, eax                                ; 2756 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2758 _ 8B. 45, F8
        add     eax, edx                                ; 275B _ 01. D0
        add     eax, closebtn.1667                      ; 275D _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 2762 _ 0F B6. 00
        mov     byte [ebp-9H], al                       ; 2765 _ 88. 45, F7
        cmp     byte [ebp-9H], 64                       ; 2768 _ 80. 7D, F7, 40
        jnz     ?_154                                   ; 276C _ 75, 06
        mov     byte [ebp-9H], 0                        ; 276E _ C6. 45, F7, 00
        jmp     ?_157                                   ; 2772 _ EB, 1C

?_154:  cmp     byte [ebp-9H], 36                       ; 2774 _ 80. 7D, F7, 24
        jnz     ?_155                                   ; 2778 _ 75, 06
        mov     byte [ebp-9H], 15                       ; 277A _ C6. 45, F7, 0F
        jmp     ?_157                                   ; 277E _ EB, 10

?_155:  cmp     byte [ebp-9H], 81                       ; 2780 _ 80. 7D, F7, 51
        jnz     ?_156                                   ; 2784 _ 75, 06
        mov     byte [ebp-9H], 8                        ; 2786 _ C6. 45, F7, 08
        jmp     ?_157                                   ; 278A _ EB, 04

?_156:  mov     byte [ebp-9H], 7                        ; 278C _ C6. 45, F7, 07
?_157:  mov     eax, dword [ebp-4H]                     ; 2790 _ 8B. 45, FC
        add     eax, 5                                  ; 2793 _ 83. C0, 05
        imul    eax, dword [ebp+0CH]                    ; 2796 _ 0F AF. 45, 0C
        mov     edx, dword [ebp+0CH]                    ; 279A _ 8B. 55, 0C
        lea     ecx, [edx-15H]                          ; 279D _ 8D. 4A, EB
        mov     edx, dword [ebp-8H]                     ; 27A0 _ 8B. 55, F8
        add     edx, ecx                                ; 27A3 _ 01. CA
        add     eax, edx                                ; 27A5 _ 01. D0
        mov     edx, eax                                ; 27A7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 27A9 _ 8B. 45, 08
        add     edx, eax                                ; 27AC _ 01. C2
        movzx   eax, byte [ebp-9H]                      ; 27AE _ 0F B6. 45, F7
        mov     byte [edx], al                          ; 27B2 _ 88. 02
        add     dword [ebp-8H], 1                       ; 27B4 _ 83. 45, F8, 01
?_158:  cmp     dword [ebp-8H], 15                      ; 27B8 _ 83. 7D, F8, 0F
        jle     ?_153                                   ; 27BC _ 7E, 92
        add     dword [ebp-4H], 1                       ; 27BE _ 83. 45, FC, 01
?_159:  cmp     dword [ebp-4H], 13                      ; 27C2 _ 83. 7D, FC, 0D
        jle     ?_152                                   ; 27C6 _ 0F 8E, FFFFFF7B
        nop                                             ; 27CC _ 90
        leave                                           ; 27CD _ C9
        ret                                             ; 27CE _ C3
; make_window8 End of function

init_mouse:; Function begin
        push    ebp                                     ; 27CF _ 55
        mov     ebp, esp                                ; 27D0 _ 89. E5
        sub     esp, 20                                 ; 27D2 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 27D5 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 27D8 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 27DB _ C7. 45, FC, 00000000
        jmp     ?_166                                   ; 27E2 _ E9, 000000B1

?_160:  mov     dword [ebp-8H], 0                       ; 27E7 _ C7. 45, F8, 00000000
        jmp     ?_165                                   ; 27EE _ E9, 00000097

?_161:  mov     eax, dword [ebp-4H]                     ; 27F3 _ 8B. 45, FC
        shl     eax, 4                                  ; 27F6 _ C1. E0, 04
        mov     edx, eax                                ; 27F9 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 27FB _ 8B. 45, F8
        add     eax, edx                                ; 27FE _ 01. D0
        add     eax, cursor.1681                        ; 2800 _ 05, 00000140(d)
        movzx   eax, byte [eax]                         ; 2805 _ 0F B6. 00
        cmp     al, 42                                  ; 2808 _ 3C, 2A
        jnz     ?_162                                   ; 280A _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 280C _ 8B. 45, FC
        shl     eax, 4                                  ; 280F _ C1. E0, 04
        mov     edx, eax                                ; 2812 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2814 _ 8B. 45, F8
        add     eax, edx                                ; 2817 _ 01. D0
        mov     edx, eax                                ; 2819 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 281B _ 8B. 45, 08
        add     eax, edx                                ; 281E _ 01. D0
        mov     byte [eax], 0                           ; 2820 _ C6. 00, 00
?_162:  mov     eax, dword [ebp-4H]                     ; 2823 _ 8B. 45, FC
        shl     eax, 4                                  ; 2826 _ C1. E0, 04
        mov     edx, eax                                ; 2829 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 282B _ 8B. 45, F8
        add     eax, edx                                ; 282E _ 01. D0
        add     eax, cursor.1681                        ; 2830 _ 05, 00000140(d)
        movzx   eax, byte [eax]                         ; 2835 _ 0F B6. 00
        cmp     al, 79                                  ; 2838 _ 3C, 4F
        jnz     ?_163                                   ; 283A _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 283C _ 8B. 45, FC
        shl     eax, 4                                  ; 283F _ C1. E0, 04
        mov     edx, eax                                ; 2842 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2844 _ 8B. 45, F8
        add     eax, edx                                ; 2847 _ 01. D0
        mov     edx, eax                                ; 2849 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 284B _ 8B. 45, 08
        add     eax, edx                                ; 284E _ 01. D0
        mov     byte [eax], 7                           ; 2850 _ C6. 00, 07
?_163:  mov     eax, dword [ebp-4H]                     ; 2853 _ 8B. 45, FC
        shl     eax, 4                                  ; 2856 _ C1. E0, 04
        mov     edx, eax                                ; 2859 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 285B _ 8B. 45, F8
        add     eax, edx                                ; 285E _ 01. D0
        add     eax, cursor.1681                        ; 2860 _ 05, 00000140(d)
        movzx   eax, byte [eax]                         ; 2865 _ 0F B6. 00
        cmp     al, 46                                  ; 2868 _ 3C, 2E
        jnz     ?_164                                   ; 286A _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 286C _ 8B. 45, FC
        shl     eax, 4                                  ; 286F _ C1. E0, 04
        mov     edx, eax                                ; 2872 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2874 _ 8B. 45, F8
        add     eax, edx                                ; 2877 _ 01. D0
        mov     edx, eax                                ; 2879 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 287B _ 8B. 45, 08
        add     edx, eax                                ; 287E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2880 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2884 _ 88. 02
?_164:  add     dword [ebp-8H], 1                       ; 2886 _ 83. 45, F8, 01
?_165:  cmp     dword [ebp-8H], 15                      ; 288A _ 83. 7D, F8, 0F
        jle     ?_161                                   ; 288E _ 0F 8E, FFFFFF5F
        add     dword [ebp-4H], 1                       ; 2894 _ 83. 45, FC, 01
?_166:  cmp     dword [ebp-4H], 15                      ; 2898 _ 83. 7D, FC, 0F
        jle     ?_160                                   ; 289C _ 0F 8E, FFFFFF45
        nop                                             ; 28A2 _ 90
        leave                                           ; 28A3 _ C9
        ret                                             ; 28A4 _ C3
; init_mouse End of function

strcat: ; Function begin
        push    ebp                                     ; 28A5 _ 55
        mov     ebp, esp                                ; 28A6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 28A8 _ 8B. 45, 08
        pop     ebp                                     ; 28AB _ 5D
        ret                                             ; 28AC _ C3
; strcat End of function

number: ; Function begin
        push    ebp                                     ; 28AD _ 55
        mov     ebp, esp                                ; 28AE _ 89. E5
        sub     esp, 16                                 ; 28B0 _ 83. EC, 10
        mov     dword [ebp-8H], ?_188                   ; 28B3 _ C7. 45, F8, 00000090(d)
        mov     dword [ebp-0CH], 15                     ; 28BA _ C7. 45, F4, 0000000F
        mov     dword [ebp-4H], 8                       ; 28C1 _ C7. 45, FC, 00000008
?_167:  sub     dword [ebp-4H], 1                       ; 28C8 _ 83. 6D, FC, 01
        mov     edx, dword [ebp-4H]                     ; 28CC _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 28CF _ 8B. 45, 08
        add     edx, eax                                ; 28D2 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 28D4 _ 8B. 45, 0C
        and     eax, dword [ebp-0CH]                    ; 28D7 _ 23. 45, F4
        mov     ecx, eax                                ; 28DA _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 28DC _ 8B. 45, F8
        add     eax, ecx                                ; 28DF _ 01. C8
        movzx   eax, byte [eax]                         ; 28E1 _ 0F B6. 00
        mov     byte [edx], al                          ; 28E4 _ 88. 02
        sar     dword [ebp+0CH], 4                      ; 28E6 _ C1. 7D, 0C, 04
        cmp     dword [ebp-4H], 0                       ; 28EA _ 83. 7D, FC, 00
        jnz     ?_167                                   ; 28EE _ 75, D8
        add     dword [ebp+8H], 8                       ; 28F0 _ 83. 45, 08, 08
        mov     eax, dword [ebp+8H]                     ; 28F4 _ 8B. 45, 08
        leave                                           ; 28F7 _ C9
        ret                                             ; 28F8 _ C3
; number End of function

vsprintf:; Function begin
        push    ebp                                     ; 28F9 _ 55
        mov     ebp, esp                                ; 28FA _ 89. E5
        sub     esp, 16                                 ; 28FC _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 28FF _ 8B. 45, 08
        mov     dword [ebp-4H], eax                     ; 2902 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2905 _ 8B. 45, 08
        mov     dword [ebp-4H], eax                     ; 2908 _ 89. 45, FC
        jmp     ?_171                                   ; 290B _ EB, 4F

?_168:  mov     eax, dword [ebp+0CH]                    ; 290D _ 8B. 45, 0C
        movzx   eax, byte [eax]                         ; 2910 _ 0F B6. 00
        cmp     al, 37                                  ; 2913 _ 3C, 25
        jz      ?_169                                   ; 2915 _ 74, 13
        mov     eax, dword [ebp-4H]                     ; 2917 _ 8B. 45, FC
        lea     edx, [eax+1H]                           ; 291A _ 8D. 50, 01
        mov     dword [ebp-4H], edx                     ; 291D _ 89. 55, FC
        mov     edx, dword [ebp+0CH]                    ; 2920 _ 8B. 55, 0C
        movzx   edx, byte [edx]                         ; 2923 _ 0F B6. 12
        mov     byte [eax], dl                          ; 2926 _ 88. 10
        jmp     ?_170                                   ; 2928 _ EB, 2E

?_169:  add     dword [ebp+0CH], 1                      ; 292A _ 83. 45, 0C, 01
        mov     eax, dword [ebp+0CH]                    ; 292E _ 8B. 45, 0C
        movzx   eax, byte [eax]                         ; 2931 _ 0F B6. 00
        movsx   eax, al                                 ; 2934 _ 0F BE. C0
        cmp     eax, 120                                ; 2937 _ 83. F8, 78
        jnz     ?_170                                   ; 293A _ 75, 1C
        add     dword [ebp+10H], 4                      ; 293C _ 83. 45, 10, 04
        mov     eax, dword [ebp+10H]                    ; 2940 _ 8B. 45, 10
        sub     eax, 4                                  ; 2943 _ 83. E8, 04
        mov     eax, dword [eax]                        ; 2946 _ 8B. 00
        push    eax                                     ; 2948 _ 50
        push    dword [ebp-4H]                          ; 2949 _ FF. 75, FC
        call    number                                  ; 294C _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 2951 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 2954 _ 89. 45, FC
        nop                                             ; 2957 _ 90
?_170:  add     dword [ebp+0CH], 1                      ; 2958 _ 83. 45, 0C, 01
?_171:  mov     eax, dword [ebp+0CH]                    ; 295C _ 8B. 45, 0C
        movzx   eax, byte [eax]                         ; 295F _ 0F B6. 00
        test    al, al                                  ; 2962 _ 84. C0
        jnz     ?_168                                   ; 2964 _ 75, A7
        mov     eax, dword [ebp-4H]                     ; 2966 _ 8B. 45, FC
        mov     byte [eax], 0                           ; 2969 _ C6. 00, 00
        mov     edx, dword [ebp-4H]                     ; 296C _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 296F _ 8B. 45, 08
        sub     edx, eax                                ; 2972 _ 29. C2
        mov     eax, edx                                ; 2974 _ 89. D0
        leave                                           ; 2976 _ C9
        ret                                             ; 2977 _ C3
; vsprintf End of function

sprintf:; Function begin
        push    ebp                                     ; 2978 _ 55
        mov     ebp, esp                                ; 2979 _ 89. E5
        sub     esp, 16                                 ; 297B _ 83. EC, 10
        lea     eax, [ebp+0CH]                          ; 297E _ 8D. 45, 0C
        add     eax, 4                                  ; 2981 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2984 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2987 _ 8B. 45, 0C
        push    dword [ebp-4H]                          ; 298A _ FF. 75, FC
        push    eax                                     ; 298D _ 50
        push    dword [ebp+8H]                          ; 298E _ FF. 75, 08
        call    vsprintf                                ; 2991 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 2996 _ 83. C4, 0C
        mov     dword [ebp-4H], 0                       ; 2999 _ C7. 45, FC, 00000000
        nop                                             ; 29A0 _ 90
        leave                                           ; 29A1 _ C9
        ret                                             ; 29A2 _ C3
; sprintf End of function



?_172:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_173:                                                  ; byte
        db 57H, 65H, 6CH, 63H, 6FH, 6DH, 65H, 20H       ; 0007 _ Welcome 
        db 74H, 6FH, 00H                                ; 000F _ to.

?_174:                                                  ; byte
        db 4DH, 2DH, 4FH, 53H, 21H, 00H                 ; 0012 _ M-OS!.

?_175:                                                  ; byte
        db 25H, 78H, 00H                                ; 0018 _ %x.

?_176:                                                  ; byte
        db 25H, 78H, 5BH, 73H, 65H, 63H, 5DH, 00H       ; 001B _ %x[sec].

?_177:                                                  ; byte
        db 54H, 6FH, 74H, 61H, 6CH, 4DH, 65H, 6DH       ; 0023 _ TotalMem
        db 3AH, 00H                                     ; 002B _ :.

?_178:                                                  ; byte
        db 4DH, 20H, 20H, 20H, 00H                      ; 002D _ M   .

?_179:                                                  ; byte
        db 4BH, 0AH, 00H                                ; 0032 _ K..

?_180:                                                  ; byte
        db 41H, 66H, 74H, 65H, 72H, 20H, 00H            ; 0035 _ After .

?_181:                                                  ; byte
        db 46H, 66H, 74H, 65H, 72H, 20H, 00H            ; 003C _ Ffter .

?_182:                                                  ; byte
        db 30H, 31H, 32H, 33H, 34H, 35H, 36H, 37H       ; 0043 _ 01234567
        db 38H, 39H, 41H, 42H, 43H, 44H, 45H, 46H       ; 004B _ 89ABCDEF
        db 00H                                          ; 0053 _ .

?_183:                                                  ; byte
        db 62H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0054 _ baseAddr
        db 4CH, 6FH, 77H, 3AH, 00H                      ; 005C _ Low:.

?_184:                                                  ; byte
        db 0AH, 62H, 61H, 73H, 65H, 41H, 64H, 64H       ; 0061 _ .baseAdd
        db 72H, 48H, 69H, 67H, 68H, 3AH, 00H            ; 0069 _ rHigh:.

?_185:                                                  ; byte
        db 0AH, 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH       ; 0070 _ .lengthL
        db 6FH, 77H, 3AH, 00H                           ; 0078 _ ow:.

?_186:                                                  ; byte
        db 0AH, 6CH, 65H, 6EH, 67H, 74H, 68H, 48H       ; 007C _ .lengthH
        db 69H, 67H, 68H, 3AH, 00H                      ; 0084 _ igh:.

?_187:                                                  ; byte
        db 0AH, 74H, 79H, 70H, 65H, 3AH, 00H            ; 0089 _ .type:.

?_188:                                                  ; byte
        db 30H, 31H, 32H, 33H, 34H, 35H, 36H, 37H       ; 0090 _ 01234567
        db 38H, 39H, 41H, 42H, 43H, 44H, 45H, 46H       ; 0098 _ 89ABCDEF
        db 00H                                          ; 00A0 _ .



vram:                                                   ; dword
        dd 000A0000H                                    ; 0000 _ 655360 

xsize:  dd 00000140H                                    ; 0004 _ 320 

ysize:  dd 000000C8H                                    ; 0008 _ 200 

memman: dd 00100000H, 00000000H                         ; 000C _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0014 _ 0 0 
        dd 00000000H                                    ; 001C _ 0 

table_rgb.1796:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

closebtn.1667:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0060 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0068 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0070 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0078 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0080 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0088 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0090 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0098 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 00A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 00A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 00B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 00B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 00C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 00C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 00D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 00D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 00E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 00E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 00F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 00F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0100 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0108 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0110 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0118 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0120 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0128 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0130 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0138 _ @@@@@@@@

cursor.1681:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0140 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0148 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0150 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0158 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0160 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0168 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0170 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0178 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0180 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0188 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0190 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0198 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01A0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01B0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 01C0 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 01D0 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01D8 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01E0 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 01E8 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F0 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 01F8 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0200 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0208 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0210 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0218 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0220 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0228 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0230 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0238 _ .....***

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0240 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0248 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0250 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 41H, 53H       ; 0258 _ OP@[..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0260 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0268 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 2AH       ; 0270 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0278 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0280 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0288 _ 89-456+1
        db 32H, 33H, 30H, 2EH                           ; 0290 _ 230.



keyfifo:                                                ; byte
        resb    24                                      ; 0000

mousefifo:                                              ; byte
        resb    24                                      ; 0018

printd_x: resd  1                                       ; 0030

printd_y: resd  1                                       ; 0034

timerbuf.1715:                                          ; dword
        resd    1                                       ; 0038

timerbuf2.1716:                                         ; dword
        resd    1                                       ; 003C

timerbuf3.1717:                                         ; dword
        resd    8                                       ; 0040

keybuf.1709:                                            ; yword
        resb    32                                      ; 0060

mousebuf.1710:                                          ; byte
        resb    128                                     ; 0080

buf_mouse.1729:                                         ; byte
        resb    256                                     ; 0100

x.1735: resd    1                                       ; 0200

y.1736: resd    7                                       ; 0204

timerctl:                                               ; byte
        resd    1                                       ; 0220

?_189:  resd    1                                       ; 0224

?_190:  resd    1                                       ; 0228

?_191:  resd    1                                       ; 022C

?_192:                                                  ; byte
        resb    1276                                    ; 0230


