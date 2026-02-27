global _start

section .text
_start:
    top: mov al, 3
         add al, 5
         jmp bottom
    middle:
         add al, 32
    bottom:
         add al, 2

    ; properly end execution for 64-bit program
	mov rax, 60		
    xor rdi, rdi			
	syscall						