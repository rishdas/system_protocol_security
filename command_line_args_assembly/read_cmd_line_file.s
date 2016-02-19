.section .text
.LC0:	
.string "      "
.globl _start
_start:
 movq  %rsp, %rbp
 subq $6, %rsp
 movq $2, %rax
 movq 16(%rbp), %rdi
 movl $0, %esi
 syscall

 movq %rax, %rbx
 movq $0, %rax
 movq %rbx, %rdi	
 leaq 6(%rsp), %rsi
 movq $6, %rdx
 syscall

 movq $1, %rax
 movq $1, %rdi	
 leaq 6(%rsp), %rsi
 movq $6, %rdx
 syscall

 movq %rax, %rbx
 movq $60, %rax
 movq $0, %rdi
 syscall
