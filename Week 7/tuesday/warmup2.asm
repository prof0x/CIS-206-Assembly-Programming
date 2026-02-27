SECTION .text
	 global _start

_start:
  
    ; ---------
    ; 7.0) SF
    ;----------
	 mov al, -6
     sub al, 5

    ; ---------
    ; 7.1) SF but does not put the updated result into any registers
    ;----------
	 mov al, -6
     cmp al, 5

    ; ---------
    ; 7.2) SF because smaller register means 250 is represented as -6
    ;----------
	 mov al, 250 ; 0xFA = 1111 1010 = -6
     cmp al, 5   ; -6 - 5 = -11

    ; ---------
    ; 7.3) No Flags because bigger registers means 250 is represented as 250
    ;----------
	 mov ax, 250 
     cmp ax, 5   

    ; ---------
    ; 8.1) ZF
    ;----------
	 mov eax, 0
     test eax, 0
    
    ; ---------
    ; 8.2) No flags
    ;----------
	 mov eax, 1
     test eax, 1

    ; ---------
    ; 9) SF
    ;----------
	 mov eax, -42
     test eax, eax

    ; ---------
    ; 10.1) ZF 
    ;----------
	 mov eax, 0xF0
     and eax, 0x0F

     ; ---------
    ; 10.2) ZF 
    ;----------
	 mov eax, 0xF0
     test eax, 0x0F

    ; ---------
    ; 11) ZF
    ;----------
	 mov eax, 1
     xor eax, eax
    
    ; ---------
    ; 12.1) Does not set CF even though it "should"
    ;----------
    mov al, 255
    inc al
   
    ; ---------
    ; 12.2) Sets the CF 
    ;----------
    mov al, 255
    add al, 1

; properly end execution for 64-bit program
	mov rax, 60			
    xor rdi, rdi ; shortcut to copy the value 0 to RDI				
	syscall							