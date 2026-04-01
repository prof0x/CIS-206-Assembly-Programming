; inc_array.asm  (Linux x86_64, NASM)
; Goal:
;   array = '1','2','3'
;   call inc_array(array, 3)  ; increments each byte by 1 => '2','3','4'
;   print "2 3 4\n"

section .data

    arr:        db  '1','2','3'       ; 3 single-digit ASCII values
    outbuf:     db  '0',' ','0',' ','0', 10  ; "d d d\n" (placeholders '0')

section .text
    global _start

_start:
    ; --- call inc_array(&arr[0], 3) ---
    lea rdi, [rel arr]                ; LEA: load address of arr into RDI (arg1 = pointer)
    mov rsi, 3                        ; MOV: length = 3 into RSI (arg2)
    call inc_array                    ; CALL: push return address, jump to inc_array

    ; --- build output buffer: "X Y Z\n" ---
    mov al,  [rel arr]                ; MOV: load arr[0] byte into AL
    mov [rel outbuf], al              ; MOV: store it into outbuf[0]

    mov al,  [rel arr+1]              ; MOV: load arr[1]
    mov [rel outbuf+2], al            ; MOV: store into outbuf[2]

    mov al,  [rel arr+2]              ; MOV: load arr[2]
    mov [rel outbuf+4], al            ; MOV: store into outbuf[4]

    ; --- write(outbuf, 6) to stdout ---
    mov rax, 1                        ; Linux syscall number for write = 1
    mov rdi, 1                        ; file descriptor 1 = stdout
    lea rsi, [rel outbuf]             ; buffer address
    mov rdx, 6                        ; number of bytes to write: "d d d\n" = 6
    syscall                           ; SYSCALL: enter kernel to perform write

    ; --- exit(0) ---
    mov rax, 60                       ; Linux syscall number for exit = 60
    xor rdi, rdi                      ; XOR: set RDI=0 (exit status 0)
    syscall                           ; SYSCALL: exit

; ---------------------------------------------
; void inc_array(char* p, long len)
;   RDI = pointer to first element
;   RSI = number of elements
; increments each byte by 1
; ---------------------------------------------
inc_array:
    ; Function prologue (stack frame) - educational / standard structure
    push rbp                          ; PUSH: save old frame pointer
    mov rbp, rsp                      ; MOV: establish new frame pointer

    xor rcx, rcx                      ; XOR: RCX = 0 (loop index i = 0)

.loop:
    cmp rcx, rsi                      ; CMP: compare i with len
    jge .done                         ; JGE: if i >= len, exit loop

    ; p[i] = p[i] + 1
    mov al, [rdi + rcx]               ; MOV: load byte at address (p + i) into AL
    add al, 1                         ; ADD: increment AL by 1
    mov [rdi + rcx], al               ; MOV: store updated byte back to memory

    inc rcx                           ; INC: i++
    jmp .loop                         ; JMP: repeat loop

.done:
    ; Function epilogue
    pop rbp                           ; POP: restore old frame pointer
    ret                               ; RET: return to caller