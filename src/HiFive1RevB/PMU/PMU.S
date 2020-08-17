# #######################################################################################################
# 编写者：tao
# 文件：PMU.S
# 日期：2020.8.17
# 文件作用：定义PMU对电源管理的操作的汇编函数
# #######################################################################################################


.equ PMU_AON_CTRL_ADDR,0x10000000

.equ PMUWAKEUPI0,0x100
.equ PMUWAKEUPI1,0x104
.equ PMUWAKEUPI2,0x108
.equ PMUWAKEUPI3,0x10C
.equ PMUWAKEUPI4,0x110
.equ PMUWAKEUPI5,0x114
.equ PMUWAKEUPI6,0x118
.equ PMUWAKEUPI7,0x11C

.equ PMUSLEEPI0,0x120
.equ PMUSLEEPI1,0x124
.equ PMUSLEEPI2,0x128
.equ PMUSLEEPI3,0x12C
.equ PMUSLEEPI4,0x130
.equ PMUSLEEPI5,0x134
.equ PMUSLEEPI6,0x138
.equ PMUSLEEPI7,0x13C

.equ PMUIE,0x140
.equ PMUCAUSE,0x144
.equ PMUSLEEP,0x148
.equ PMUKEY,0x14C

# ############################################################################# #
# PMUWAKEUPIX################################################################## #
# ############################################################################# #

# ###################################################################### #
# SetPMUWAKEUPI0Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUWAKEUPI0Value

SetPMUWAKEUPI0Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUWAKEUPI0(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUWAKEUPI1Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUWAKEUPI1Value

SetPMUWAKEUPI1Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUWAKEUPI1(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUWAKEUPI2Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUWAKEUPI2Value

SetPMUWAKEUPI2Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUWAKEUPI2(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUWAKEUPI3Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUWAKEUPI3Value

SetPMUWAKEUPI3Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUWAKEUPI3(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUWAKEUPI4Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUWAKEUPI4Value

SetPMUWAKEUPI4Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUWAKEUPI4(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUWAKEUPI5Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUWAKEUPI5Value

SetPMUWAKEUPI5Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUWAKEUPI5(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUWAKEUPI6Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUWAKEUPI6Value

SetPMUWAKEUPI6Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUWAKEUPI6(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUWAKEUPI7Value################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUWAKEUPI7Value

SetPMUWAKEUPI7Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUWAKEUPI7(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ############################################################################# #
# PMUSLEEPIX################################################################### #
# ############################################################################# #

# ###################################################################### #
# SetPMUSLEEPI0Value#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUSLEEPI0Value

SetPMUSLEEPI0Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUSLEEPI0(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUSLEEPI1Value#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUSLEEPI1Value

SetPMUSLEEPI1Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUSLEEPI1(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUSLEEPI2Value#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUSLEEPI2Value

SetPMUSLEEPI2Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUSLEEPI2(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUSLEEPI3Value#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUSLEEPI3Value

SetPMUSLEEPI3Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUSLEEPI3(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUSLEEPI4Value#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUSLEEPI4Value

SetPMUSLEEPI4Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUSLEEPI4(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUSLEEPI5Value#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUSLEEPI5Value

SetPMUSLEEPI5Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUSLEEPI5(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUSLEEPI6Value#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUSLEEPI6Value

SetPMUSLEEPI6Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUSLEEPI6(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SetPMUSLEEPI7Value#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetPMUSLEEPI7Value

SetPMUSLEEPI7Value:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,495 # 1_1110_1111

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw a0,PMUSLEEPI7(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ############################################################################# #
# PMUIE######################################################################## #
# ############################################################################# #

# ###################################################################### #
# PMUWakeupEnableDwakeup################################################ #
# ###################################################################### #
.section .text
.align 2
.globl PMUWakeupEnableDwakeup

PMUWakeupEnableDwakeup:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PMU_AON_CTRL_ADDR
    lw t2,PMUIE(t0)

    ori t2,t2,4

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw t2,PMUSLEEPI0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PMUWakeupDisableDwakeup############################################### #
# ###################################################################### #
.section .text
.align 2
.globl PMUWakeupDisableDwakeup

PMUWakeupDisableDwakeup:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PMU_AON_CTRL_ADDR
    lw t2,PMUIE(t0)

    ori t2,t2,4
    xori t2,t2,4

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw t2,PMUSLEEPI0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PMUWakeupEnableRTC#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PMUWakeupEnableRTC

PMUWakeupEnableRTC:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PMU_AON_CTRL_ADDR
    lw t2,PMUIE(t0)

    ori t2,t2,2

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw t2,PMUSLEEPI0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# PMUWakeupDisableRTC################################################### #
# ###################################################################### #
.section .text
.align 2
.globl PMUWakeupDisableRTC

PMUWakeupDisableRTC:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    li t0,PMU_AON_CTRL_ADDR
    lw t2,PMUIE(t0)

    ori t2,t2,2
    xori t2,t2,2

    li t1,0x51F15E
    sw t1,PMUKEY(t0)

    sw t2,PMUSLEEPI0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ############################################################################# #
# PMUCAUSE##################################################################### #
# ############################################################################# #

# ###################################################################### #
# ReadPMUCAUSEValue##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl ReadPMUCAUSEValue

ReadPMUCAUSEValue:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PMU_AON_CTRL_ADDR
    lw a0,PMUCAUSE(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# PMUSLEEP##################################################################### #
# ############################################################################# #

# ###################################################################### #
# CoreSleep############################################################# #
# ###################################################################### #
.section .text
.align 2
.globl CoreSleep

CoreSleep:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,PMU_AON_CTRL_ADDR

    li t1,0x51F15E
    sw t1,PMUKEY(t0)
    sw t1,PMUSLEEP(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret
