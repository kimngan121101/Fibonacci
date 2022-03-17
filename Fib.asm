.data
	array:	.space 180
	nl: .asciiz "\n"
.text
.globl Fib

Fib:
	move $s1, $a0
	move $s2, $a0
	subi $s1, $s1, 1

	la $a1, array
	li $t0, 0
	li $t1, 1
	sw $t1, ($a1)
funct:
	beqz $s1, print

	move $t2, $t1
	add $t1, $t1, $t0
	move $t0, $t2

	addi $a1, $a1, 4
	sw $t1, ($a1)
	subi $s1, $s1, 1

	j funct
print:
	la $a1, array
loop:
	beqz $s2, exit

	li $v0, 1
	lw $a0, ($a1)
	syscall

	la $a0, nl
	li $v0, 4
	syscall

	addi $a1, $a1, 4
	subi $s2, $s2, 1

	j loop
exit:
	jr $ra
