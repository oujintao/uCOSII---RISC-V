# #######################################################################################################
# 编写者：tao
# 文件：WDT.S
# 日期：2020.8.17
# 文件作用：定义WatchDog的管理的汇编函数
# #######################################################################################################

.equ WDT_CTRL_ADDR,0x10000000

.equ WDOGCFG,0x00
.equ WDOGCOUNT,0x08
.equ WDOGS,0x10
.equ WDOGFEED,0x18
.equ WDOGKEY,0x1C
.equ WDOGCMP,0x20

# ############################################################################# #
# WDOGCFG###################################################################### #
# ############################################################################# #

# ###################################################################### #
# WDTCheckIP############################################################ #
# ###################################################################### #
.section .text
.align 2
.globl WDTCheckIP

WDTCheckIP:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,WDT_CTRL_ADDR
    lw a0,WDOGCFG(t0)

    srli a0,a0,28
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# WDTSetIPValue######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl WDTSetIPValue

WDTSetIPValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,1
    li t2,1
    slli t2,t2,28
    slli a0,a0,28

    li t0,WDT_CTRL_ADDR
    lw t1,WDOGCFG(t0)

    or t1,t1,t2
    xor t1,t1,t2
    or t1,t1,a0

    li t2,0x51F15E
    sw t2,WDOGKEY(t0)
    sw t1,WDOGCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# WDTEnableCoreAwake#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl WDTEnableCoreAwake

WDTEnableCoreAwake:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)
    
    li t2,1
    slli t2,t2,13

    li t0,WDT_CTRL_ADDR
    lw t1,WDOGCFG(t0)

    or t1,t1,t2

    sw t1,WDOGCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# WDTDisableCoreAwake################################################### #
# ###################################################################### #
.section .text
.align 2
.globl WDTDisableCoreAwake

WDTDisableCoreAwake:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t2,1
    slli t2,t2,13

    li t0,WDT_CTRL_ADDR
    lw t1,WDOGCFG(t0)

    or t1,t1,t2
    xor t1,t1,t2

    sw t1,WDOGCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# WDTEnableAlways####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl WDTEnableAlways

WDTEnableAlways:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t2,1
    slli t2,t2,12

    li t0,WDT_CTRL_ADDR
    lw t1,WDOGCFG(t0)

    or t1,t1,t2

    sw t1,WDOGCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# WDTDisableAlways####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl WDTDisableAlways

WDTDisableAlways:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t2,1
    slli t2,t2,12

    li t0,WDT_CTRL_ADDR
    lw t1,WDOGCFG(t0)

    or t1,t1,t2
    xor t1,t1,t2

    sw t1,WDOGCFG(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# WDTEnableZeroCMP###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl WDTEnableZeroCMP

WDTEnableZeroCMP:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,WDT_CTRL_ADDR
    lw t1,WDOGCFG(t0)

    ori t1,t1,512

    sw t1,WDOGCFG(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# WDTDisableZeroCMP##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl WDTEnableZeroCMP

WDTEnableZeroCMP:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,WDT_CTRL_ADDR
    lw t1,WDOGCFG(t0)

    ori t1,t1,512
    xori t1,t1,512

    sw t1,WDOGCFG(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# WDTEnableRSTEN######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl WDTEnableRSTEN

WDTEnableRSTEN:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,WDT_CTRL_ADDR
    lw t1,WDOGCFG(t0)

    ori t1,t1,256

    sw t1,WDOGCFG(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# WDTDisableRSTEN####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl WDTDisableRSTEN

WDTDisableRSTEN:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,WDT_CTRL_ADDR
    lw t1,WDOGCFG(t0)

    ori t1,t1,256
    xori t1,t1,256

    sw t1,WDOGCFG(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# WDTSetScaleValue###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl WDTSetScaleValue

WDTSetScaleValue:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t2,15
    andi a0,a0,15

    li t0,WDT_CTRL_ADDR
    lw t1,WDOGCFG(t0)

    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0

    li t2,0x51F15E
    sw t2,WDOGKEY(t0)
    sw t1,WDOGCFG(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ############################################################################# #
# WDOGCOUNT#################################################################### #
# ############################################################################# #

# ###################################################################### #
# WDTGetWDOGCOUNTValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl WDTGetWDOGCOUNTValue

WDTGetWDOGCOUNTValue:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,WDT_CTRL_ADDR
    lw a0,WDOGCOUNT(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# WDTSetWDOGCOUNTValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl WDTSetWDOGCOUNTValue

WDTSetWDOGCOUNTValue:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,WDT_CTRL_ADDR

    li t2,0x51F15E
    sw t2,WDOGKEY(t0)
    sw a0,WDOGCOUNT(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# WDOGS######################################################################## #
# ############################################################################# #

# ###################################################################### #
# WDTGetWDOGSValue################################################## #
# ###################################################################### #
.section .text
.align 2
.globl WDTGetWDOGSValue

WDTGetWDOGSValue:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,WDT_CTRL_ADDR
    lw a0,WDOGS(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# WDOGFEED##################################################################### #
# ############################################################################# #

# ###################################################################### #
# WDTFeed############################################################### #
# ###################################################################### #
.section .text
.align 2
.globl WDTFeed

WDTFeed:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t1,0xD09F00D

    li t0,WDT_CTRL_ADDR
    sw t1,WDOGFEED(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ############################################################################# #
# WDOGKEY###################################################################### #
# ############################################################################# #

# ###################################################################### #
# WDTObtainKey########################################################## #
# ###################################################################### #
.section .text
.align 2
.globl WDTObtainKey

WDTObtainKey:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t1,0x51F15E

    li t0,WDT_CTRL_ADDR
    sw t1,WDOGKEY(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ############################################################################# #
# WDOGCMP###################################################################### #
# ############################################################################# #

# ###################################################################### #
# WDTSetCMPValue######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl WDTSetCMPValue

WDTSetCMPValue:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,WDT_CTRL_ADDR
    li t2,0x51F15E
    sw t2,WDOGKEY(t0)
    sw a0,WDOGKEY(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret