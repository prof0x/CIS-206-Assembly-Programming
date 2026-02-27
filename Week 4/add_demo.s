; Veysel Cetiner
; CIS 206 Assembly Programming
; demo of adding two numbers

global _start

section .data
num1: dq 4
num2: dq 2
result: db 0, 10
length: EQU $ - result ; const length of bytes of result (1 byte)

section .text
_start:
    mov rax, [num1]
    add rax, [num2]
    add rax, '0' ; '0' has the value 48 + 6 = 54 which is '6'
    mov [result], al

    mov rax, 1 ; "write"
    mov rdi, 1 ; "standard output"
    mov rsi, result ; memory address to write from
    mov rdx, length ; number of bytes to write
    syscall

    mov rax, 60 ; return
    mov rdi, 0  ; 0
    syscall