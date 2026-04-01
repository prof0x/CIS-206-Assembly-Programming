global _start

section .data
result dq 0         ; reserve 8 bytes (64 bits) and initialize to 0

section .text
_start:

    mov rdi, 3          ; copy the immediate value 3 into RDI
    mov rsi, 5          ; add the immediate value 5 to RSI
    call add            ; call the "add" function
    
    mov rbx, rax        ; copy the result in RAX to RBX
                        ; RBX holds the value 8

    mov rdi, 7          ; copy the immediate value 7 into RDI
    mov rsi, 2          ; add the immediate value 2 to RSI
    call add            ; call the "add" function
                        ; RAX holds the value 9

    add rax, rbx        ; add RBX to RAX
                        ; RAX holds the value 17

    mov [result], rax   ; copy value in RAX to memory at location [result]

    mov rax, 60         ; syscall number for "exit"
    xor rdi, rdi        ; this sets rdi to 0
    syscall             ; call the kernel

add:
    mov rax, rdi        ; function body
    add rax, rsi
    ret                 ; the return value will always be held in RAX