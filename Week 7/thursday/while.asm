global _start

section .data
prompt_msg db "Enter your name: "
prompt_len equ $ - prompt_msg

hello_msg db "Hello, "
hello_len equ $ - hello_msg

error_msg db "Name cannot be empty.", 10, 10
error_len equ $ - error_msg

newline db 10

section .bss
buffer  resb 100

section .text
_start:

input_while_loop:
    ; --- output prompt ---
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_msg
    mov rdx, prompt_len
    syscall

    ; --- read input ---
    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, 100
    syscall

    ; --- check length of input ---
    cmp rax, 1 ; one byte would mean only a newline was input
    jne valid_input ;

    ; --- print error message ---
    mov rax, 1
    mov rdi, 1
    mov rsi, error_msg
    mov rdx, error_len
    syscall 

    jmp input_while_loop

valid_input:

    ; --- output Hello,  ---
    mov rax, 1
    mov rdi, 1
    mov rsi, hello_msg
    mov rdx, hello_len
    syscall
   
    ; --- output prompt ---
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 100
    syscall

return:
    mov rax, 60
    xor rdi, rdi
    syscall