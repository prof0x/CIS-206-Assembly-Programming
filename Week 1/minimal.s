	.file	"minimal.c"
# GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04) version 13.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	"%d"
.LC2:
	.string	"%s %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	addq	$-128, %rsp	#,
# minimal.c:2: int main(){
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp97
	movq	%rax, -8(%rbp)	# tmp97, D.3185
	xorl	%eax, %eax	# tmp97
# minimal.c:5:     scanf("%s", var1);
	leaq	-112(%rbp), %rax	#, tmp85
	movq	%rax, %rsi	# tmp85,
	leaq	.LC0(%rip), %rax	#, tmp86
	movq	%rax, %rdi	# tmp86,
	movl	$0, %eax	#,
	call	__isoc99_scanf@PLT	#
# minimal.c:6:     scanf("%d", &var2);
	leaq	-124(%rbp), %rax	#, tmp87
	movq	%rax, %rsi	# tmp87,
	leaq	.LC1(%rip), %rax	#, tmp88
	movq	%rax, %rdi	# tmp88,
	movl	$0, %eax	#,
	call	__isoc99_scanf@PLT	#
# minimal.c:7:     int var3 =  (1013 << 1);
	movl	$2026, -120(%rbp)	#, var3
# minimal.c:8:     int var4 = var3 - var2;
	movl	-124(%rbp), %eax	# var2, var2.0_1
# minimal.c:8:     int var4 = var3 - var2;
	movl	-120(%rbp), %edx	# var3, tmp92
	subl	%eax, %edx	# var2.0_1, tmp91
	movl	%edx, -116(%rbp)	# tmp91, var4
# minimal.c:11:     printf("%s %d\n", var1, var4);
	movl	-116(%rbp), %edx	# var4, tmp93
	leaq	-112(%rbp), %rax	#, tmp94
	movq	%rax, %rsi	# tmp94,
	leaq	.LC2(%rip), %rax	#, tmp95
	movq	%rax, %rdi	# tmp95,
	movl	$0, %eax	#,
	call	printf@PLT	#
# minimal.c:13:     return 0;
	movl	$0, %eax	#, _8
# minimal.c:14: }
	movq	-8(%rbp), %rdx	# D.3185, tmp98
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp98
	je	.L3	#,
	call	__stack_chk_fail@PLT	#
.L3:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
