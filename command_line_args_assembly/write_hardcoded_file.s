	.data	
fd:	.word 0 				#file desriptor
file_name:	.ascii "test.txt" 		#hardcoded file name
fixed_string:	.ascii "Assembly is a pain\n"   #Fixed string to be written
	.text
		.global _start 
	_start:	
		leaq file_name, %rdi 		#save the pointer to the file name
		movq $8, %rsi 			#push argument for open call read-write | create
		movq $420, %rdx 		#read-write for user octal 600
		movq $2, %rax 			#system call no for open
		syscall 			#interupt
		cmpq $-1, %rax 			#check the return value for
		je error 			#if it is equal to -1 then error return
		movq %rax, %rdi 		#save the fd as it is the argument for the next call
		leaq fd, %r8 			#save address of fd
		movq %rdi, (%r8) 		#save the fd retieved and put at fd
		movq $1, %rax 			# call write
		leaq fixed_string, %rsi 	#addres of the string the to be written
		movq $19, %rdx 			#no of bytes to be written
		syscall
		movq (%r8), %rdi 		#save the fd into rdi as first argument
		movq $3, %rdi 			#system call no for close()
		syscall
		xor %rdi, %rdi 			#return code 0
		movq $60, %rax 			# exit system call
		syscall
	error:
		movq $60, %rax 			# exit system call
	        xor %rdi, %rdi 			#send zero as exit code
		syscall 			#interupt
