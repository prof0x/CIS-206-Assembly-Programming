; Assignment 5.2 modified
; Letter frequency - NASM (64-bit)
; The result should be 5, stored in rax register

SECTION .data
message: DB "AsSeMbLy Is a progrAmming language.",0      ; message contains the null terminated string
len: equ ($ - message)                                   ; len calculates the length of the string (excluding the null terminator)

SECTION .text
global _start
_start:

	xor rax, rax						; Initializes rax to store the count of lowercase letters.
	xor rcx, rcx						; Initializes rcx to act as an index for iterating through the string.

top:
	lea rsi, [message]			; Loads the address of message into rsi.
	mov bl, [rsi + rcx]			; Loads the current character from message into bl (8-bit Low register for rbx).
	or bl, 32							; ensures the character is lowercase if it's a letter.
                                                ; or-ing with 32 (0x20) converts an uppercase letter to its lowercase equivalent 
											    ; while leaving lowercase letters unchanged.

	cmp bl, 97							; Compares bl to 'a' (97 in ASCII).
	jne zloop							; If bl is not 'a' or greater (not a lowercase letter), it jumps to zloop.
	inc rax								; If bl is a lowercase letter, rax is incremented, increasing the lowercase letter count.
zloop:
	inc rcx								; Moves to the next character.
	cmp rcx, len						; Compares the current index with the string length.
	jne top								; jump to top if not equal

     ; properly end execution for 64-bit program
	mov rax, 60
	xor rdi, rdi
	syscall