# 2. 두 개의 정수를 받아 그 값을 서로 교체하는 swap() 함수를 구현하고, 
# 이를 이용하여 지난 MIPS#2 과제에서 만든 배열을 bubble sort하는 
# 프로그램을 작성하시오.
# (이 문제에서는 swap() 함수가 호출되어 배열 원소가 바뀔 때마다 
# Register State를 작성)

            .data
max_address:	.word	36
value:	.word	10,	9,	8,	7,	6,	5,	4,	3,	2,	1	

            .text
main:
    la $t0, value #address value
    lw $s7, max_address
    add $s7, $s7, $t0 #max_address

    j loop

loop:
    addi $t2, $t0, 0
    
    jal swap

    sub $s7, $s7, 4 #max address - 4
    bne $s7, $t0, loop

    jal print_val

    li $v0, 10
    syscall
    
    

swap:
    
    lw $s1, 0($t2) #value[0] load
    
    addi $t1, $t2, 4 # t1 = t1 + t0

    lw $s2, 0($t1) #vlaue[1] load


    sw $s1, 0($t1) #change value
    sw $s2, 0($t2)

    addi $t2, $t1, 0 #next index

    # addi $a0, $s7, 0
    # li $v0, 1
    # syscall
    # addi $a0, $t2, 0
    # li $v0, 1
    # syscall

    bne $s7, $t2, swap #t2 != max_address # j swap
    
    # lw $s3, 0($t0)
    # lw $s4, 4($t1)

    # addi $a0, $s7, 0
    # li $v0, 1
    # syscall           # 출력을 통해 값이 바뀐것을 확인

    jr $ra #return jal swap

print_val:

    lw $t3, 0($t0)
    lw $t4, 4($t0)
    lw $t5, 8($t0)
    lw $t6, 12($t0)
    lw $t7, 16($t0)
    lw $s0, 20($t0)
    lw $s1, 24($t0)
    lw $s2, 28($t0)
    lw $s3, 32($t0)
    lw $s4, 36($t0)
    
    jr $ra