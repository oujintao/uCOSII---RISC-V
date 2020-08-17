# #######################################################################################################
# 编写者：tao
# 文件：UART.S
# 日期：2020.8.17
# 文件作用：定义UART接口操作的汇编函数
# #######################################################################################################

# .include "HiFive1RevBUARTMemmap.inc"

.equ UART0_CTRL_ADDR,0x10013000
.equ UART1_CTRL_ADDR,0x10023000

.equ UART_TXDATA,0x00
.equ UART_RXDATA,0x04
.equ UART_TXCTRL,0x08
.equ UART_RXCTRL,0x0C
.equ UART_IE,0x10
.equ UART_IP,0x14
.equ UART_DIV,0x18

# ###################################################################### #
# UART0CheckTXFull###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0CheckTXFull

UART0CheckTXFull:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR
    lw t1,UART_TXDATA(t0)
    add a0,zero,zero
    bgez t1,UART0CheckTXEnd
    addi a0,a0,1

UART0CheckTXEnd:
    lw t1,4(sp)
    lw t1,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1CheckTXFull###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1CheckTXFull

UART1CheckTXFull:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR
    lw t1,UART_TXDATA(t0)
    add a0,zero,zero
    bgez t1,UART1CheckTXEnd
    addi a0,a0,1

UART1CheckTXEnd:
    lw t1,4(sp)
    lw t1,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0TXDataWrite###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0TXDataWrite

UART0TXDataWrite:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,UART0_CTRL_ADDR
    # andi a0,a0,0x000000FF
    sw a0,UART_TXDATA(t0)

    lw t0,0(sp)
    addi sp,sp,4

    ret

# ###################################################################### #
# UART1TXDataWrite###################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1TXDataWrite

UART1TXDataWrite:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,UART1_CTRL_ADDR
    # andi a0,a0,0x000000FF
    sw a0,UART_TXDATA(t0)

    lw t0,0(sp)
    addi sp,sp,4

    ret

# ###################################################################### #
# UART0CheckRXEmpty##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0CheckRXEmpty

UART0CheckRXEmpty:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR
    lw t1,UART_RXDATA(t0)
    add a0,zero,zero
    bgez t1,UART0CheckRXEnd
    addi a0,a0,1

UART0CheckRXEnd:
    lw t1,4(sp)
    lw t1,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1CheckRXEmpty##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1CheckRXEmpty

UART1CheckRXEmpty:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR
    lw t1,UART_RXDATA(t0)
    add a0,zero,zero
    bgez t1,UART1CheckRXEnd
    addi a0,a0,1

UART1CheckRXEnd:
    lw t1,4(sp)
    lw t1,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0RXDataRead####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0RXDataRead

UART0RXDataRead:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,UART0_CTRL_ADDR
    lw a0,UART_RXDATA(t0)
    andi a0,a0,0x000000FF

    lw t0,0(sp)
    addi sp,sp,4

    ret

# ###################################################################### #
# UART1RXDataRead####################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1RXDataRead

UART1RXDataRead:
    addi sp,sp,-4
    sw t0,0(sp)

    li t0,UART1_CTRL_ADDR
    lw a0,UART_RXDATA(t0)
    andi a0,a0,0x000000FF

    lw t0,0(sp)
    addi sp,sp,4

    ret

# ###################################################################### #
# UART0TXEnable######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0TXEnable

UART0TXEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR
    lw t1,UART_TXCTRL(t0)
    ori t1,zero,1
    sw t1,UART_TXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0TXDisable######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl UART0TXDisable

UART0TXDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR
    lw t1,UART_TXCTRL(t0)
    ori t1,zero,1
    xori t1,t1,1
    sw t1,UART_TXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1TXEnable######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1TXEnable

UART1TXEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR
    lw t1,UART_TXCTRL(t0)
    ori t1,zero,1
    sw t1,UART_TXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1TXDisable######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl UART1TXDisable

UART1TXDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR
    lw t1,UART_TXCTRL(t0)
    ori t1,zero,1
    xori t1,t1,1
    sw t1,UART_TXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0TXOneStopBit##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0TXOneStopBit

UART0TXOneStopBit:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR
    lw t1,UART_TXCTRL(t0)
    ori t1,zero,2
    sw t1,UART_TXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0TXTwoStopBit##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0TXTwoStopBit

UART0TXTwoStopBit:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR
    lw t1,UART_TXCTRL(t0)
    ori t1,zero,2
    xori t1,t1,2
    sw t1,UART_TXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret


# ###################################################################### #
# UART1TXOneStopBit##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1TXOneStopBit

UART1TXOneStopBit:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR
    lw t1,UART_TXCTRL(t0)
    ori t1,zero,2
    sw t1,UART_TXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1TXTwoStopBit##################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1TXTwoStopBit

UART1TXTwoStopBit:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR
    lw t1,UART_TXCTRL(t0)
    ori t1,zero,2
    xori t1,t1,2
    sw t1,UART_TXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret


# ###################################################################### #
# UART0TXSetInterruptWatermark########################################## #
# ###################################################################### #
.section .text
.align 2
.globl UART0TXSetInterruptWatermark

UART0TXSetInterruptWatermark:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR

    lw t1,UART_TXCTRL(t0)
    andi a0,a0,7
    slli a0,a0,16

    li t2,7
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,UART_TXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1TXSetInterruptWatermark########################################## #
# ###################################################################### #
.section .text
.align 2
.globl UART1TXSetInterruptWatermark

