	.section .text

	.globl _start
_start:
	 movq  %rsp, %rbp		#save the stack pointer
	 movq $2, %rax
	 movq 16(%rbp), %rdi		#access argv[1]
	 movl $1025, %esi
	 syscall			#open system call

	 movq %rax, %rbx		#save file descriptor
	 movq $1, %rax
	 movq %rbx, %rdi	
	 movq 24(%rbp), %rsi
	 movq $6, %rdx			#write 6 bytes
	 syscall			#write system call

	 movq %rax, %rbx		#exit system call
	 movq $60, %rax
	 movq $0, %rdi
	 syscall
