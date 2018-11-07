# 3. 정수값 i를 인자(parameter)로 받고 1을 더한 결과값을 반환하는 
# plus_one 함수를 포함하는 프로그램을 작성하시오. main 프로그램은 
# plus_one 함수를 호출하고 plus_one 함수의 수행 결과를 출력한다. 
#    (이 문제에서는 plus_one 함수를 호출한 전과 후의 register 
# 상태를 보이시오.)

#        # plus_one 함수
# plus_one(int i) { return (i+1); }

#        # main
#         int result;
# result = plus_one(100);
#         print(result);

        .data
result :.word 0
i :     .word 100
re :     .asciiz "result = "

        .text
main:
    lw $t0, i
    # ###########
    # li $v0, 4
    # la $a0, prompt
    # syscall

    # li $t0, 5  #입력받기
    # syscall

    # move $t0, $v0 
    
    jal plus_one   #함수 호출

    #함수의 수행결과를 출력
    la  $a0, re
    li  $v0, 4  #print "result ="
    syscall

    lw  $a0, result
    li  $v0, 1  #print result
    syscall

    li  $v0, 10
    syscall

plus_one:
    addi $t0, $t0, 1 # i = i + 1
    sw $t0, result # result = i
    jr  $ra  #jal로 돌아감