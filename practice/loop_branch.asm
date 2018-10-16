#메세지를 3번 출력하는 프로그램 (loop사용법)
      .data
msg:    .asciiz "Hello, World!"
count:  .word 0
newline:  .asciiz "\n"

      .text
main:
    lw  $s0, count
    la  $a0, msg
    j   loop

loop:
    la  $a0, msg
    li  $v0, 4
    syscall
    la  $a0, newline
    syscall

    addi  $s0, $s0, 1
    bne   $s0, 3, loop

    li    $v0, 10
    syscall
