.section .text
.align 2
.globl main


main:
  addi sp, sp, -8
  sw s0, 0(sp)
  sw s1, 4(sp)
  la s0, _test_start
  la s1, __data_start

  lhu t0, 2(s1)
  lhu t1, 4(s1)
  slli t1,t1,16
  add t0,t0,t1 #BMP size
  add t0,t0,s1

  lhu t1,10(s1) #offset
  add t1,t1,s1

write_header:
    lbu t2,0(s1)
    sb t2,0(s0)
    addi s0,s0,1
    addi s1,s1,1 
    bltu s1,t1,write_header

loop:
    lbu t4,0(s1) #b
    lbu t3,1(s1) #g
    lbu t2,2(s1) #r
    
    #0.3 = 01001100110011001101 
    addi t5,x0,0
    slli t6,t2,18
    add t5,t5,t6
    slli t6,t2,15
    add t5,t5,t6
    slli t6,t2,14
    add t5,t5,t6
    slli t6,t2,11
    add t5,t5,t6
    slli t6,t2,10
    add t5,t5,t6
    slli t6,t2,7
    add t5,t5,t6
    slli t6,t2,6
    add t5,t5,t6
    slli t6,t2,3
    add t5,t5,t6
    slli t6,t2,2
    add t5,t5,t6
    add t5,t5,t2

    # 0.59 = 10010111000010100100
    slli t6,t3,19
    add t5,t5,t6
    slli t6,t3,16
    add t5,t5,t6
    slli t6,t3,14
    add t5,t5,t6
    slli t6,t3,13
    add t5,t5,t6
    slli t6,t3,12
    add t5,t5,t6
    slli t6,t3,7
    add t5,t5,t6
    slli t6,t3,5
    add t5,t5,t6
    slli t6,t3,2
    add t5,t5,t6
    
    #0.11 = 0.00011100001010010000
    slli t6,t4,16
    add t5,t5,t6
    slli t6,t4,15
    add t5,t5,t6
    slli t6,t4,14
    add t5,t5,t6
    slli t6,t4,9
    add t5,t5,t6
    slli t6,t4,7
    add t5,t5,t6
    slli t6,t4,4
    add t5,t5,t6
    

    srli t5,t5,20
    


    addi s1,s1,3
    
    sb t5,0(s0)    
    sb t5,1(s0)
    sb t5,2(s0)
    addi s0,s0,3

    BLTU s1,t0,loop 
  lw s0, 0(sp)
  lw s1, 4(sp)

  ret
