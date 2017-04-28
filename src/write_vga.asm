cmian:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-0CH], 0                      ; 0006 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 655360                 ; 000D _ C7. 45, F0, 000A0000
        jmp     ?_002                                   ; 0014 _ EB, 17

?_001:  mov     eax, dword [ebp-10H]                    ; 0016 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 0019 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 001C _ 8B. 45, F0
        and     eax, 0FH                                ; 001F _ 83. E0, 0F
        mov     edx, eax                                ; 0022 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0024 _ 8B. 45, F4
        mov     byte [eax], dl                          ; 0027 _ 88. 10
        add     dword [ebp-10H], 1                      ; 0029 _ 83. 45, F0, 01
?_002:  cmp     dword [ebp-10H], 720895                 ; 002D _ 81. 7D, F0, 000AFFFF
        jle     ?_001                                   ; 0034 _ 7E, E0
?_003:  call    io_hlt                                  ; 0036 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 003B _ EB, F9


