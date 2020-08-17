# #######################################################################################################
# 编写者：tao
# 文件：GPIO.S
# 日期：2020.8.17
# 文件作用：定义GPIO输入输出等功能的汇编函数编写
# #######################################################################################################
# .include "HiFIve1RevBGPIOMemmap.inc"

.equ GPIO_CTRL_ADDR,0x10012000

.equ GPIO_INPUT_VAL,0x00
.equ GPIO_INPUT_EN,0x04
.equ GPIO_OUTPUT_EN,0x08
.equ GPIO_OUTPUT_VALUE,0x0C
.equ GPIO_PUE,0x10
.equ GPIO_DS,0x14
.equ GPIO_RISE_IE,0x18
.equ GPIO_RISE_IP,0x1C
.equ GPIO_FALL_IE,0x20
.equ GPIO_FALL_IP,0x24
.equ GPIO_HIGH_IE,0x28
.equ GPIO_HIGH_IP,0x2C
.equ GPIO_LOW_IE,0x30
.equ GPIO_LOW_IP,0x34
.equ GPIO_IOF_EN,0x38
.equ GPIO_IOF_SEL,0x3C
.equ GPIO_OUT_XOR,0x40

# ###################################################################### #
# SetGPIOPINValue####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetGPIOPINValue

SetGPIOPINValue:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR # GPIO的基地址

    lw t1,GPIO_OUTPUT_VALUE(t0)
    or t1,a0,t1 # 置1 就是与门就好了
    sw t1,GPIO_OUTPUT_VALUE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# ClearGPIOPINValue##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl ClearGPIOPINValue

