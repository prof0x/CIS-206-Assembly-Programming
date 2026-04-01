global _start

section .data
newline db 10

section .bss
result resb 1

section .text

_start:

    ; argv layout:
    ; [rsp]     = argc
    ; [rsp+8]   = argv[0]
    ; [rsp+16]  = argv[1]
    ; [rsp+24]  = argv[2]

    mov rbx, rsp

    ; load argv[1]
    mov rax, [rbx + 16]     ; pointer to first argument string
    movzx rdi, byte [rax]   ; load first char
    sub rdi, '0'            ; convert ASCII -> integer

    ; load argv[2]
    mov rax, [rbx + 24]     ; pointer to second argument string
    movzx rsi, byte [rax]
    sub rsi, '0'

    ; call SUM
    call SUM

    ; convert result to ASCII
    add rax, '0'
    mov [result], al

    ; print result
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 1
    syscall

    ; print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall


SUM:
    push rbp
    mov rbp, rsp
    push rbx

    mov rax, rdi
    mov rbx, rsi
    add rax, rbx

    pop rbx
    pop rbp
    ret