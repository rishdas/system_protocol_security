	.file	"write_hardcoded_file.c"
	.section	.rodata
.LC0:
	.string	"test.txt"	#hardcoded file name
	.align 8
.LC1:
	.string	"Assembly is a pain\n"	#hardcoded string
	.text
	.globl  _start
_start:
	movl	$1025, %esi		#open system call
	movl	$.LC0, %edi
	movl	$2, %eax
	syscall
	movl	%eax, %r10d		#save file descriptor
	cmpl	$0, %r10d
	jns	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	movl	%r10d, %eax		#prepare the write system call
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
	movl    %eax, %ebx		#exit system call
	movl    $60, %eax
	syscall
