; Name: Mike Bogner
; Assignment: arrayExample.asm
; Description: Basic array example - accesses various array values
; use debugger to analyze results of instructions

; Section for initialized variables
SECTION .data
     array1 DW 0A00h, 1A01h, 2A02h      ; array1 - Word Array of 3 16-bit values
	                                    ; 0A00h at array1 + 0; 1A01h at array1 + 2; 2A02h at array1 + 4
	 array2 DB 0Ch                      ; array2 - Byte Array of 6 8-bit values; 0Ch at array2 + 0
			DB 1Ch               		; 1Ch at array2 + 1
			DB 2Ch               		; 2Ch at array2 + 2
			DB 3Ch               		; 3Ch at array2 + 3
			DB 4Ch               		; 4Ch at array2 + 4
			DB 5Ch               		; 5Ch at array2 + 5
	 array3 DB 0Dh, 1Dh, 2Dh           ; array 3 - Byte Array of 3 8-bit values
	                                   ; 0Dh at array3 + 0; 1Dh at array3 + 1, 2Dh at array3 + 2
	
; Section for code
SECTION .text
	global _start

_start:
	mov rax, array1            ; loads the address of the beginning of array1 into rax
	mov ax, [array1]           ; loads the first 16-bit value (0x0A00) into ax
	mov ax, [array1 + 4]    ; loads the third 16-bit value (0x2A02) into ax
	mov ax, [array1 + 8]    ; access an out-of-bounds memory location because array1 only contains three words (6 bytes).
	
	mov al, [array2 + 2]     ; loads the third byte of array2 (0x2C) into al
	mov al, [array2 + 7]     ; access an out-of-bounds memory location because array2 only contains 6 bytes.

; end of _start

; properly end execution for 64-bit program
	mov rax, 60		
    xor rdi, rdi			
	syscall						