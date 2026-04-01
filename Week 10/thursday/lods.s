global _start

section .data
    src db "hello world the ceremonial phraze gerald the mildly prepared declared before doing anything heroic", 10, 0
    length equ $-src
    shift db 1

section .text
_start:
    lea rsi, [src]  
    lea rdi, [src]  
    mov rcx, length-2       ; stop short of the newline
    cld

encryption_loop:
    lodsb                   ; loads one character at a time into RAX
    
    add al, [shift]         ; encrypt a single character by shifting it to the left 1 position in the alphabet

    cmp al, 'z'             ; compare the character loaded in RAX to the literal 'z'
    jle overwrite           ; if its less than or equal to 'z' then jump to storing the new value
                            ; if it's greater than 'z' we've gone our of bounds and need to "wrap around" back to 'a'
    sub al, 26              ; 26 is the difference in ASCII values between 'a' and 'z'
    
overwrite:
    stosb                   ; store the capitalized letter in AL back to the src string (update in place)
    
    push rax
    push rdi
    push rsi
    push rcx

    mov rax, 1              ; sys_write
    mov rdi, 1              ; stdout
    mov rsi, src            ; data to output
    mov rdx, length         ; length of data to output
    syscall

    pop rcx
    pop rsi
    pop rdi
    pop rax

    loop encryption_loop      ; loop back
    


done:                       ; return 0
    mov rax, 60             ; sys_exit
    mov rdi, 0
    syscall