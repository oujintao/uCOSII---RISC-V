# #######################################################################################################
# 编写者：tao
# 文件：PLIC.S
# 日期：2020.8.17
# 文件作用：定义PLIC中断源管理的汇编函数
# #######################################################################################################

.equ SOURCE1_PRIORITY,0x0C000004
.equ SOURCE2_PRIORITY,0x0C000004
.equ SOURCE3_PRIORITY,0x0C000008
.equ SOURCE4_PRIORITY,0x0C00000C
.equ SOURCE5_PRIORITY,0x0C000010
.equ SOURCE6_PRIORITY,0x0C000014
.equ SOURCE7_PRIORITY,0x0C000018
.equ SOURCE8_PRIORITY,0x0C00001C
.equ SOURCE9_PRIORITY,0x0C000020
.equ SOURCE10_PRIORITY,0x0C000024
.equ SOURCE11_PRIORITY,0x0C000028
.equ SOURCE12_PRIORITY,0x0C00002C
.equ SOURCE13_PRIORITY,0x0C000030
.equ SOURCE14_PRIORITY,0x0C000034
.equ SOURCE15_PRIORITY,0x0C000038
.equ SOURCE16_PRIORITY,0x0C00003C
.equ SOURCE17_PRIORITY,0x0C000040
.equ SOURCE18_PRIORITY,0x0C000044
.equ SOURCE19_PRIORITY,0x0C000048
.equ SOURCE20_PRIORITY,0x0C00004C
.equ SOURCE21_PRIORITY,0x0C000050
.equ SOURCE22_PRIORITY,0x0C000054
.equ SOURCE23_PRIORITY,0x0C000058
.equ SOURCE24_PRIORITY,0x0C00005C
.equ SOURCE25_PRIORITY,0x0C000060
.equ SOURCE26_PRIORITY,0x0C000064
.equ SOURCE27_PRIORITY,0x0C000068
.equ SOURCE28_PRIORITY,0x0C00006C
.equ SOURCE29_PRIORITY,0x0C000070
.equ SOURCE30_PRIORITY,0x0C000074
.equ SOURCE31_PRIORITY,0x0C000078
.equ SOURCE32_PRIORITY,0x0C00007C
.equ SOURCE33_PRIORITY,0x0C000080
.equ SOURCE34_PRIORITY,0x0C000084
.equ SOURCE35_PRIORITY,0x0C000088
.equ SOURCE36_PRIORITY,0x0C00008C
.equ SOURCE37_PRIORITY,0x0C000090
.equ SOURCE38_PRIORITY,0x0C000094
.equ SOURCE39_PRIORITY,0x0C000098
.equ SOURCE40_PRIORITY,0x0C00009C
.equ SOURCE41_PRIORITY,0x0C0000A0
.equ SOURCE42_PRIORITY,0x0C0000A4
.equ SOURCE43_PRIORITY,0x0C0000A8
.equ SOURCE44_PRIORITY,0x0C0000AC
.equ SOURCE45_PRIORITY,0x0C0000B0
.equ SOURCE46_PRIORITY,0x0C0000B4
.equ SOURCE47_PRIORITY,0x0C0000B8
.equ SOURCE48_PRIORITY,0x0C0000BC
.equ SOURCE49_PRIORITY,0x0C0000C0
.equ SOURCE50_PRIORITY,0x0C0000C4
.equ SOURCE51_PRIORITY,0x0C0000C8

.equ PENDING_ARRAY1,0x0C000FFC
.equ PENDING_ARRAY2,0x0C001000

.equ TARGET0_ENABLES1,0x0C002000
.equ TARGET0_ENABLES2,0x0C002004
.equ TARGET0_PRIORITY_THRESHOLD,0x0C200000
.equ TARGET0_CLAIMANDCOMPLETE,0x0C200004

# ############################################################################# #
# SOURCEX_PRIORITY############################################################# #
# ############################################################################# #

# ###################################################################### #
# SetSourceXPriority#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetSource1Priority

