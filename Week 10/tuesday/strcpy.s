global _start

section .data
    src db "Hello world, the ceremonial phrase Gerald the Mildly Prepared declared before doing anything heroic.", 10, 0
    length equ $-src
    dst db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

section .text
_start:                 ; String Copy Function (strcpy)

    lea rsi, [src]      ; loads the address of src into rsi
    lea rdi, [dst]      ; loads the address of dst into rdi
    
    mov rcx, length     ; set counter for length bytes
    cld                 ; clear the direction flag copy our string from left to right
    rep movsb           ; repeat movsb untill RCX == 0

                        ; print out our dst string
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, dst        ; data to output
    mov rdx, length          ; length of data to output
    syscall

                        ; return 0
    mov rax, 60         ; sys_exit
    mov rdi, 0
    syscall