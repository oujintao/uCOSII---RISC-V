# #######################################################################################################
# 编写者：tao
# 文件：SetLED.S
# 日期：2020.6.22
# 文件作用：定义SetXXXLED系列函数来展示不同的LED灯光
# 包含的函数：
# SetRedLED 作用：显示红色灯光
# SetBlueLED 作用：显示蓝色灯光
# SetGreenLED 作用：显示绿色灯光
# SetWhiteLED 作用：显示白色灯光
# #######################################################################################################
.include "GPIO.inc"
.include "memmap.inc"

# 声明下面的代码是在text区，用来运行的
.section .text
.align 2
.globl SetRedLED

SetRedLED:
    # 堆栈保护区
    addi sp,sp,-16  # 假设是堆栈向下生长的，也就是高地址变到低地址
    sw t0,0(sp)
    sw t1,4(sp) # 不是偏移1字节，是4字节，
    sw ra,8(sp) # 怕下面又会调用函数，所以把函数完成后的返回地址记录，当然没有也可以不用管。

    li t0,GPIO_CTRL_ADDR # 获取GPIO口对应要用到的寄存器的基地址。
    li t1,LED_RED # GPIO的22号管脚接的是红色的LED灯
    sw t1,GPIO_OUTPUT_VALUE(t0)  # 偏移地址是0x0C，对应的是GPIO输出的值的寄存器，也就是写这个寄存器

    # 堆栈恢复区
    lw ra,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,16
    ret

.section .text
.align 2
.globl SetBlueLED

SetBlueLED:
    # 堆栈保护区
    addi sp,sp,-16  # 假设是堆栈向下生长的，也就是高地址变到低地址
    sw t0,0(sp)
    sw t1,4(sp) # 不是偏移1字节，是4字节，
    sw ra,8(sp) # 怕下面又会调用函数，所以把函数完成后的返回地址记录，当然没有也可以不用管。

    li t0,GPIO_CTRL_ADDR # 获取GPIO口对应要用到的寄存器的基地址。
    li t1,LED_BLUE # GPIO的22号管脚接的是红色的LED灯
    sw t1,GPIO_OUTPUT_VALUE(t0)  # 偏移地址是0x0C，对应的是GPIO输出的值的寄存器，也就是写这个寄存器

    # 堆栈恢复区
    lw ra,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,16
    ret

.section .text
.align 2
.globl SetGreenLED

SetGreenLED:
    # 堆栈保护区
    addi sp,sp,-16  # 假设是堆栈向下生长的，也就是高地址变到低地址
    sw t0,0(sp)
    sw t1,4(sp) # 不是偏移1字节，是4字节，
    sw ra,8(sp) # 怕下面又会调用函数，所以把函数完成后的返回地址记录，当然没有也可以不用管。

    li t0,GPIO_CTRL_ADDR # 获取GPIO口对应要用到的寄存器的基地址。
    li t1,LED_GREEN # GPIO的22号管脚接的是红色的LED灯
    sw t1,GPIO_OUTPUT_VALUE(t0)  # 偏移地址是0x0C，对应的是GPIO输出的值的寄存器，也就是写这个寄存器

    # 堆栈恢复区
    lw ra,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,16
    ret

.section .text
.align 2
.globl SetWhiteLED

SetWhiteLED:
    # 堆栈保护区
    addi sp,sp,-16  # 假设是堆栈向下生长的，也就是高地址变到低地址
    sw t0,0(sp)
    sw t1,4(sp) # 不是偏移1字节，是4字节，
    sw ra,8(sp) # 怕下面又会调用函数，所以把函数完成后的返回地址记录，当然没有也可以不用管。

    li t0,GPIO_CTRL_ADDR # 获取GPIO口对应要用到的寄存器的基地址。
    li t1,LED_WHITE # GPIO的22号管脚接的是红色的LED灯
    sw t1,GPIO_OUTPUT_VALUE(t0)  # 偏移地址是0x0C，对应的是GPIO输出的值的寄存器，也就是写这个寄存器

    # 堆栈恢复区
    lw ra,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,16
    ret