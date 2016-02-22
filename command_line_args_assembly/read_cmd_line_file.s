	.section .text
.LC0:	
	.string "      "
	.globl _start
_start:
	 movq  %rsp, %rbp		#save stack pointer for cmd line args
	 subq $6, %rsp
	 movq $2, %rax
	 movq 16(%rbp), %rdi		#access the argv[1]
	 movl $0, %esi
	 syscall			#open system call

	 movq %rax, %rbx		#save the file descriptor
	 movq $0, %rax
	 movq %rbx, %rdi	
	 leaq 6(%rsp), %rsi
	 movq $6, %rdx
	 syscall			#read system call

	 movq $1, %rax
	 movq $1, %rdi			#file descriptor for stdout	
	 leaq 6(%rsp), %rsi
	 movq $6, %rdx
	 syscall			#write to stdout

	 movq %rax, %rbx		#exit system call
	 movq $60, %rax
	 movq $0, %rdi
	 syscall
