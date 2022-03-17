.data
	m1: .asciiz "Enter a number: "
.text
	la $a0, m1	# Print m1
	li $v0, 4
	syscall
	
	li $v0, 5	# Read int
	syscall
	
	move $t0, $v0
	
	li $a0, 1
loop:
	beq $a0, $t0, exit # if int = 1 exit program
	move $t5, $a0
	
	jal FizzBuzz	# jump to funct
	
	move $a0, $t5
	addi $a0, $a0, 1	# increment by 1
	
	j loop
exit: 
	li $v0, 10
	syscall
	
	