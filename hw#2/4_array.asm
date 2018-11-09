.data
c:	.word	0
d:	.word	10
arr:	.word	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	
newline: .asciiz "\n"

			.text
main:
 	la	$s0, arr # put array address
	li	$t6, 0 # index
	li	$t7, 10
	loop:
			slt	$t4, $t6, $t7 # c< 10?
			beq	$t4, $0, end 
			lui	$t4, 0x1234 
			ori	$t4, $t4, 0x5678
			move $t1, $t7
			sub	$t1, $t7, $t6
			sll	$t4, $t6, 2  #t4= c*4
			add	$t4, $t4, $s0 
			
			sw	$t1, 0($t4) #t1 = arr[c] store
			lw  $t1, 0($t4) #t1 = arr[c] load

			addi $a0, $t1, 0
			li $v0, 1
			syscall

			la $a0, newline
			li $v0, 4
			syscall



			addi	$t6, $t6, 1 #c++
		
			j loop
	end:

			li	$v0, 10  
			syscall