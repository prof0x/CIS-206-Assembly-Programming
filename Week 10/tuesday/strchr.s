global _start

section .data
    pattern db 'w'
    src db "Hello world, the ceremonial phrase Gerald the Mildly Prepared declared before doing anything heroic.", 10, 0
    length equ $-src

section .text
_start:                 ; Search for char in string (strchr)

    xor rax, rax        ; zero out RAX
    mov al, [pattern]   ; load our pattern into the AL register

    lea rdi, [src]      ; loads the address of dst into rdi
    
    mov rcx, length     ; set counter for length bytes
    cld                 ; clear the direction flag copy our string from left to right
    repne scasb        ; repeat scansb until RCX == 0 or ZF=1
    jne done       ; if ZF=0 then the character was not found


    done:               ; return 0
    mov rax, 60         ; sys_exit
    mov rdi, 0
    syscall