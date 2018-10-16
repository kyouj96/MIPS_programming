# loop를 procedure로 구현하여 사용
          .data
msg:      .asciiz "Hello, World!"
count:    .word 0
newline:  .asciiz "\n"

          .text
main:
    lw      $s0, count
    jal     loop

    li      $v0, 10     #exit
    syscall

loop:
    beq     $s0, 3, result
    bne     $s0, 3, func

result:
    jr      $31

func:
    addi    $s0, $s0, 1

    la      $a0, msg
    li      $v0, 4      #print msg
    syscall

    la      $a0, newline
    syscall             #print newline

    j       loop
