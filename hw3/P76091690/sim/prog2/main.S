.section .text
.align 2
.globl main

main:
    addi sp, sp, -8
    sw   s0, 0(sp)
    sw   s1, 4(sp)
    la   s0, _test_start
    la   s1, __data_start

    lhu t0, 2(s1)
    lhu t1, 4(s1)
    slli t1,t1,16
    add t0,t0,t1 #BMP size
    add t0,t0,s1

    lhu t1,10(s1) #offset
    add t1,t1,s1

w_header:
    lbu  s4,0(s1)
    sb   s4,0(s0)
    addi s0,s0,1
    addi s1,s1,1 
    bltu s1, t1, w_header

loop:
    lbu s2, 0(s1) #b
    lbu s3, 1(s1) #g
    lbu s4, 2(s1) #r
    addi t2, x0, 0
 
    # 0.11
    # 0.00011100001010010000
    slli t3, s2, 16
    add  t2, t2, t3
    slli t3, s2, 15
    add  t2, t2, t3
    slli t3, s2, 14
    add  t2, t2, t3
    slli t3, s2, 9
    add  t2, t2, t3
    slli t3, s2, 7
    add  t2, t2, t3
    slli t3, s2, 4
    add  t2, t2, t3

    # 0.59
    # 0.10010111000010100100
    slli t3, s3, 19
    add  t2, t2, t3
    slli t3, s3, 16
    add  t2, t2, t3
    slli t3, s3, 14
    add  t2, t2, t3
    slli t3, s3, 13
    add  t2, t2, t3
    slli t3, s3, 12
    add  t2, t2, t3
    slli t3, s3, 7
    add  t2, t2, t3
    slli t3, s3, 5
    add  t2, t2, t3
    slli t3, s3, 2
    add  t2, t2, t3

    # 0.3
    # 0.01001100110011001101 
    slli t3, s4, 18
    add  t2, t2, t3
    slli t3, s4, 15
    add  t2, t2, t3
    slli t3, s4, 14
    add  t2, t2, t3
    slli t3, s4, 11
    add  t2, t2, t3
    slli t3, s4, 10
    add  t2, t2, t3
    slli t3, s4, 7
    add  t2, t2, t3
    slli t3, s4, 6
    add  t2, t2, t3
    slli t3, s4, 3
    add  t2, t2, t3
    slli t3, s4, 2
    add  t2, t2, t3
    add  t2, t2, s4

    srli t2, t2, 20
    
    addi s1, s1, 3
    
    sb   t2, 0(s0)    
    sb   t2, 1(s0)
    sb   t2, 2(s0)
    addi s0, s0, 3

    # bgeu t0, s1, loop 
    bltu s1, t0, loop 
    lw   s0, 0(sp)
    lw   s1, 4(sp)

    ret
