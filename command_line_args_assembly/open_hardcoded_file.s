	.data	
	fd:	.word 0 		  #file desriptor
	file_name:	.ascii "test.txt" #hardcoded file name
	
	.text
		.global _start 
	_start:	
		leaq file_name, %rdi      #save the pointer to the file name
		movq $0, %rsi 		  #push argument for open call read
		movq $384, %rdx 	  #read-write for user octal 600
		movq $2, %rax 		  #system call no for open
		syscall			  #interupt
		cmpq $-1, %rax 		  #check the return value for
		je error 		  #if it is equal to -1 then error
		leaq fd, %r8 		  #save address of fd
		movq %rax, (%r8) 	  #save the fd retieved and put at fd
		movq %rax, %rdi 	  #save the fd as return exit code
		movq $60, %rax 		  # exit system call
		syscall
	error:
		movq $60, %rax 		  # exit system call
	        xor %rdi, %rdi 		  #send zero as exit code
		syscall 		  #interupt
