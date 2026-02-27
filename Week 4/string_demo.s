global _start 

section .bss
buffer: resb 7 ; uninitialized memory ; Hellooo
buffer2: resb 7 ; uninitialized memory ; ABC0000
buffer3: resb 7 ; uninitialized memory ; XYZ0000
length: EQU $ - buffer ; define constant length of all 3 buffers together 

section .text
_start:     
   
    mov byte [buffer+(0*1)], 'H'   
    mov byte [buffer+(1*1)], 'e' 
    mov byte [buffer+(2*1)], 'l' 
    mov byte [buffer+(3*1)], 'l' 
    mov byte [buffer+(4*1)], 'o' 
    mov byte [buffer+(5*1)], 10  
    mov byte [buffer+(6*1)], 0  

    mov byte [buffer2], 'A'
    mov byte [buffer2+1], 'B'
    mov byte [buffer2+2], 'C'

    mov byte [buffer3], 'X'
    mov byte [buffer3+1], 'Y'
    mov byte [buffer3+2], 'Z'


    mov rax, 1 
    mov rdi, 1 
    mov rsi, buffer
    mov rdx, length 
    syscall  ;  Hellooooo
             ;  XYZ
            
    mov rax, 60 
    mov rdi, 0  
    syscall  