ClearGPIOPINValue:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_OUTPUT_VALUE(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_OUTPUT_VALUE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# XORGPIOPINValue####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl XORGPIOPINValue

XORGPIOPINValue:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_OUT_XOR(t0)
    or t1,a0,t1 # 置1
    sw t1,GPIO_OUT_XOR(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# NORXORGPIOPINValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl NORXORGPIOPINValue

NORXORGPIOPINValue:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_OUT_XOR(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_OUT_XOR(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINOutputEnable################################################### #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINOutputEnable

GPIOPINOutputEnable:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_OUTPUT_EN(t0)
    or t1,a0,t1 # 先置1
    sw t1,GPIO_OUTPUT_EN(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINOutputDisable################################################## #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINOutputDisable

GPIOPINOutputDisable:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_OUTPUT_EN(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_OUTPUT_EN(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINInputEnable#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINInputEnable

GPIOPINInputEnable:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_INPUT_EN(t0)
    or t1,a0,t1 # 先置1
    sw t1,GPIO_INPUT_EN(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINInputDisable################################################### #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINInputDisable

GPIOPINInputDisable:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_INPUT_EN(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_INPUT_EN(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOInputValueRead#################################################### #
# ###################################################################### #

.section .text
.align 2
.globl GPIOInputValueRead

GPIOInputValueRead:
    addi sp,sp,-4 # 堆栈保护
    sw t0,0(sp)

    li t0,GPIO_CTRL_ADDR

    lw a0,GPIO_INPUT_VAL(t0)   # 作为一个返回值

    lw t0,0(sp)
    addi sp,sp,4 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINSetPUE######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINSetPUE

GPIOPINSetPUE:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_PUE(t0)
    or t1,a0,t1 # 先置1
    sw t1,GPIO_PUE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINClearPUE####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINClearPUE

GPIOPINClearPUE:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_PUE(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_PUE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINDSSet########################################################## #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINDSSet

GPIOPINDSSet:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_DS(t0)
    or t1,a0,t1 # 先置1
    sw t1,GPIO_DS(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINDSClear######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINDSClear

GPIOPINDSClear:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_DS(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_DS(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINInterruptSetIE################################################# #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINInterruptSetIE 

GPIOPINInterruptSetIE:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    li t1,0
    beq a1,t1,GPIOPINInterruptSetIERISEIE
    li t1,1
    beq a1,t1,GPIOPINInterruptSetIEFALLIE
    li t1,2
    beq a1,t1,GPIOPINInterruptSetIEHIGHIE
    li t1,3
    beq a1,t1,GPIOPINInterruptSetIELOWIE
    j GPIOPINInterruptSetIEEnd
GPIOPINInterruptSetIERISEIE:
    lw t1,GPIO_RISE_IE(t0)
    or t1,a0,t1 # 置1
    sw t1,GPIO_RISE_IE(t0)
    j GPIOPINInterruptSetIEEnd
GPIOPINInterruptSetIEFALLIE:
    lw t1,GPIO_FALL_IE(t0)
    or t1,a0,t1 # 置1
    sw t1,GPIO_FALL_IE(t0)
    j GPIOPINInterruptSetIEEnd
GPIOPINInterruptSetIEHIGHIE:
    lw t1,GPIO_HIGH_IE(t0)
    or t1,a0,t1 # 置1
    sw t1,GPIO_HIGH_IE(t0)
    j GPIOPINInterruptSetIEEnd
GPIOPINInterruptSetIELOWIE:
    lw t1,GPIO_LOW_IE(t0)
    or t1,a0,t1 # 置1
    sw t1,GPIO_LOW_IE(t0)
GPIOPINInterruptSetIEEnd:
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINInterruptClearIE############################################### #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINInterruptClearIE 

GPIOPINInterruptClearIE:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    li t1,0
    beq a1,t1,GPIOPINInterruptClearIERISEIE
    li t1,1
    beq a1,t1,GPIOPINInterruptClearIEFALLIE
    li t1,2
    beq a1,t1,GPIOPINInterruptClearIEHIGHIE
    li t1,3
    beq a1,t1,GPIOPINInterruptClearIELOWIE
    j GPIOPINInterruptClearIEEnd
GPIOPINInterruptClearIERISEIE:
    lw t1,GPIO_RISE_IE(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_RISE_IE(t0)
    j GPIOPINInterruptClearIEEnd
GPIOPINInterruptClearIEFALLIE:
    lw t1,GPIO_FALL_IE(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_FALL_IE(t0)
    j GPIOPINInterruptClearIEEnd
GPIOPINInterruptClearIEHIGHIE:
    lw t1,GPIO_HIGH_IE(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_HIGH_IE(t0)
    j GPIOPINInterruptClearIEEnd
GPIOPINInterruptClearIELOWIE:
    lw t1,GPIO_LOW_IE(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_LOW_IE(t0)
GPIOPINInterruptClearIEEnd:
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINReadIPState#################################################### #
# ###################################################################### #

.section .text
.align 2
.globl GPIOPINReadIPState

GPIOPINReadIPState:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    li t1,0
    beq a0,t1,GPIOPINReadIPStateRISEIP
    li t1,1
    beq a0,t1,GPIOPINReadIPStateFALLIP
    li t1,2
    beq a0,t1,GPIOPINReadIPStateHIGHIP
    li t1,3
    beq a0,t1,GPIOPINReadIPStateLOWIP
    j GPIOPINReadIPStateEnd
GPIOPINReadIPStateRISEIP:
    lw a0,GPIO_RISE_IP(t0)
    ret
GPIOPINReadIPStateFALLIP:
    lw a0,GPIO_FALL_IP(t0)
    ret
GPIOPINReadIPStateHIGHIP:
    lw a0,GPIO_HIGH_IP(t0)
    ret
GPIOPINReadIPStateLOWIP:
    lw a0,GPIO_LOW_IP(t0)
    ret
GPIOPINReadIPStateEnd:
    add a0,zero,zero  # 返回0

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINIOFEnable###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINIOFEnable

GPIOPINIOFEnable:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_IOF_EN(t0)
    or t1,a0,t1 # 先置1
    sw t1,GPIO_IOF_EN(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINIOFDisable##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINDSClear

GPIOPINIOFDisable:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_IOF_EN(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_IOF_EN(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINIOFSelSet###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINIOFSelSet

GPIOPINIOFSelSet:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_IOF_SEL(t0)
    or t1,a0,t1 # 先置1
    sw t1,GPIO_IOF_SEL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret

# ###################################################################### #
# GPIOPINIOFSELClear#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl GPIOPINIOFSELClear

GPIOPINIOFSELClear:
    addi sp,sp,-8 # 堆栈保护
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,GPIO_CTRL_ADDR

    lw t1,GPIO_IOF_SEL(t0)
    or t1,a0,t1 # 先置1
    xor t1,a0,t1 # 异或 0对应的就不变  上面置1了 所以这个1对应的就是取反，也就是0
    sw t1,GPIO_IOF_SEL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8 # 堆栈保护

    ret