UART1TXSetInterruptWatermark:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR

    lw t1,UART_TXCTRL(t0)
    andi a0,a0,7
    slli a0,a0,16

    li t2,7
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,UART_TXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0RXEnable######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0RXEnable

UART0RXEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR
    lw t1,UART_RXCTRL(t0)
    ori t1,zero,1
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0RXDisable######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl UART0RXDisable

UART0RXDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR
    lw t1,UART_RXCTRL(t0)
    ori t1,zero,1
    xori t1,t1,1
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1RXEnable######################################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1RXEnable

UART1RXEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR
    lw t1,UART_RXCTRL(t0)
    ori t1,zero,1
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1RXDisable######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl UART1RXDisable

UART1RXDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR
    lw t1,UART_RXCTRL(t0)
    ori t1,zero,1
    xori t1,t1,1
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0RXSetInterruptWatermark########################################## #
# ###################################################################### #
.section .text
.align 2
.globl UART0RXSetInterruptWatermark

UART0RXSetInterruptWatermark:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR

    lw t1,UART_RXCTRL(t0)
    andi a0,a0,7
    slli a0,a0,16

    li t2,7
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1RXSetInterruptWatermark########################################## #
# ###################################################################### #
.section .text
.align 2
.globl UART1RXSetInterruptWatermark

UART1RXSetInterruptWatermark:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR

    lw t1,UART_RXCTRL(t0)
    andi a0,a0,7
    slli a0,a0,16

    li t2,7
    slli t2,t2,16
    or t1,t1,t2
    xor t1,t1,t2

    or t1,t1,a0
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0TXInterruptEnable################################################ #
# ###################################################################### #
.section .text
.align 2
.globl UART0TXInterruptEnable

UART0TXInterruptEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR

    lw t1,UART_IE(t0)
    ori t1,t1,1
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0TXInterruptDisable############################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0TXInterruptDisable

UART0TXInterruptDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR

    lw t1,UART_IE(t0)
    ori t1,t1,1
    xori t1,t1,1
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1TXInterruptEnable################################################ #
# ###################################################################### #
.section .text
.align 2
.globl UART1TXInterruptEnable

UART1TXInterruptEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR

    lw t1,UART_IE(t0)
    ori t1,t1,1
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1TXInterruptDisable############################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1TXInterruptDisable

UART1TXInterruptDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR

    lw t1,UART_IE(t0)
    ori t1,t1,1
    xori t1,t1,1
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0RXInterruptEnable################################################ #
# ###################################################################### #
.section .text
.align 2
.globl UART0RXInterruptEnable

UART0RXInterruptEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR

    lw t1,UART_IE(t0)
    ori t1,t1,2
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0RXInterruptDisable############################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0RXInterruptDisable

UART0RXInterruptDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR

    lw t1,UART_IE(t0)
    ori t1,t1,2
    xori t1,t1,2
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1RXInterruptEnable################################################ #
# ###################################################################### #
.section .text
.align 2
.globl UART1RXInterruptEnable

UART1RXInterruptEnable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR

    lw t1,UART_IE(t0)
    ori t1,t1,2
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1RXInterruptDisable############################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1RXInterruptDisable

UART1RXInterruptDisable:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR

    lw t1,UART_IE(t0)
    ori t1,t1,2
    xori t1,t1,2
    sw t1,UART_RXCTRL(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0TXInterruptPending############################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0TXInterruptPending

UART0TXInterruptPending:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR

    add a0,zero,zero

    lw t1,UART_IP(t0)
    andi t1,t1,1
    beq t1,zero,UART0TXInterruptPendingEnd
    addi a0,a0,1
UART0TXInterruptPendingEnd:

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1TXInterruptPending############################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1TXInterruptPending

UART1TXInterruptPending:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR

    add a0,zero,zero

    lw t1,UART_IP(t0)
    andi t1,t1,1
    beq t1,zero,UART1TXInterruptPendingEnd
    addi a0,a0,1
UART1TXInterruptPendingEnd:

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret
# ###################################################################### #
# UART0RXInterruptPending############################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART0RXInterruptPending

UART0RXInterruptPending:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR

    add a0,zero,zero

    lw t1,UART_IP(t0)
    andi t1,t1,2
    beq t1,zero,UART0RXInterruptPendingEnd
    addi a0,a0,1
UART0RXInterruptPendingEnd:

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1RXInterruptPending############################################### #
# ###################################################################### #
.section .text
.align 2
.globl UART1RXInterruptPending

UART1RXInterruptPending:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR

    add a0,zero,zero

    lw t1,UART_IE(t0)
    andi t1,t1,2
    beq t1,zero,UART1RXInterruptPendingEnd
    addi a0,a0,1
UART1RXInterruptPendingEnd:

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART0DivUpdate######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl UART0DivUpdate

UART0DivUpdate:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART0_CTRL_ADDR
    lw t1,UART_DIV(t0)

    xor t1,t1,t1
    or t1,t1,a0

    sw t1,UART_DIV(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret

# ###################################################################### #
# UART1DivUpdate######################################################## #
# ###################################################################### #
.section .text
.align 2
.globl UART1DivUpdate

UART1DivUpdate:
    addi sp,sp,-8
    sw t0,0(sp)
    sw t1,4(sp)

    li t0,UART1_CTRL_ADDR
    lw t1,UART_DIV(t0)

    xor t1,t1,t1
    or t1,t1,a0

    sw t1,UART_DIV(t0)

    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,8

    ret