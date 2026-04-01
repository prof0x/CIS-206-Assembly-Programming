global _start

section .data
    arr dd 8392, 174, 5928, 3017, 4489, 7631, 2205, 987, 6104, 4327, 2516, 9053, 7184, 3891, 6740, 1423, 8569, 3370, 4902, 6057, 2819, 9736, 1672, 5481, 4235, 8912, 759, 3648, 5190, 2883, 6317, 1024, 8745, 4362, 7901, 2590, 5043, 3867, 6219, 1487, 9391, 2754, 4678, 8035, 1928, 5516, 7302, 3085, 4659, 6071, 1746, 8982, 3427, 6150, 2739, 5012, 7884, 2197, 6395, 4108, 5271, 3845, 6932, 1528, 8349, 2916, 4780, 6078, 3652, 7899, 2395, 5740, 4116, 6823, 1984, 5407, 3179, 7462, 2851, 6320, 4725, 8604, 1039, 3986, 5217, 6471, 2748, 5903, 7136, 3265, 4872, 5981, 1749, 8235, 2398, 4651, 7024, 3587, 4913, 6307
    len equ ($ - arr) / 4

    space db ' '          ; store ' ' space character as a constant to output later
    newline db 10         ; store '\n' newline character as a constant to output later

section .bss
    buffer resb 12        ; reserve 12 bytes for the output buffer

section .text
_start:
    mov edi, len           ; initialize edi with the array length to use as counter for outer loop
    dec edi                ; dec edi so outer loop only runs n-1 times

outer_loop:
    cmp edi, 0             ; initialize loop condition so that we can exit after running n-1 times
    jle done

    mov esi, arr           ; load the base address of the array for iteration
    mov ecx, edi           ; initialize our inner loop counter (this will shrink on each pass)

inner_loop:
    mov eax, [esi]         ; load current element into eax
    mov ebx, [esi + 4]     ; load the next element into ebx (we need to store this in a register to perform the swap)
                                ; because you can't assign a value from memory to another location in memory
                                ; without using a register to facilitate the assignment

                           ; if(eax <= ebx) then dont swap
    cmp eax, ebx           ; eax - ebx <= 0 and Set Flags
    jle no_swap            ; ZF or SF then jump to no_swap

                           ; else (eax > ebx) then swap
    mov [esi], ebx         ; store the smaller value in the first position
    mov [esi + 4], eax     ; store the larger value in the second position

no_swap:
    add esi, 4             ; increment inner loop by moving the array pointer by 4 (to the next element)
    loop inner_loop        ; decrement ecx (inner loop counter) and jump back up to inner_loop

    dec edi                ; decrement edi (outer loop counter) and jump back up to the outer_loop
    jmp outer_loop

done:
    mov esi, arr           ; reset esi pointer to beginning of arr
    mov ecx, len           ; initialize loop counter as len

print_loop:
    mov edi, buffer + 11   ; get a pointer to the end of the output buffer
    mov byte [edi], 0      ; add the null terminator to the end of our output buffer
    
    mov eax, [esi]         ; load the current number into eax (what esi is pointing at)

convert:                   ; while there are still digits in the current number to be converted
    dec edi                ; move our pointer to output buffer backwards 1 byte (1 char)
    xor edx, edx           ; zero out EDX in preparation for use as the remainder in divide by 10
    mov ebx, 10
    div ebx                ; divids the value in EAX by 10 (ebx) -> remainder goes to EDX
    add dl, '0'            ; convert remainder to ASCII
    mov [edi], dl

    test eax, eax          ; test to see if result of division (EAX) is 0
    jnz convert            ; jump back up to convert and finish converting all the digits in one multi digit number

    push ecx               ; push ecx onto the stack because syscall will clobber it

                           ; Print a single multi-digit number
                           ; 32-Bit Write to Standard Output
    mov eax, 4             ; sys_write (mov rax, 1)
    mov ebx, 1             ; stdout    (mov rdi, 1)
    mov ecx, edi           ; pointer to our string
    mov edx, buffer+12
    sub edx, edi           ; length of the string dynamically here
    int 0x80               ; syscall
    
                           ; Print a space
                           ; 32-Bit Write to Standard Output
    mov eax, 4             ; sys_write (mov rax, 1)
    mov ebx, 1             ; stdout    (mov rdi, 1)
    mov ecx, space         ; pointer to our string
    mov edx, 1
    int 0x80               ; syscall

    add esi, 4             ; move pointer to the next element of the sorted integer array
    pop ecx                ; restore ecx from the stack because it was clobbered by syscalls
    loop print_loop

                           ; Print a newline
                           ; 32-Bit Write to Standard Output
    mov eax, 4             ; sys_write (mov rax, 1)
    mov ebx, 1             ; stdout    (mov rdi, 1)
    mov ecx, newline       ; pointer to our string
    mov edx, 1
    int 0x80               ; syscall

                           ; Return 0
                           ; 32-Bit Write to Standard Output
    mov eax, 1             ; sys_return
    xor ebx, ebx           ; 0
    int 0x80               ; syscall