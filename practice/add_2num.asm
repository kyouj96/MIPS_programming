#두개의 정수를 덧셈하는 프로그램
      .data
One:  .word 1  #int One = 1;
Two:  .word 2  #int Two = 2;

      .text
main:
  lw  $s0, One  #One에 있는 것을 $s0 레지스터에 저장
  lw  $s1, Two
  add $s2, $s0, $s1 #s2<-s1+s0

  move  $a0, $s2
  li  $v0, 1
  syscall

  li  $v0, 10
  syscall
