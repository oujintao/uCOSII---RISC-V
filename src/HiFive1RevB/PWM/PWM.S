# #######################################################################################################
# 编写者：tao
# 文件：PWM.S
# 日期：2020.8.17
# 文件作用：定义PWM操作的汇编函数
# #######################################################################################################
# .include "HiFive1RevBPWMMemorymap.inc"

.equ PWM0_CTRL_ADDR,0x10015000
.equ PWM1_CTRL_ADDR,0x10025000
.equ PWM2_CTRL_ADDR,0x10035000

.equ PWMCFG,0x00
.equ PWMCOUNT,0x08
.equ PWMS,0x10
.equ PWMCMP0,0x20
.equ PWMCMP1,0x24
.equ PWMCMP2,0x28
.equ PWMCMP3,0x2C

# ############################################################################# #
# PWMCFG####################################################################### #
# ############################################################################# #

# ###################################################################### #
# PWM0CheckCMP0IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0CheckCMP0IP

PWM0CheckCMP0IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM0_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,28
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM0SetCMP0IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP0IPValue

PWM0SetCMP0IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,28 # 移到28

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,28
    or t1,t1,t2
    xor t1,t1,t2 # 清空原来的28

    or t1,t1,a0 # 置为28

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0CheckCMP1IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0CheckCMP1IP

PWM0CheckCMP1IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM0_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,29
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM0SetCMP1IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP1IPValue

PWM0SetCMP1IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,29

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,29
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0CheckCMP2IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0CheckCMP2IP

PWM0CheckCMP2IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM0_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,30
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM0SetCMP2IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP2IPValue

PWM0SetCMP2IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,30

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,30
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0 

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0CheckCMP3IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0CheckCMP3IP

PWM0CheckCMP3IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM0_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,31
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM0SetCMP3IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP3IPValue

PWM0SetCMP3IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,31

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,31
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetCMP01GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP01GANGValue

PWM0SetCMP01GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,24 

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,24
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0 

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetCMP12GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP12GANGValue

PWM0SetCMP12GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,25

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,25
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0 

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetCMP23GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP23GANGValue

PWM0SetCMP23GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,26

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,26
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetCMP30GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP30GANGValue

PWM0SetCMP30GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,27

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,27
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetCMP0CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP0CompareCenterValue

PWM0SetCMP0CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,16

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetCMP1CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP1CompareCenterValue

PWM0SetCMP1CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,17

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,17
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetCMP2CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP2CompareCenterValue

PWM0SetCMP2CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,18

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,18
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetCMP3CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetCMP3CompareCenterValue

PWM0SetCMP3CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,19

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,19
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0EnableAlways###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0EnableAlways

PWM0EnableAlways:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,3
    slli t2,t2,12
    or t1,t1,t2
    xor t1,t1,t2

    srli t2,t2,13
    slli t2,t2,12
    or t1,t1,t2

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0EnableOneShot##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0EnableOneShot

PWM0EnableOneShot:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,3
    slli t2,t2,12
    or t1,t1,t2
    xor t1,t1,t2

    srli t2,t2,13
    slli t2,t2,13
    or t1,t1,t2

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0Disable########################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0Disable

PWM0Disable:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,3
    slli t2,t2,12
    or t1,t1,t2
    xor t1,t1,t2

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetDeglitchValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetDeglitchValue

PWM0SetDeglitchValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,10

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1024
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetZeroCMPValue################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetZeroCMPValue

PWM0SetZeroCMPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,9

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,512
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetStickyValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetStickyValue

PWM0SetStickyValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,8

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,256
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM0SetPWMScaleValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetPWMScaleValue

PWM0SetPWMScaleValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,15

    li t0,PWM0_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,15
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1CheckCMP0IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1CheckCMP0IP

PWM1CheckCMP0IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM1_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,28
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM1SetCMP0IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP0IPValue

PWM1SetCMP0IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,28 # 移到28

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,28
    or t1,t1,t2
    xor t1,t1,t2 # 清空原来的28

    or t1,t1,a0 # 置为28

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1CheckCMP1IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1CheckCMP1IP

PWM1CheckCMP1IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM1_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,29
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM1SetCMP1IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP1IPValue

PWM1SetCMP1IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,29

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,29
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1CheckCMP2IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1CheckCMP2IP

PWM1CheckCMP2IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM1_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,30
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM1SetCMP2IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP2IPValue

PWM1SetCMP2IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,30

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,30
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0 

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1CheckCMP3IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1CheckCMP3IP

PWM1CheckCMP3IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM1_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,31
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM1SetCMP3IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP3IPValue

PWM1SetCMP3IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,31

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,31
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetCMP01GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP01GANGValue

PWM1SetCMP01GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,24 

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,24
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0 

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetCMP12GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP12GANGValue

PWM1SetCMP12GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,25

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,25
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0 

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetCMP23GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP23GANGValue

PWM1SetCMP23GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,26

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,26
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetCMP30GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP30GANGValue

PWM1SetCMP30GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,27

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,27
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetCMP0CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP0CompareCenterValue

PWM1SetCMP0CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,16

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetCMP1CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP1CompareCenterValue

