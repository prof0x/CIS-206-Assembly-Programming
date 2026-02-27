SECTION .text
	 global _start

_start:
    ; ---------
    ; 1) What are the resulting flags?
    ;----------
	 mov eax, 5
     sub eax, 5

    ; ---------
    ; 2) 
    ;----------
	 mov eax, 1
     sub eax, 2

    ; ---------
    ; 3) 
    ;----------
	 mov al, 255
     add al, 1

    ; ---------
    ; 4) 
    ;----------
	 mov al, 127
     add al, 1

    ; ---------
    ; 5) 
    ;----------
	 mov al, -128
     sub al, 1

    ; ---------
    ; 6) 
    ;----------
	 mov eax, 10
	 mov ebx, 10
     cmp eax, ebx

    ; ---------
    ; 7) 
    ;----------
	 mov al, 250
     cmp al, 5

    ; ---------
    ; 8) 
    ;----------
	 mov eax, 0
     test eax, eax

    ; ---------
    ; 9) 
    ;----------
	 mov eax, -42
     test eax, eax

    ; ---------
    ; 10) 
    ;----------
	 mov eax, 0xF0
     and eax, 0x0F

    ; ---------
    ; 11) 
    ;----------
	 xor eax, eax

    ; ---------
    ; 12) 
    ;----------
    stc 
    mov eax, 1
    inc eax

; properly end execution for 64-bit program
	mov rax, 60			
    xor rdi, rdi ; shortcut to copy the value 0 to RDI				
	syscall							