# #######################################################################################################
# 编写者：tao
# 文件：SPI.S
# 日期：2020.8.17
# 文件作用：定义SPI接口操作的汇编函数
# #######################################################################################################

# .include "HiFiveRevBSPIMemorymap.inc"

.equ SPI0_CTRL_ADDR,0x10014000
.equ SPI1_CTRL_ADDR,0x10024000
.equ SPI2_CTRL_ADDR,0x10034000

.equ SCKDIV,0x00
.equ SCKMODE,0x04
.equ CSID,0x10
.equ CSDEF,0x14
.equ CSMODE,0x18
.equ DELAY0,0x28
.equ DELAY1,0x2C
.equ FMT,0x40
.equ TXDATA,0x48
.equ RXDATA,0x4C
.equ TXMARK,0x50
.equ RXMARK,0x54
.equ FCTRL,0x60
.equ FFMT,0x64
.equ IE,0x70
.equ IP,0x74

# ############################################################################# #
# SCKDIV####################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0SetFSCKDiv######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetFSCKDiv

SPI0SetFSCKDiv:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI0_CTRL_ADDR

    lw t1,SCKDIV(t0)
    xor t1,t1,t1
    or t1,t1,a0

    sw t1,SCKDIV(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI1SetFSCKDiv######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetFSCKDiv

SPI1SetFSCKDiv:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI1_CTRL_ADDR

    lw t1,SCKDIV(t0)
    xor t1,t1,t1
    or t1,t1,a0

    sw t1,SCKDIV(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI2SetFSCKDiv######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetFSCKDiv

SPI2SetFSCKDiv:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI2_CTRL_ADDR

    lw t1,SCKDIV(t0)
    xor t1,t1,t1
    or t1,t1,a0

    sw t1,SCKDIV(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ############################################################################# #
# SCKMODE###################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0SetSCKPolarityAndPhase############################################ #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetSCKPolarityAndPhase

SPI0SetSCKPolarityAndPhase:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI0_CTRL_ADDR
    andi a0,a0,3
    sw a0,SCKMODE(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI1SetSCKPolarityAndPhase############################################ #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetSCKPolarityAndPhase

SPI1SetSCKPolarityAndPhase:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI1_CTRL_ADDR
    andi a0,a0,3
    sw a0,SCKMODE(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI2SetSCKPolarityAndPhase############################################ #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetSCKPolarityAndPhase

SPI2SetSCKPolarityAndPhase:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI2_CTRL_ADDR
    andi a0,a0,3
    sw a0,SCKMODE(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# CSID######################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0SetChipSelectID################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetChipSelectID

SPI0SetChipSelectID:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI0_CTRL_ADDR
    sw a0,CSID(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI1SetChipSelectID################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetChipSelectID

SPI1SetChipSelectID:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI1_CTRL_ADDR
    sw a0,CSID(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI2SetChipSelectID################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetChipSelectID

SPI2SetChipSelectID:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI2_CTRL_ADDR
    sw a0,CSID(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# CSDEF######################################################################## #
# ############################################################################# #

# ###################################################################### #
# SPI0SetChipSelectDefaultValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetChipSelectDefaultValue

SPI0SetChipSelectDefaultValue:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI0_CTRL_ADDR
    sw a0,CSDEF(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI1SetChipSelectDefaultValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetChipSelectDefaultValue

SPI1SetChipSelectDefaultValue:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI1_CTRL_ADDR
    sw a0,CSDEF(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI2SetChipSelectDefaultValue######################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetChipSelectDefaultValue

SPI2SetChipSelectDefaultValue:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI2_CTRL_ADDR
    sw a0,CSDEF(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# CSMODE####################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0SetCSModeOFF3HOLD2AUTO0########################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetCSModeOFF3HOLD2AUTO0

SPI0SetCSModeOFF3HOLD2AUTO0:
    addi sp,sp,-4
    sw t0,0(sp)

    andi a0,a0,3

    li t0,1
    beq t0,a0,SPI0SetCSModeOFF3HOLD2AUTO0End

    li t0,SPI0_CTRL_ADDR
    sw a0,CSMODE(t0)

SPI0SetCSModeOFF3HOLD2AUTO0End:
    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI1SetCSModeOFF3HOLD2AUTO0########################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetCSModeOFF3HOLD2AUTO0

SPI1SetCSModeOFF3HOLD2AUTO0:
    addi sp,sp,-4
    sw t0,0(sp)

    andi a0,a0,3

    li t0,1
    beq t0,a0,SPI1SetCSModeOFF3HOLD2AUTO0End

    li t0,SPI1_CTRL_ADDR
    sw a0,CSMODE(t0)

SPI1SetCSModeOFF3HOLD2AUTO0End:
    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI2SetCSModeOFF3HOLD2AUTO0########################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetCSModeOFF3HOLD2AUTO0

SPI2SetCSModeOFF3HOLD2AUTO0:
    addi sp,sp,-4
    sw t0,0(sp)

    andi a0,a0,3

    li t0,1
    beq t0,a0,SPI2SetCSModeOFF3HOLD2AUTO0End

    li t0,SPI2_CTRL_ADDR
    sw a0,CSMODE(t0)

SPI2SetCSModeOFF3HOLD2AUTO0End:
    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# DELAY0####################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0SetSCKCS########################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetSCKCS

SPI0SetSCKCS:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255
    slli a0,a0,16

    li t0,SPI0_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI0SetCSSCK########################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetCSSCK

SPI0SetCSSCK:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255

    li t0,SPI0_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI1SetSCKCS########################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetSCKCS

SPI1SetSCKCS:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255
    slli a0,a0,16

    li t0,SPI1_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI1SetCSSCK########################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetCSSCK

SPI1SetCSSCK:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255

    li t0,SPI1_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI2SetSCKCS########################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetSCKCS

SPI2SetSCKCS:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255
    slli a0,a0,16

    li t0,SPI2_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI2SetCSSCK########################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetCSSCK

SPI2SetCSSCK:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255

    li t0,SPI2_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ############################################################################# #
# DELAY1####################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0SetInterxfr####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetInterxfr

SPI0SetInterxfr:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255
    slli a0,a0,16

    li t0,SPI0_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI0SetIntercs######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetIntercs

SPI0SetIntercs:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255

    li t0,SPI0_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI1SetInterxfr####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetInterxfr

SPI1SetInterxfr:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255
    slli a0,a0,16

    li t0,SPI1_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI1SetIntercs######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetIntercs

SPI1SetIntercs:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255

    li t0,SPI1_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI2SetInterxfr####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetInterxfr

SPI2SetInterxfr:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255
    slli a0,a0,16

    li t0,SPI2_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI2SetIntercs######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetIntercs

SPI2SetIntercs:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255

    li t0,SPI2_CTRL_ADDR
    lw t1,DELAY0(t0)

    addi t2,zero,255
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,DELAY0(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ############################################################################# #
# FMT########################################################################## #
# ############################################################################# #

# ###################################################################### #
# SPI0SetProto########################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetProto

SPI0SetProto:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,3
    li t0,3

    beq a0,t0,SPI0SetProtoEnd

    li t0,SPI0_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,3
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

SPI0SetProtoEnd:
    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI0SetEndianLSBMSB################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetEndianLSBMSB

SPI0SetEndianLSBMSB:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,4

    li t0,SPI0_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,4
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI0SetDirTXOrRX################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetDirTXOrRX

SPI0SetDirTXOrRX:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,8

    li t0,SPI0_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,8
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI0SetLen################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetLen

SPI0SetLen:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,16
    slli a0,a0,16

    li t0,SPI0_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,16
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI1SetProto########################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetProto

SPI1SetProto:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,3
    li t0,3

    beq a0,t0,SPI1SetProtoEnd

    li t0,SPI1_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,3
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

SPI1SetProtoEnd:
    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI1SetEndianLSBMSB################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetEndianLSBMSB

SPI1SetEndianLSBMSB:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,4

    li t0,SPI1_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,4
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI1SetDirTXOrRX################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetDirTXOrRX

SPI1SetDirTXOrRX:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,8

    li t0,SPI1_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,8
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI1SetLen################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetLen

SPI1SetLen:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,16
    slli a0,a0,16

    li t0,SPI1_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,16
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI2SetProto########################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetProto

SPI2SetProto:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,3
    li t0,3

    beq a0,t0,SPI2SetProtoEnd

    li t0,SPI2_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,3
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

SPI2SetProtoEnd:
    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI2SetEndianLSBMSB################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetEndianLSBMSB

SPI2SetEndianLSBMSB:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,4

    li t0,SPI2_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,4
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI2SetDirTXOrRX################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetDirTXOrRX

SPI2SetDirTXOrRX:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,8

    li t0,SPI2_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,8
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI2SetLen################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetLen

SPI2SetLen:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,16
    slli a0,a0,16

    li t0,SPI2_CTRL_ADDR
    lw t1,FMT(t0)

    addi t2,zero,16
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,FMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ############################################################################# #
# TXDATA####################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0TXCheckFull####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0TXCheckFull

SPI0TXCheckFull:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI0_CTRL_ADDR
    lw a0,TXDATA(t0)
    srli a0,a0,31

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI0TXWriteData####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0TXWriteData

SPI0TXWriteData:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI0_CTRL_ADDR
    sw a0,TXDATA(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI1TXCheckFull####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1TXCheckFull

SPI1TXCheckFull:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI1_CTRL_ADDR
    lw a0,TXDATA(t0)
    srli a0,a0,31

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI1TXWriteData####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1TXWriteData

SPI1TXWriteData:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI1_CTRL_ADDR
    sw a0,TXDATA(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret
# ###################################################################### #
# SPI2TXCheckFull####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2TXCheckFull

SPI2TXCheckFull:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI2_CTRL_ADDR
    lw a0,TXDATA(t0)
    srli a0,a0,31

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI2TXWriteData####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2TXWriteData

SPI2TXWriteData:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI2_CTRL_ADDR
    sw a0,TXDATA(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# RXDATA####################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0RXCheckEmpty###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0RXCheckEmpty

SPI0RXCheckEmpty:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI0_CTRL_ADDR
    lw a0,RXDATA(t0)
    srli a0,a0,31

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI0RXReadData######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI0RXReadData

SPI0RXReadData:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI0_CTRL_ADDR
    sw a0,TXDATA(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI1RXCheckEmpty###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1RXCheckEmpty

SPI1RXCheckEmpty:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI1_CTRL_ADDR
    lw a0,RXDATA(t0)
    srli a0,a0,31

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI1RXReadData######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI1RXReadData

SPI1RXReadData:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI1_CTRL_ADDR
    sw a0,TXDATA(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI2RXCheckEmpty###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2RXCheckEmpty

SPI2RXCheckEmpty:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI2_CTRL_ADDR
    lw a0,RXDATA(t0)
    srli a0,a0,31

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI2RXReadData######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI2RXReadData

SPI2RXReadData:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI2_CTRL_ADDR
    sw a0,TXDATA(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# TXMARK####################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0SetTXMark######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetTXMark

SPI0SetTXMark:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI0_CTRL_ADDR
    sw a0,TXMARK(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI1SetTXMark######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetTXMark

SPI1SetTXMark:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI1_CTRL_ADDR
    sw a0,TXMARK(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI2SetTXMark######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetTXMark

SPI2SetTXMark:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI2_CTRL_ADDR
    sw a0,TXMARK(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# RXMARK####################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0SetRXMark######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetRXMark

SPI0SetRXMark:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI0_CTRL_ADDR
    sw a0,RXMARK(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI1SetRXMark######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1SetRXMark

SPI1SetRXMark:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI1_CTRL_ADDR
    sw a0,RXMARK(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI2SetRXMark######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2SetRXMark

SPI2SetRXMark:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI2_CTRL_ADDR
    sw a0,RXMARK(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# FCTRL######################################################################## #
# ############################################################################# #

# ###################################################################### #
# SPI0FlashXiPEnable#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0FlashXiPEnable

SPI0FlashXiPEnable:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI0_CTRL_ADDR
    lw t1,FCTRL(t0)
    ori t1,t1,1
    sw t1,FCTRL(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ###################################################################### #
# SPI0FlashXiPDisable#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0FlashXiPDisable

SPI0FlashXiPDisable:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,SPI0_CTRL_ADDR
    sw zero,FCTRL(t0)

    lw t0,0(sp)
    addi sp,sp,4
    ret

# ############################################################################# #
# FFMT######################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0SendCmdEnable##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SendCmdEnable

SPI0SendCmdEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI0_CTRL_ADDR
    lw t1,FFMT(t0)
    ori t1,t1,1
    sw t1,FFMT(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI0SendCmdDisable#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SendCmdDisable

SPI0SendCmdDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI0_CTRL_ADDR
    lw t1,FFMT(t0)
    ori t1,t1,1
    xori t1,t1,1
    sw t1,FFMT(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI0SetADDRLen0To4#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetADDRLen0To4

SPI0SetADDRLen0To4:
    addi sp,sp,-8
    sw t0,0(sp)

    andi a0,a0,7
    li t0,5
    bge a0,t0,SPI0SetADDRLen0To4End

    sw t1,4(sp)

    slli a0,a0,1

    li t0,SPI0_CTRL_ADDR
    lw t1,FFMT(t0)

    ori t1,t1,14 # 1110
    xori t1,t1,14 # 1110
    or t1,t1,a0

    sw t1,FFMT(t0)

    lw t1,4(sp)
SPI0SetADDRLen0To4End:
    lw t0,0(sp)
    addi sp,sp,8
    ret


# ###################################################################### #
# SPI0SetDummyCyclesCount############################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetDummyCyclesCount

SPI0SetDummyCyclesCount:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,15 # 7 6 5 4
    slli a0,a0,4

    li t0,SPI0_CTRL_ADDR
    lw t1,FFMT(t0)

    ori t1,t1,240 # 1111 0000
    xori t1,t1,240 # 1111 0000
    or t1,t1,a0

    sw t1,FFMT(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI0SetCMDProto####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetCMDProto

SPI0SetCMDProto:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    andi a0,a0,3 # 9 8
    slli a0,a0,8

    li t0,SPI0_CTRL_ADDR
    lw t1,FFMT(t0)

    ori t1,t1,768 # 11 0000 0000
    xori t1,t1,768 # 11 0000 0000
    or t1,t1,a0

    sw t1,FFMT(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI0SetADDRProto###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetADDRProto

SPI0SetADDRProto:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,3 # 11 10
    slli a0,a0,10

    li t0,SPI0_CTRL_ADDR
    lw t1,FFMT(t0)

    li t2,3
    slli t2,t2,10
    or t1,t1,t2 # 1100 0000 0000
    xor t1,t1,t2 # 1100 0000 0000
    or t1,t1,a0

    sw t1,FFMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI0SetDataProto###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetDataProto

SPI0SetDataProto:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,3 # 13 12
    slli a0,a0,12

    li t0,SPI0_CTRL_ADDR
    lw t1,FFMT(t0)

    li t2,3
    slli t2,t2,12

    or t1,t1,t2 # 11 0000 0000 0000
    xor t1,t1,t2 # 11 0000 0000 0000
    or t1,t1,a0

    sw t1,FFMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI0SetCMDCode######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetCMDCode

SPI0SetCMDCode:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255 # 13 12
    slli a0,a0,16

    li t0,SPI0_CTRL_ADDR
    lw t1,FFMT(t0)

    li t2,255
    slli t2,t2,16

    or t1,t1,t2 # 23 - 16
    xor t1,t1,t2 # 23 - 16
    or t1,t1,a0

    sw t1,FFMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ###################################################################### #
# SPI0SetPadCode8Bit#################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0SetPadCode8Bit

SPI0SetPadCode8Bit:
    addi sp,sp,-12
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)

    andi a0,a0,255 # 31 - 24
    slli a0,a0,24

    li t0,SPI0_CTRL_ADDR
    lw t1,FFMT(t0)

    li t2,255
    slli t2,t2,24

    or t1,t1,t2 # 31 - 24
    xor t1,t1,t2 # 31 - 24
    or t1,t1,a0

    sw t1,FFMT(t0)

    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,12
    ret

# ############################################################################# #
# IE########################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0TXInterruptEnable################################################# #
# ###################################################################### #
.section .text
.align 2
.globl SPI0TXInterruptEnable

SPI0TXInterruptEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI0_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,1
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI0TXInterruptDisable################################################ #
# ###################################################################### #
.section .text
.align 2
.globl SPI0TXInterruptDisable

SPI0TXInterruptDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI0_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,1
    xori t1,t1,1
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI0RXInterruptEnable################################################# #
# ###################################################################### #
.section .text
.align 2
.globl SPI0RXInterruptEnable

SPI0RXInterruptEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI0_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,2
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI0RXInterruptDisable################################################ #
# ###################################################################### #
.section .text
.align 2
.globl SPI0RXInterruptDisable

SPI0RXInterruptDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI0_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,2
    xori t1,t1,2
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI1TXInterruptEnable################################################# #
# ###################################################################### #
.section .text
.align 2
.globl SPI1TXInterruptEnable

SPI1TXInterruptEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI1_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,1
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI1TXInterruptDisable################################################ #
# ###################################################################### #
.section .text
.align 2
.globl SPI1TXInterruptDisable

SPI1TXInterruptDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI1_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,1
    xori t1,t1,1
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI1RXInterruptEnable################################################# #
# ###################################################################### #
.section .text
.align 2
.globl SPI1RXInterruptEnable

SPI1RXInterruptEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI1_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,2
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI1RXInterruptDisable################################################ #
# ###################################################################### #
.section .text
.align 2
.globl SPI1RXInterruptDisable

SPI1RXInterruptDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI1_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,2
    xori t1,t1,2
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI2TXInterruptEnable################################################# #
# ###################################################################### #
.section .text
.align 2
.globl SPI2TXInterruptEnable

SPI2TXInterruptEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI2_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,1
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI2TXInterruptDisable################################################ #
# ###################################################################### #
.section .text
.align 2
.globl SPI2TXInterruptDisable

SPI2TXInterruptDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI2_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,1
    xori t1,t1,1
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI2RXInterruptEnable################################################# #
# ###################################################################### #
.section .text
.align 2
.globl SPI2RXInterruptEnable

SPI2RXInterruptEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI2_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,2
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI2RXInterruptDisable################################################ #
# ###################################################################### #
.section .text
.align 2
.globl SPI2RXInterruptDisable

SPI2RXInterruptDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI2_CTRL_ADDR
    lw t1,IE(t0)
    ori t1,t1,2
    xori t1,t1,2
    sw t1,IE(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ############################################################################# #
# IP########################################################################### #
# ############################################################################# #

# ###################################################################### #
# SPI0CheckTXIP######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0CheckTXIP

SPI0CheckTXIP:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI0_CTRL_ADDR
    lw a0,IP(t0)
    li t2,1
    and a0,a0,t2

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI0CheckRXIP######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI0CheckRXIP

SPI0CheckRXIP:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI0_CTRL_ADDR
    lw a0,IP(t0)
    li t2,2
    and a0,a0,t2
    srli a0,a0,1

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI1CheckTXIP######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1CheckTXIP

SPI1CheckTXIP:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI1_CTRL_ADDR
    lw a0,IP(t0)
    li t2,1
    and a0,a0,t2

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI1CheckRXIP######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI1CheckRXIP

SPI1CheckRXIP:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI1_CTRL_ADDR
    lw a0,IP(t0)
    li t2,2
    and a0,a0,t2
    srli a0,a0,1

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI2CheckTXIP######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2CheckTXIP

SPI2CheckTXIP:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI2_CTRL_ADDR
    lw a0,IP(t0)
    li t2,1
    and a0,a0,t2

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret

# ###################################################################### #
# SPI2CheckRXIP######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl SPI2CheckRXIP

SPI2CheckRXIP:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,SPI2_CTRL_ADDR
    lw a0,IP(t0)
    li t2,2
    and a0,a0,t2
    srli a0,a0,1

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8
    ret