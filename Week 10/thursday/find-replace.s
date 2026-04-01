global _start

section .data
    pattern db 'o'
    replace db 'x'
    src db "Hello world, the ceremonial phrase Gerald the Mildly Prepared declared before doing anything heroic.", 10, 0
    length equ $-src

section .text
_start:                 ; Search for char in string (strchr)

    xor rax, rax        ; zero out RAX
    lea rdi, [src]      ; loads the address of dst into rdi
    mov rcx, length     ; set counter for length bytes
    cld                 ; clear the direction flag copy our string from left to right

replace_loop:
    mov al, [pattern]   ; load our pattern into the AL register
    repne scasb         ; repeat scansb until RCX == 0 or ZF=1
    jne done            ; if ZF=0 then the character was not found

    dec rdi             ; move rdi back one byte to the matching character
    mov al, [replace]   ; load the replacement charactre into AL / RAX
    stosb               ; copy value from register AL to memory pointer RDI
    jmp replace_loop

done:
                        ; print our src string
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, src        ; data to output
    mov rdx, length     ; length of data to output
    syscall

                        ; return 0
    mov rax, 60         ; sys_exit
    mov rdi, 0
    syscall