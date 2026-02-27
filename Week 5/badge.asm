global _start

section .data
title_msg:  db "      === Employee ID ===", 10
title_len:  EQU $ - title_msg ; gives us the length of the title_msg buffer

badge_prefix: db "      Employee: 0x"
prefix_len: EQU $ - badge_prefix

short_label: db "Employee Short Code: 0x"
short_code_len: EQU $ - short_label

nl: db 10
nl_len: EQU $ - nl

emp_id: dq 0x88442D46E92BC412
hex_chars: db "0123456789ABCDEF" ; ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']

section .bss
hex_buf:    resb 16 ; output buffer for 16 hex chars
hex_buf16:  resb 4  ; for  4 hex chars of our "short code"

section .text

_start:

    ;-------------------------------
    ; Print Header
    ;-------------------------------
    mov rax, 1  ; sys_write
    mov rdi, 1  ; stdout
    mov rsi, title_msg  ; data to output
    mov rdx, title_len  ; length of data to output
    syscall

    ;------------------------------
    ; Copy Employee ID to Registers
    ; - into RAX to perform operations on
    ; - into R12 as a backup
    ;------------------------------

    mov rax, [emp_id]  ; copy memory -> register
    mov r12, rax       ; copy register -> register

    ;------------------------------
    ; Print Employee ID
    ;------------------------------

    mov r8, r12
    lea rsi, [hex_buf]

    mov rcx, 16 ; loop counter / boundary

.hex64_loop: ; convert hex values to ascii character codes
    mov rax, r8 ; move working copy of emp_id to RAX for operations
    shr rax, 60 ; shift RAX right by 60 (isolating the first 4-bit digit of emp_id)
    and rax, 0xF ; 1111 preserves lowest 4 bits and zeros out the rest of the regist (safety mechanism)

    mov dl, [hex_chars + rax + 1] ; perform character lookup indexing into hex_chars by value of digit in emp_id
    mov [rsi], dl ; copy ascii code (bits) to rsi which is a pointer to the beginning of the output buffer

    shl r8, 4 ; prepare the next digit of the employee id for character lookup
    inc rsi ; increment the pointer to our output buffer
    loop .hex64_loop ; repeat the loop

    ; print badge prefix
    mov rax, 1
    mov rdi, 1
    mov rsi, badge_prefix
    mov rdx, prefix_len
    syscall

    ; print hex_buff to stdout
    mov rax, 1
    mov rdi, 1
    mov rsi, hex_buf
    mov rdx, 16
    syscall

    ; print newline to stdout
    mov rax, 1
    mov rdi, 1
    mov rsi, nl
    mov rdx, nl_len
    syscall

    ;------------------------------
    ; return 0
    ;------------------------------
    mov rax, 60    ; sys_exit
    mov rdi, 0
    syscall