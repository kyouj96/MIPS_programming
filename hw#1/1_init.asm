#정수타입 변수 c와 d를 선언하고, c는 1로 d는 2로 초기화하는 프로그램작성

        .data
c:      .word 1
d:      .word 2

        .text
main:
    lw  $t0, c
    lw  $t1, d 

    li  $v0, 10
    syscall
