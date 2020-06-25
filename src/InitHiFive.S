# #######################################################################################################
# 编写者：tao
# 文件：InitHiFive.S
# 日期：2020.6.20
# 文件作用：定义InitHiFive来初始化开发板的GPIO状态和中断向量入口地址。
# 包含的函数：
# InitHiFive 作用：初始化开发板的GPIO状态和中断向量入口地址。
# #######################################################################################################
.include "memmap.inc"
.include "GPIO.inc"

.section .text
.align 2
.globl InitHiFive

.weak IntVec

InitHiFive:
    # 堆栈保护
    addi sp,sp,-20
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)
    sw t3,12(sp)
    sw t4,16(sp)
    # sw ra,8(sp) 可以不保护

    li t0,GPIO_CTRL_ADDR # 获取GPIO要用到的寄存器的基地址
    li t1,LED_WHITE # 这里不是只为了设置白色灯，看下面三条指令 LED_WHITE 就是19 21 22位为1 
    sw t1,GPIO_OUTPUT_ENABLE(t0) # 这是输出使能，也就是可以输出电平，19 21 22三个管脚都可以输出
    sw t1,GPIO_OUTPUT_VALUE(t0) # 这是初始化输出白色
    sw t1,GPIO_OUTPUT_XOR(t0) # 这里是让输出取反 也就是本来19 21 22 输出为1的 但是实际上输出0 这是因为LED灯是共阴极的，后续提及。

    la t0,IntVec
    csrrw zero,mtvec,t0 # 写入中断入口地址
    li t0,8
    csrrs zero,mstatus,t0 # 8 = 1000b  mstatus的第三位是机器模式中断使能
    li t0,128
    csrrs zero,mie,t0 # 136 = 10001000b = 128 + 8 mie的第7位和第3分别是计数器中断和软件中断 

    li t0,MTIME # t1,t2分别存着MTIME的64位数值
    lw t1,0(t0)
    lw t2,4(t0)

    li t0,165 # 165 = 33*5 也就是5ms后就触发计数器中断
    add t3,t1,t0 # t3代表加了165之后的值
    slt t4,t3,t1 # t3<t1的话那么t4 = 1 不然为0 等价于如果低32位溢出了，那么就是高32位要进位
    add t2,t2,t4 # 高32位+1 或者加0 看看进位是不是0(t4)

    li t0,MTIMECOMPARE # MTIMECOMPARE的值更新 ,等MTIME>=MTIMECOMPARE就触发计数器中断
    sw t3,0(t0)
    sw t2,4(t0)

    # 堆栈恢复
    lw t4,16(sp)
    lw t3,12(sp)
    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,20
    ret