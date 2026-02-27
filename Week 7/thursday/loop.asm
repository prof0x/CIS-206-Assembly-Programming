global _start

section .bss
    buffer resb 4          ; enough for "10\n\0"
    counter resb 1

section .text
_start:

    mov rcx , 10

for_loop:
    mov [counter], rcx

    ; Convert rcx to ASCII
    mov rax, rcx
    mov rbx, 10
    lea rsi, [buffer + 3]  ; write digits from end
    mov byte [rsi], 10     ; newline
    dec rsi

convert:
    xor rdx, rdx
    div rbx                ; rax = rax / 10, rdx = remainder
    add dl, '0'
    mov [rsi], dl
    dec rsi
    test rax, rax
    jnz convert

    inc rsi                ; adjust pointer to first digit

    ; calculate length
    mov rdx, buffer + 4
    sub rdx, rsi

    ; sys_write
    mov rax, 1
    mov rdi, 1
    syscall

    mov rcx, [counter]
    loop for_loop

    ; sys_exit(0)
    mov rax, 60
    xor rdi, rdi
    syscall