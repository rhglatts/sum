#Rebecca Glatts - 3/23/2022
#hw1.asm - Getting numbers from keyboard until 0 and calculating their sum
#registers used:
#$t1 - used to hold the address of x 
#$s0 - used to hold the value of x
#$a0 - used to hold address of msg1
#$v0 - used to hold syscall code
#$t0 - used to hold number from user
#$t2 - used to hold sum
#

.data
msg1: .asciiz "Please enter a number, 0 to stop: "
msg2: .asciiz "Sum of all the numbers: "
x: .word 0


.text
main:
	#put address of x in $t1 and stores the value of x in $s0
	la $t1, x
	sw $s0, 0($t1)

	# loads message into address and prints it
	la $a0, msg1 
	li $v0, 4 
	syscall
	
	
	loop:
	#gets user input from keyboard
	li $v0, 5 
	syscall
	move $t0, $v0
	
	beq $t0, 0, print  #if number from keyboard == 0
	else:  #if it does not, add the number to the sum of all the numbers so far
		add $t2, $t2, $t0
		j loop
		
	print: 
	#prints msg2
	la $a0, msg2 #loads address of msg2
	li $v0, 4 #tells syscall to print string
	syscall
	
	#prints the sum
	move $a0, $t2 #loads address of $t2
	li $v0, 1 #tells syscall to print int
	syscall
	
	
exit: 
	
	li $v0, 10  #exit program
	syscall
	
	
	
