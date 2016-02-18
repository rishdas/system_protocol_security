	.file	"write_hardcoded_file.c"
	.section	.rodata
.LC0:
	.string	"test.txt"
	.align 8
.LC1:
	.string	"Assembly is a pain\n"
	.text
	.globl  _start
_start:
	movl	$1025, %esi
	movl	$.LC0, %edi
	movl	$2, %eax
	syscall
	movl	%eax, %r10d
	cmpl	$0, %r10d
	jns	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	movl	%r10d, %eax
	movl	$19, %edx
	movl	$.LC1, %esi
	movl	%eax, %edi
	movl	$1, %eax
	syscall
	cmpq	$19, %rax
	je	.L4
	movl	$1, %eax
	jmp	.L3
.L4:
	movl	$0, %ebx
.L3:
	movl    %eax, %ebx
	movl    $60, %eax
	syscall