PWM1SetCMP1CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,17

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,17
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetCMP2CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP2CompareCenterValue

PWM1SetCMP2CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,18

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,18
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetCMP3CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetCMP3CompareCenterValue

PWM1SetCMP3CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,19

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,19
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1EnableAlways###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1EnableAlways

PWM1EnableAlways:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,3
    slli t2,t2,12
    or t1,t1,t2
    xor t1,t1,t2

    srli t2,t2,13
    slli t2,t2,12
    or t1,t1,t2

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1EnableOneShot##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1EnableOneShot

PWM1EnableOneShot:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,3
    slli t2,t2,12
    or t1,t1,t2
    xor t1,t1,t2

    srli t2,t2,13
    slli t2,t2,13
    or t1,t1,t2

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1Disable########################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1Disable

PWM1Disable:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,3
    slli t2,t2,12
    or t1,t1,t2
    xor t1,t1,t2

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetDeglitchValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetDeglitchValue

PWM1SetDeglitchValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,10

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1024
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetZeroCMPValue################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetZeroCMPValue

PWM1SetZeroCMPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,9

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,512
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetStickyValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetStickyValue

PWM1SetStickyValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,8

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,256
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM1SetPWMScaleValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetPWMScaleValue

PWM1SetPWMScaleValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,15

    li t0,PWM1_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,15
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2CheckCMP0IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2CheckCMP0IP

PWM2CheckCMP0IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM2_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,28
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM2SetCMP0IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP0IPValue

PWM2SetCMP0IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,28 # 移到28

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,28
    or t1,t1,t2
    xor t1,t1,t2 # 清空原来的28

    or t1,t1,a0 # 置为28

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2CheckCMP1IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2CheckCMP1IP

PWM2CheckCMP1IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM2_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,29
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM2SetCMP1IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP1IPValue

PWM2SetCMP1IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,29

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,29
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2CheckCMP2IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2CheckCMP2IP

PWM2CheckCMP2IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM2_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,30
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM2SetCMP2IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP2IPValue

PWM2SetCMP2IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,30

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,30
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0 

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2CheckCMP3IP####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2CheckCMP3IP

PWM2CheckCMP3IP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM2_CTRL_ADDR
    lw a0,PWMCFG(t0)

    srli a0,a0,31
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM2SetCMP3IPValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP3IPValue

PWM2SetCMP3IPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,31

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,31
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetCMP01GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP01GANGValue

PWM2SetCMP01GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,24 

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,24
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0 

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetCMP12GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP12GANGValue

PWM2SetCMP12GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,25

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,25
    or t1,t1,t2
    xor t1,t1,t2 

    or t1,t1,a0 

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetCMP23GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP23GANGValue

PWM2SetCMP23GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,26

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,26
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetCMP30GANGValue################################################# #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP30GANGValue

PWM2SetCMP30GANGValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,27

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,27
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetCMP0CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP0CompareCenterValue

PWM2SetCMP0CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,16

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetCMP1CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP1CompareCenterValue

PWM2SetCMP1CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,17

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,17
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetCMP2CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP2CompareCenterValue

PWM2SetCMP2CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,18

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,18
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetCMP3CompareCenterValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetCMP3CompareCenterValue

PWM2SetCMP3CompareCenterValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,19

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1
    slli t2,t2,19
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2EnableAlways###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2EnableAlways

PWM2EnableAlways:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,3
    slli t2,t2,12
    or t1,t1,t2
    xor t1,t1,t2

    srli t2,t2,13
    slli t2,t2,12
    or t1,t1,t2

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2EnableOneShot##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2EnableOneShot

PWM2EnableOneShot:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,3
    slli t2,t2,12
    or t1,t1,t2
    xor t1,t1,t2

    srli t2,t2,13
    slli t2,t2,13
    or t1,t1,t2

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2Disable########################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2Disable

PWM2Disable:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,3
    slli t2,t2,12
    or t1,t1,t2
    xor t1,t1,t2

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetDeglitchValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetDeglitchValue

PWM2SetDeglitchValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,10

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,1024
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetZeroCMPValue################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetZeroCMPValue

PWM2SetZeroCMPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,9

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,512
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetStickyValue#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetStickyValue

PWM2SetStickyValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    slli a0,a0,8

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,256
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PWM2SetPWMScaleValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetPWMScaleValue

PWM2SetPWMScaleValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,15

    li t0,PWM2_CTRL_ADDR
    lw t1,PWMCFG(t0)

    li t2,15
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    sw t1,PWMCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ############################################################################# #
# PWMCOUNT##################################################################### #
# ############################################################################# #

# ###################################################################### #
# PWM0SetPWMCOUNTValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetPWMCOUNTValue

