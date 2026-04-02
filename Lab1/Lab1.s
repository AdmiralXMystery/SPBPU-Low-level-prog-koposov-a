start:
    li x10, LED_MATRIX_0_BASE
    li x11, SWITCHES_0_BASE
    li x12, 0x00FF00        
    lw x14, 0(x11)          

    li x13, 128
    bge x14, x13, end

    beq x14, x0, start
    
    li x17, 64
    bgt x14, x17, start

    addi x15, x10, 0        
    li x16, 1

find_addr:
    beq x16, x14, light_up  
    
    addi x15, x15, 4        
    addi x16, x16, 1
    j find_addr

light_up:
    sw x12, 0(x15)          
    j start

end:
    li x10, LED_MATRIX_0_BASE
    li x20, 0
    li x21, 64              
for_off:
    sw x0, 0(x10)
    addi x10, x10, 4
    addi x20, x20, 1
    blt x20, x21, for_off

