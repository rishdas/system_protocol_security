.section .text

.globl _start
_start:
 movq  %rsp, %rbp

 movq $2, %rax
 movq 16(%rbp), %rdi
 movl $1025, %esi
 syscall
	
 movq %rax, %rbx
 movq $60, %rax
 movq $0, %rdi
 syscall
