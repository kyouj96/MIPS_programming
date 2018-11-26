      .data
message:   .asciiz   "Enter n value: "
result:   .asciiz   "\nFactorial of n= "
n:   .word   0
answer:   .word   0
      .text
main: 
   li   $v0, 4
   la   $a0, message
   syscall

   li   $v0, 5
   syscall
   sw   $v0, n

   lw   $a0, n
   jal   fact
   #move   $a0, $v0

   sw   $v0, answer

   li   $v0, 4
   la   $a0, result
   syscall

   li   $v0, 1
   lw   $a0, answer
   syscall

   li   $v0, 10
   syscall 
   
fact :
   addiu   $sp, $sp, -16   #alloc 4 words on the stack
   sw   $fp, 0($sp) 
   sw   $ra, 4($sp) 
   sw   $s0, 8($sp) 
   addiu   $fp, $sp, 12   # dealloc 3 words on the stack

   move   $s0, $a0
   blez   $s0, factEndZero
   addi   $a0, $a0, -1   # a0= a0 - 1
   jal   fact
   mul   $v0, $v0, $s0   # v0 = v0 * s0
factRet:
   lw   $s0, 8($sp)
   lw   $ra, 4($sp)
   lw   $fp, 0($sp)
   addiu   $sp, $sp, 16
   jr   $ra
factEndZero:
   li   $v0, 1
   b   factRet