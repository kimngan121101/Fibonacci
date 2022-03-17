.data
	m1: .asciiz "How many elements of the Fibonacci series?  "
.text

loop: # Print prompt1
	li $v0, 4
	la $a0, m1
	syscall

	# Read integer
	li $v0, 5
	syscall

	move $a0, $v0
	bgt $a0, 45, loop
	
	jal Fib
#Exit
	li $v0, 10
	syscall

