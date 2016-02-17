	.data	
fd:	.word 0
file_name:	.ascii "test.txt"
	
	.text
		.global _start
	_start:	
		leaq file_name, %rdi
		movq $42, %rsi
		movq $384, %rdx
		movq $2, %rax
		syscall
		cmpq $-1, %rax
		je error
		leaq fd, %r8
		movq %rax, (%r8)
		movq %rax, %rdi
		movq $60, %rax
		syscall
	error:
		movq $60, %rax
	        xor %rdi, %rdi
		syscall
