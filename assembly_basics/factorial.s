#purpose:  program to illustrate how recursive functions work
#          this program to calculate the factorial using recursion.

.section .data
data:
.long 4
.section .text
.globl _start	
_start:
leal data, %ebx
movl (%ebx), %ecx
pushl %ecx	
call fact

.type fact, @function
fact:
pushl %ebp #save the base pointer
movl %esp, %ebp	#make the base pointer the value of the stack pointer
subl $4, %esp	
movl 8(%ebp), %ebx	
movl %ebx, -4(%ebp)
cmpl $1, %ebx
je no_recurse	
decl %ebx
pushl %ebx
call fact
popl %edx
incl %edx	
imull %edx, %ebx

no_recurse:
movl %ebp, %esp #restore the stack pointer
popl %ebp #restore the base pointer
ret	
