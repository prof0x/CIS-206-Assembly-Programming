; Name: Mike Bogner
; Program: test1.asm
; Description: checking for positive or negative

; Section for initialized variables
SECTION .data
     var1:	DQ	42            ; defines var1, a 64-bit variable with value 42
	 var2:	DQ	-42          ; defines var2, a 64-bit variable with value -42 (two's complement representation)

; Section for code
SECTION .text
	 global _start

_start:
	 mov rax, [var1]      ; loads the value of var1 (which is 42) into rax
	 or rax, rax               ; performs a bitwise OR between rax and itself
	                                   ; commonly used to check if a value is positive, negative, or zero by setting the Sign (SF) or Zero (ZF) flag
									   ; without modifying rax
	 mov rax, [var2]     ; loads the value of var2 (which is -42) into rax
	 or rax, rax              ; performs a bitwise OR between rax and itself
	                                  ; commonly used to check if a value is positive, negative, or zero by setting the Sign (SF) or Zero (ZF) flag
									  ; without modifying rax
	 mov rax, 0             ; loads 0 into rax
	 or rax, rax             ; performs a bitwise OR between rax and itself
	                                 ; commonly used to check if a value is positive, negative, or zero by setting the Sign (SF) or Zero (ZF) flag
									 ; without modifying rax
; end of _start

; properly end execution for 64-bit program
	mov rax, 60			
    xor rdi, rdi ; shortcut to copy the value 0 to RDI				
	syscall							