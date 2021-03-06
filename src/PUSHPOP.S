# #######################################################################################################
# 编写者：tao
# 文件：PUSHPOP.S
# 日期：2020.6.22
# 文件作用：定义PUSHREG和POPREG来进行现场保护和恢复
# 包含的宏定义：
# PUSHREG 作用：现场保护，需要的寄存器的数值压栈
# POPREG 作用：现场回复，需要的寄存器的数值出栈恢复
# #######################################################################################################
# 这个文件是现场保存和现场恢复的宏定义文件
.macro PUSHREG
    addi sp,sp,-120
    sw x2,0(sp)
    sw x1,4(sp)
    sw x5,8(sp)
    sw x6,12(sp)
    sw x7,16(sp)
    sw x8,20(sp)
    sw x9,24(sp)
    sw x10,28(sp)
    sw x11,32(sp)
    sw x12,36(sp)
    sw x13,40(sp)
    sw x14,44(sp)
    sw x15,48(sp)
    sw x16,52(sp)
    sw x17,56(sp)
    sw x18,60(sp)
    sw x19,64(sp)
    sw x20,68(sp)
    sw x21,72(sp)
    sw x22,76(sp)
    sw x23,80(sp)
    sw x24,84(sp)
    sw x25,88(sp)
    sw x26,92(sp)
    sw x27,96(sp)
    sw x28,100(sp)
    sw x29,104(sp)
    sw x30,108(sp)
    sw x31,112(sp)
    csrrs t0,mepc,zero
    sw t0,116(sp)
.endm

.macro POPREG
    lw t0,116(sp)
    csrrw zero,mepc,t0
    lw x31,112(sp)
    lw x30,108(sp)
    lw x29,104(sp)
    lw x28,100(sp)
    lw x27,96(sp)
    lw x26,92(sp)
    lw x25,88(sp)
    lw x24,84(sp)
    lw x23,80(sp)
    lw x22,76(sp)
    lw x21,72(sp)
    lw x20,68(sp)
    lw x19,64(sp)
    lw x18,60(sp)
    lw x17,56(sp)
    lw x16,52(sp)
    lw x15,48(sp)
    lw x14,44(sp)
    lw x13,40(sp)
    lw x12,36(sp)
    lw x11,32(sp)
    lw x10,28(sp)
    lw x9,24(sp)
    lw x8,20(sp)
    lw x7,16(sp)
    lw x6,12(sp)
    lw x5,8(sp)
    lw x1,4(sp)
    lw x2,0(sp)
    addi sp,sp,120
.endm