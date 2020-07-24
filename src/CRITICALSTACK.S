.weak OSIntLock
.weak OSCRITICALSTACK
.weak OSCRITICALSTACKTOP

.section .text
.align 2
.globl PUSHOSCRITICALSTACK

PUSHOSCRITICALSTACK:
    addi sp,sp,-16 # 寄存器保护
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)
    sw t3,12(sp)

    la t1,OSIntLock # 这是防止异常问题
    lw t2,0(t1) # 读取临界区层数
    addi t2,t2,1 # +1 和上面的mie 形成双保险
    sw t2,0(t1) # 更新临界区层数

    csrrc t0,mie,zero # 读取现在的mie
    csrrc zero,mie,t0 # 把mie给清零
    la t1,OSCRITICALSTACKTOP # 读取临界区堆栈的栈顶指针 默认是15*4 (放了再减模式)
    add t3,t1,zero # t3也是临界区堆栈的栈顶指针
    lw t2,0(t1) # t2是当前指针的值

    la t1,OSCRITICALSTACK # 读取临界区堆栈基地址
    add t1,t1,t2 # 移动到栈顶
    sw t0,0(t1) # 存放数据

    addi t2,t2,-4 # 向下生长 -4
    sw t2,0(t3) # 临界区堆栈的栈顶指针更新

    lw t3,12(sp)
    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,16 # 寄存器恢复

    ret # 退出函数

.section .text
.align 2
.globl POPOSCRITICALSTACK

POPOSCRITICALSTACK:
    addi sp,sp,-16 # 寄存器保护
    sw t0,0(sp)
    sw t1,4(sp)
    sw t2,8(sp)
    sw t3,12(sp) # 这里没用到 但是问题不大 和上面的对应而已

    la t1,OSIntLock # 这是防止异常问题
    lw t2,0(t1) # 读取临界区层数
    addi t2,t2,-1 # -1 和上面的mie 形成双保险
    sw t2,0(t1) # 更新临界区层数

    la t1,OSCRITICALSTACKTOP # 读取临界区堆栈的栈顶指针 默认是15*4 (加了再拿数字模式)
    lw t2,0(t1) # t2是当前指针的值
    addi t2,t2,4 # 临界区堆栈的栈顶指针 + 4
    sw t2,0(t1) # 更新临界区堆栈的栈顶指针

    la t1,OSCRITICALSTACK # 读取临界区堆栈基地址
    add t1,t1,t2 # 地址变换
    lw t0,0(t1) # 拿出存放的数据
    csrrs zero,mie,t0 # 恢复原来mie的值 csrrw更好 理论上

    lw t3,12(sp) # 这里没用到 但是问题不大 和上面的对应而已
    lw t2,8(sp)
    lw t1,4(sp)
    lw t0,0(sp)
    addi sp,sp,16 # 寄存器恢复

    ret # 退出函数