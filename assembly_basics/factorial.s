#purpose:  program to illustrate how recursive functions work
#          this program to calculate the factorial using recursion.

.section .data
data:
.long 5 #the input to the program
.section .text
.globl _start	
_start:
leal data, %ebx #store the address of data
movl (%ebx), %ecx #store the value at data in ecx
pushl %ecx	#push it into the stack as an argument to the recurisive call
call fact #call the recursive function
jmp loop_exit #exit
	
.type fact, @function
fact:
pushl %ebp #save the base pointer
movl %esp, %ebp	#make the base pointer the value of the stack pointer
subl $4, %esp	#make space for local variables
movl 8(%ebp), %ebx #load the argument in ebx
movl %ebx, -4(%ebp) #save it as a local variable
cmpl $1, %ebx #check if argument is 1 then just return
je no_recurse	#check if argument is 1 then just return
decl %ebx #decrement the ebx 
pushl %ebx #push the decremneted value as argument
call fact # call fact recursively
popl %edx # extract the argument
incl %edx # increment it again
imull %edx, %ebx #multiply the return value with your original argument

no_recurse:
movl %ebp, %esp #restore the stack pointer
popl %ebp #restore the base pointer
ret	

loop_exit:
	movl $1, %eax
	int $0x80
