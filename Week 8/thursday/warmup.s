; WARMUP 3/5:
; Write an assembly program that adds two numbers by calling a function named SUM
global _start

section .data
newline db 10       ; store the ascii code for newline in memory
firstNum dq 3       ; initialize variable firstNum to 3
secondNum dq 5       ; initialize variable firstNum to 5

section .bss
result resb 1 ; reserve 1 byte to store our result as ASCII

section .text
_start:
    ; - Use the registers RDI and RSI to pass arguments to the function
    ; passing by value
    mov rdi, [firstNum]     ; access the memory at firstNum and copy the value stored to rdi (3)
    mov rsi, [secondNum]    ; access the memory at secondNum and copy the value stored to rsi (5)
    
    ; passing by reference
    mov rdi, firstNum     ; address of firstNum is stored in rdi
    mov rsi, secondNum    ; address of secondNum is stored in rsi
    
    
    call set_to_ten                ; the return value should be stored in RAX when your function returns

    ; - In the Calling (Caller) function, save the return value as ASCII in a 1-byte memory buffer named result
    add rax, '0'        ; converts your result to ASCII (assume single digit result only)
    mov [result], al    ; copy ASCII result to memory (single char = 1 byte)

    ; - Print your result to standard output
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 1 ; # of bytes to print
    syscall
   
    ; - Print your result to standard output
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1 ; # of bytes to print
    syscall

    ; return 0
    mov rax, 60
    xor rdi, rdi
    syscall

; - Use the registers RAX and RBX to perform the addition
set_to_ten:
                    ; prologue
    push rbp        ; push the caller's frame pointer onto the stack
    mov rbp, rsp   ; RSP points to the top of the stack, copy that value to rbp
    push rbx        ; save RBX in memory (on the stack)

                    ; passing by value (read-only)
                    ; if you attempt to change the values you'll get unexpected behavior or error
    mov [rdi], 10   ; not possible rdi = 3, attempts to access the memory address 3 using []
    mov rsi, 10     ; overwrites the value in rsi with 10

                    ;passing by reference (read and write)
    mov [rdi], 10   ; rdi holds the memory address of firstNum, access it with [] and copy 10 to location
    mov [rsi], 10   ; rsi holds the memory address of secondNum, access it with [] and copy 10 to location

                    ; epilogue
    pop rbx         ; restore RBX from memory (remove from the stack)
    pop rbp         ; restore the base pointer of the calling function before we return control to it
    ret             ; return control (execution) to the calling function 
                    ; the return value is assumed to be in RAX

