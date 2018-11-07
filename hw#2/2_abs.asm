# 2. 아래의 주어진 연산식을 수행하는 프로그램을 작성하시오.
# (단, c = 5, d = 10,)
# a = |c-d| (절대값 구하기) 

        .data
a :     .word 0
c :     .word 5
d :     .word 10
prt_a :    .asciiz "a = "
# newline :  .asciiz "\n"

        .text
main : 
    lw  $t0, c
    lw  $t1, d

    sub $t0, $t0, $t1   # t0 = c - d
    
#     la  $a0, prt_a
#     li  $v0, 4  #print prt_a
#     syscall

#     sw  $t0, a # a = c - d 절대값 구하기 전

#     lw  $a0, a
#     li  $v0, 1  #print a
#     syscall

#     la  $a0, newline
#     li  $v0, 4  #print newline
#     syscall

    abs $t0, $t0  #절대값 |a|
#    sltiu $t2, $t0, 0  # 음수이면 1, 양수이면 0

    sw  $t0, a  # a = |c - d|

    la  $a0, prt_a
    li  $v0, 4  #print prt_a
    syscall

    lw  $a0, a
    li  $v0, 1  #print a
    syscall

    li  $v0, 10
    syscall
