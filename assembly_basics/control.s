 #VARIABLES: The registers have the following uses:
 #
 # %eci - Holds the address of the data being examined
 # %ebx - Holds value of Either zero or byte based on value of data 
 #
 # The following memory locations are used:
 #
 # data - contains the item data.
 #
.section .data
data:                       #This is the data item
 .long 19

.section .text
 .globl _start
_start:
	leal data,%ecx	#address of the data item
	movl (%ecx), %ebx #store the item in ebx in case its greater than 10
	cmpl $10, (%ecx) #check with 10
	jg control_exit #in case its greater just exit as the value is already stored in ebx
	movl $0, %ebx #in case it smaller than equal 2 load ebx with zero
	
control_exit:
 
    movl $1, %eax             #1 is the exit() syscall
    int  $0x80
    
