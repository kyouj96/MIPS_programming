# 정수 타입의 변수 a와 i를 선언하여 각각 0으로 초기화하고,
# i < 5 인 동안 i를 1씩 증가시키고 
# i값을 a에 더하는 반복문을 수행하는 프로그램을 작성하시오.

        .data
a:      .word 0
i:      .word 0
sum:    .word 0

        .text
main:
    lw   $t0, a
    lw   $t1, i
    j    loop	# jump to loop
    
loop:
    add  $t0, $t0, $t1   # a = a + i
    sw   $t0, sum
    addi $t1, $t1, 1     # i++
    
    bne  $t1, 5, loop    # i != 5 이면 loop

    lw   $a0, sum
    li   $v0, 1          # print a = 10
    syscall

    li   $v0, 10         # exit
    syscall

    