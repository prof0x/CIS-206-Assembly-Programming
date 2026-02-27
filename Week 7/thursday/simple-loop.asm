global _start

section .text
_start:

    mov rcx , 10

for_loop:
    
    loop for_loop

    ; sys_exit(0)
    mov rax, 60
    xor rdi, rdi
    syscall