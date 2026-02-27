global _start ; exposes the _start symbol to your operating sysem

section .data ; store initialized data ; variables that you know the value of before the program runs
message: db "You already know what the next", 10, "variable will be, don’t you?", 0


section .text ; this is where your instructions go

_start:

