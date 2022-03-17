.data 
	m2: .asciiz "Fizz\n" 
	m3: .asciiz "Buzz\n"
	m4: .asciiz "FizzBuzz\n"
.text
.globl FizzBuzz

FizzBuzz:
	rem $t2, $a0, 3 # check if it's a multiply of 3
	rem $t3, $a0, 5 # check if it's a multiply of 5
	or $t4, $t2, $t3 # if it's a multiply of both
	
	beq $t4, 0, fizzbuzz
	beq $t2, 0, fizz # if $t lands on any cases go to that branch
	beq $t3, 0, buzz
	
	 
	li $v0, 1 	# else print the int
	syscall
	
	move $t6, $a0	# save 
	
	li $a0, 0xa 
	li $v0, 11
	syscall
	
	move $a0, $t6 # reload
	jr $ra # jump to main
fizzbuzz:
	la $a0, m4
	j m
fizz:
	la $a0, m2
	j m
buzz:
	la $a0, m3
	j m
m:
	li $v0, 4	# print message
	syscall
	jr $ra

	