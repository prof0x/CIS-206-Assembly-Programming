global _start

section .text
_start:
    mov eax, 5      ; +5

    not eax         ; inverts the bits in eax
    add eax, 1      ; what is the value in eax?

    mov rax, 60
    xor rdi, rdi
    syscall