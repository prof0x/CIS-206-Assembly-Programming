global _start

struc person
    .name resb 256                ;.name_size equ $-person.name
    .age resq 1
    .size equ $-person
endstruc

section .data
    s1: istruc person
        at person.name, db "Joshua", 0
        at person.age, dq 22
    iend

    newline db 10

section .bss
    age_buffer resb 20

section .text
_start:
   ; we need to find the length of the name string

   lea rdi, [s1 + person.name]
   xor rcx, rcx
   xor rax, rax

length:
   cmp byte [rdi + rcx], 0
   je print_name
   inc rcx
   jmp length

print_name:
    mov rax, 1
    mov rdi, 1
    lea rsi, [s1 + person.name]
    mov rdx, rcx                 ; length of the string that we computed above
    syscall

print_newline:
mov rax, 1
    mov rdi, 1
    lea rsi, newline
    mov rdx, 1                 ; length of 1
    syscall

convert_age_to_ascii:
    mov rax, [s1 + person.age]
    lea rdi, [age_buffer + 19]
    
    mov byte [rdi], 0          ; add null terminator to end of output buffer RDI
    mov rbx, 10                 ; divisor for base 10 division

convert_loop:
    xor rdx, rdx                ; zero out rdx for division
    div rbx                     ; rax / rbx = rax (quotient) rdx (remainder)
    add dl, '0'                 ; convert the remainder to ASCII
    dec rdi
    mov [rdi], dl 
    test rax, rax
    jnz convert_loop

age_length:
    lea rsi, [age_buffer + 19]
    sub rsi, rdi

print_age:
    mov rsi, rdi                ; rsi = buffer for syscall 1
    mov rdx, rsi                ; rdx = length for syscall 1
    mov rax, 1
    mov rdi, 1
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, newline
    mov rdx, 1                 ; length of 1
    syscall

done:                       ; return 0
    mov rax, 60             ; sys_exit
    mov rdi, 0
    syscall