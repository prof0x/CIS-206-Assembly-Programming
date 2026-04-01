global _start

section .data
    src db "Hello World, the ceremonial phrase Gerald the Mildly Prepared declared before doing anything heroic.", 10, 0
    src_length equ $-src
    dst db "Hello World, the ceremonial phrase Gerald the Mildly Prepared declared before doing anything heroic.", 10, 0
    dst_length equ $-dst
    msg_e db "Strings are equal.", 10, 0
    msg_e_length equ $-msg_e
    msg_a db "Source string is greater.", 10, 0
    msg_a_length equ $-msg_a
    msg_b db "Destination string is greater.", 10, 0
    msg_b_length equ $-msg_b
    buffer_output db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    buffer_length equ $-buffer_output

section .text
_start:                 ; String Compare Function (strcmp)       

    lea rsi, [src]      ; loads the address of src into rsi
    lea rdi, [dst]      ; loads the address of dst into rdi
    
    mov rcx, src_length     ; set counter for length bytes
    cld                 ; clear the direction flag copy our string from left to right
    repe cmpsb          ; repeat cmpsb until RCX == 0 (119 - 87) -/-> RAX but will update flags

    je strings_equal    ; ZF=1 means the strings are equal
    ja src_greater      ; SF=0 means the src string is "greater" src - dst > 0
    jb dst_greater      ; SF=1 src - dst < 0

    strings_equal:
        lea rsi, [msg_e]            ; loads the address of msg_e into rsi
        mov rcx, msg_e_length       ; set counter for length bytes
        jmp copy
    src_greater:
        lea rsi, [msg_a]            ; loads the address of msg_a into rsi
        mov rcx, msg_a_length       ; set counter for length bytes
        jmp copy
    dst_greater:
        lea rsi, [msg_b]            ; loads the address of msg_b into rsi
        mov rcx, msg_b_length       ; set counter for length bytes
        jmp copy


    copy:
        lea rdi, [buffer_output]      ; loads the address of dst into rdi
        cld                           ; clear the direction flag copy our string from left to right
        rep movsb                     ; repeat movsb untill RCX == 0

                                      ; print out our dst string
    mov rax, 1                        ; sys_write
    mov rdi, 1                        ; stdout
    mov rsi, buffer_output            ; data to output
    mov rdx, buffer_length            ; length of data to output
    syscall


                        ; return 0
    mov rax, 60         ; sys_exit
    mov rdi, 0
    syscall