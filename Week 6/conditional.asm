global _start

section .data
a_msg:  db "      You got an A", 10
a_msg_len:  EQU $ - a_msg ;
b_msg:  db "      You got a B", 10
b_msg_len:  EQU $ - b_msg ;
c_msg:  db "      You got a C", 10
c_msg_len:  EQU $ - c_msg ;
f_msg:  db "      You got lower than a passing grade.", 10
f_msg_len:  EQU $ - f_msg ;


section .text
_start:
    mov rax, 90         ; grade 
    
    ; if rax (grade) is >= 90 
    cmp rax, 90        
    jge grade_a 

    ; (else) if rax >= 80
    cmp rax, 80
    jge grade_b
    
    ; (else) if rax >= 70
    cmp rax, 70
    jge grade_c

    ; (else)
    jmp grade_f
               
    
grade_a:
    mov rax, 1  ; sys_write
    mov rdi, 1  ; stdout
    mov rsi, a_msg  ; data to output
    mov rdx, a_msg_len  ; length of data to output
    syscall
    jmp return

grade_b:
    mov rax, 1  ; sys_write
    mov rdi, 1  ; stdout
    mov rsi, b_msg  ; data to output
    mov rdx, b_msg_len  ; length of data to output
    syscall
    jmp return

grade_c:
    mov rax, 1  ; sys_write
    mov rdi, 1  ; stdout
    mov rsi, c_msg  ; data to output
    mov rdx, c_msg_len  ; length of data to output
    syscall
    jmp return

grade_f:
    mov rax, 1  ; sys_write
    mov rdi, 1  ; stdout
    mov rsi, f_msg  ; data to output
    mov rdx, f_msg_len  ; length of data to output
    syscall
    jmp return

return:
    ;------------------------------
    ; return 0
    ;------------------------------
    mov rax, 60    ; sys_exit
    mov rdi, 0
    syscall