#아래의 주어진 연산식을 수행하는 프로그램을 작성하시오. 
# (단, 변수 c, d, e, f는 각각 정수 1, 2, 4, 3을 갖는다.)
# a = c + d;
# g = f - e;
# h = a + g - e;

        .data
a:      .word 0
c:      .word 1
d:      .word 2
e:      .word 4
f:      .word 3 
g:      .word 0
h:      .word 0
newline: .asciiz "\n"

        .text
main:
    lw      $t0, d
    lw      $t1, c
    lw      $t2, e
    lw      $t3, f

    add     $t4, $t0, $t1   # $t4 = c + d
    sw      $t4, a          # a = $t4
    move    $a0, $t4
    li      $v0, 1          # print a = 3
    syscall

    la      $a0, newline
    li      $v0, 4          # print newline
    syscall

    sub     $t5, $t3, $t2   # $t5 = f - e
    sw      $t5, g          # g = $t5
    move    $a0, $t5
    li      $v0, 1          # print g = -1
    syscall

    la      $a0, newline
    li      $v0, 4          # print newline
    syscall

    add     $t6, $t4, $t5   # $t6 = a + g
    sub     $t6, $t6, $t2   # $t6 = $t6 - e
    sw      $t6, h          # h = $t6
    move    $a0, $t6
    li      $v0, 1          # print h = -2
    syscall


    li      $v0, 10     #exit
    syscall