SetSource1Priority:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SOURCE1_PRIORITY
    sw a0,0(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

.section.text
.align 2
.globl SetSource2Priority

SetSource2Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE2_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource3Priority

SetSource3Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE3_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource4Priority

SetSource4Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE4_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource5Priority

SetSource5Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE5_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource6Priority

SetSource6Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE6_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource7Priority

SetSource7Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE7_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource8Priority

SetSource8Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE8_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource9Priority

SetSource9Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE9_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource10Priority

SetSource10Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE10_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource11Priority

SetSource11Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE11_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource12Priority

SetSource12Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE12_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource13Priority

SetSource13Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE13_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource14Priority

SetSource14Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE14_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource15Priority

SetSource15Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE15_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource16Priority

SetSource16Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE16_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource17Priority

SetSource17Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE17_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource18Priority

SetSource18Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE18_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource19Priority

SetSource19Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE19_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource20Priority

SetSource20Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE20_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource21Priority

SetSource21Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE21_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource22Priority

SetSource22Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE22_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource23Priority

SetSource23Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE23_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource24Priority

SetSource24Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE24_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource25Priority

SetSource25Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE25_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource26Priority

SetSource26Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE26_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource27Priority

SetSource27Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE27_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource28Priority

SetSource28Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE28_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource29Priority

SetSource29Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE29_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource30Priority

SetSource30Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE30_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource31Priority

SetSource31Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE31_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource32Priority

SetSource32Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE32_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource33Priority

SetSource33Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE33_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource34Priority

SetSource34Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE34_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource35Priority

SetSource35Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE35_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource36Priority

SetSource36Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE36_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource37Priority

SetSource37Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE37_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource38Priority

SetSource38Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE38_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource39Priority

SetSource39Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE39_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource40Priority

SetSource40Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE40_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource41Priority

SetSource41Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE41_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource42Priority

SetSource42Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE42_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource43Priority

SetSource43Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE43_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource44Priority

SetSource44Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE44_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource45Priority

SetSource45Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE45_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource46Priority

SetSource46Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE46_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource47Priority

SetSource47Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE47_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource48Priority

SetSource48Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE48_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource49Priority

SetSource49Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE49_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource50Priority

SetSource50Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE50_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

.section.text
.align 2
.globl SetSource51Priority

SetSource51Priority:
        addi sp,sp,-4
        sw t0,0(sp)

        li t0,SOURCE51_PRIORITY
        sw a0,0(t0)

        lw t0,0(sp)
        addi sp,sp,4
        ret

# ############################################################################# #
# SOURCE_PENDING############################################################### #
# ############################################################################# #

# ###################################################################### #
# CheckSourcePending#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl CheckSourcePending

CheckSourcePending:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    blt a0,zero,CheckSourcePendingEnd

    li t0,32
    bge a0,t0,CheckSourcePendingAddr2
    li t0,PENDING_ARRAY1
    lw t1,0(t0)
    srl a0,t1,a0
    andi a0,a0,1
    j CheckSourcePendingEnd
CheckSourcePendingAddr2:
    addi a0,a0,-32
    li t0,PENDING_ARRAY2
    lw t1,0(t0)
    srl a0,t1,a0
    andi a0,a0,1
CheckSourcePendingEnd:
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# ClearSourcePending#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl ClearSourcePending

ClearSourcePending:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    blt a0,zero,ClearSourcePendingEnd

    li t0,32
    bge a0,t0,ClearSourcePendingAddr2
    li t0,PENDING_ARRAY1
    lw t1,0(t0)
    li t2,1
    sll t2,t2,a0
    
    or t1,t1,t2
    xor t1,t1,t2

    sw t1,0(t0)

    j ClearSourcePendingEnd
ClearSourcePendingAddr2:
    addi a0,a0,-32
    li t0,PENDING_ARRAY2
    lw t1,0(t0)
    li t2,1
    sll t2,t2,a0
    
    or t1,t1,t2
    xor t1,t1,t2

    sw t1,0(t0)
ClearSourcePendingEnd:
    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ############################################################################# #
# TARGET0_ENABLESX############################################################# #
# ############################################################################# #

# ###################################################################### #
# Target0InterruptXEnable############################################### #
# ###################################################################### #
.section .text
.align 2
.globl Target0InterruptXEnable
Target0InterruptXEnable:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    blt a0,zero,Target0InterruptXEnableEnd

    li t0,32
    bge a0,t0,Target0InterruptXEnableAddr2
    li t0,TARGET0_ENABLES1
    lw t1,0(t0)
    li t2,1
    sll t2,t2,a0
    
    or t1,t1,t2

    sw t1,0(t0)

    j Target0InterruptXEnableEnd
Target0InterruptXEnableAddr2:
    addi a0,a0,-32
    li t0,TARGET0_ENABLES2
    lw t1,0(t0)
    li t2,1
    sll t2,t2,a0
    
    or t1,t1,t2

    sw t1,0(t0)
Target0InterruptXEnableEnd:
    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# Target0InterruptXDisable############################################## #
# ###################################################################### #
.section .text
.align 2
.globl Target0InterruptXDisable
Target0InterruptXDisable:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    blt a0,zero,Target0InterruptXDisableEnd

    li t0,32
    bge a0,t0,Target0InterruptXDisableAddr2
    li t0,PENDING_ARRAY1
    lw t1,0(t0)
    li t2,1
    sll t2,t2,a0
    
    or t1,t1,t2
    xor t1,t1,t2

    sw t1,0(t0)

    j Target0InterruptXDisableEnd
Target0InterruptXDisableAddr2:
    addi a0,a0,-32
    li t0,PENDING_ARRAY2
    lw t1,0(t0)
    li t2,1
    sll t2,t2,a0
    
    or t1,t1,t2
    xor t1,t1,t2

    sw t1,0(t0)
Target0InterruptXDisableEnd:
    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ############################################################################# #
# TARGET0_PRIORITY_THRESHOLD################################################### #
# ############################################################################# #

# ###################################################################### #
# SetTarget0PriorityThreshold########################################### #
# ###################################################################### #
.section .text
.align 2
.globl SetTarget0PriorityThreshold
SetTarget0PriorityThreshold:
    addi sp,sp,-4
    sw t0,0(sp)

    andi a0,a0,7
    li t0,TARGET0_PRIORITY_THRESHOLD
    sw a0,0(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# TARGET0_CLAIMANDCOMPLETE##################################################### #
# ############################################################################# #

# ###################################################################### #
# CheckTarget0Claim##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl CheckTarget0Claim
CheckTarget0Claim:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,TARGET0_PRIORITY_THRESHOLD
    lw a0,0(t0)
    andi a0,a0,1

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# ClearTarget0Complete################################################## #
# ###################################################################### #
.section .text
.align 2
.globl ClearTarget0Complete
ClearTarget0Complete:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,TARGET0_PRIORITY_THRESHOLD
    sw zero,0(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