PWM0SetPWMCOUNTValue:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t1,127
    slli t1,t1,8
    ori t1,t1,255
    slli t1,t1,8
    ori t1,t1,255

    and a0,a0,t1

    li t0,PWM0_CTRL_ADDR
    sw a0,PWMCOUNT(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# PWM1SetPWMCOUNTValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetPWMCOUNTValue

PWM1SetPWMCOUNTValue:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t1,127
    slli t1,t1,8
    ori t1,t1,255
    slli t1,t1,8
    ori t1,t1,255
    slli t1,t1,8
    ori t1,t1,255

    and a0,a0,t1

    li t0,PWM1_CTRL_ADDR
    sw a0,PWMCOUNT(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# PWM2SetPWMCOUNTValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetPWMCOUNTValue

PWM2SetPWMCOUNTValue:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t1,127
    slli t1,t1,8
    ori t1,t1,255
    slli t1,t1,8
    ori t1,t1,255
    slli t1,t1,8
    ori t1,t1,255

    and a0,a0,t1

    li t0,PWM2_CTRL_ADDR
    sw a0,PWMCOUNT(t0)
    
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ############################################################################# #
# PWMS######################################################################### #
# ############################################################################# #

# ###################################################################### #
# PWM0ReadPWMSValue##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0ReadPWMSValue

PWM0ReadPWMSValue:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM0_CTRL_ADDR
    sw a0,PWMS(t0)

    li t0,255
    andi a0,a0,t0

    lw t0,0(sp)
    addi sp,sp,4
    ret
    
# ###################################################################### #
# PWM1ReadPWMSValue##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1ReadPWMSValue

PWM1ReadPWMSValue:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM1_CTRL_ADDR
    sw a0,PWMS(t0)

    li t0,255
    slli t0,t0,8
    ori t0,t0,255
    andi a0,a0,t0

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM2ReadPWMSValue##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2ReadPWMSValue

PWM2ReadPWMSValue:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PWM2_CTRL_ADDR
    sw a0,PWMS(t0)

    li t0,255
    slli t0,t0,8
    ori t0,t0,255
    andi a0,a0,t0

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# PWMCMP0###################################################################### #
# ############################################################################# #

# ###################################################################### #
# PWM0SetPWMCMP0Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetPWMCMP0Value

PWM0SetPWMCMP0Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    and a0,a0,t0

    li t0,PWM0_CTRL_ADDR
    sw a0,PWMCMP0(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM1SetPWMCMP0Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetPWMCMP0Value

PWM1SetPWMCMP0Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    slli t0,t0,8
    andi t0,t0,255
    and a0,a0,t0

    li t0,PWM1_CTRL_ADDR
    sw a0,PWMCMP0(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM2SetPWMCMP0Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetPWMCMP0Value

PWM2SetPWMCMP0Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    slli t0,t0,8
    andi t0,t0,255
    and a0,a0,t0

    li t0,PWM2_CTRL_ADDR
    sw a0,PWMCMP0(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# PWMCMP1###################################################################### #
# ############################################################################# #

# ###################################################################### #
# PWM0SetPWMCMP1Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetPWMCMP1Value

PWM0SetPWMCMP1Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    and a0,a0,t0

    li t0,PWM0_CTRL_ADDR
    sw a0,PWMCMP1(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM1SetPWMCMP1Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetPWMCMP1Value

PWM1SetPWMCMP1Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    slli t0,t0,8
    andi t0,t0,255
    and a0,a0,t0

    li t0,PWM1_CTRL_ADDR
    sw a0,PWMCMP1(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM2SetPWMCMP1Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetPWMCMP1Value

PWM2SetPWMCMP1Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    slli t0,t0,8
    andi t0,t0,255
    and a0,a0,t0

    li t0,PWM2_CTRL_ADDR
    sw a0,PWMCMP1(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# PWMCMP2###################################################################### #
# ############################################################################# #

# ###################################################################### #
# PWM0SetPWMCMP2Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetPWMCMP2Value

PWM0SetPWMCMP2Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    and a0,a0,t0

    li t0,PWM0_CTRL_ADDR
    sw a0,PWMCMP2(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM1SetPWMCMP2Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetPWMCMP2Value

PWM1SetPWMCMP2Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    slli t0,t0,8
    andi t0,t0,255
    and a0,a0,t0

    li t0,PWM1_CTRL_ADDR
    sw a0,PWMCMP2(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM2SetPWMCMP2Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetPWMCMP2Value

PWM2SetPWMCMP2Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    slli t0,t0,8
    andi t0,t0,255
    and a0,a0,t0

    li t0,PWM2_CTRL_ADDR
    sw a0,PWMCMP2(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# PWMCMP3###################################################################### #
# ############################################################################# #

# ###################################################################### #
# PWM0SetPWMCMP3Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM0SetPWMCMP3Value

PWM0SetPWMCMP3Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    and a0,a0,t0

    li t0,PWM0_CTRL_ADDR
    sw a0,PWMCMP3(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM1SetPWMCMP3Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM1SetPWMCMP3Value

PWM1SetPWMCMP3Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    slli t0,t0,8
    andi t0,t0,255
    and a0,a0,t0

    li t0,PWM1_CTRL_ADDR
    sw a0,PWMCMP3(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# PWM2SetPWMCMP3Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PWM2SetPWMCMP3Value

PWM2SetPWMCMP3Value:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,255
    slli t0,t0,8
    andi t0,t0,255
    and a0,a0,t0

    li t0,PWM2_CTRL_ADDR
    sw a0,PWMCMP3(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret