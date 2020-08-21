# #######################################################################################################
# 编写者：tao
# 文件：IntVec.S
# 日期：2020.6.22
# 文件作用：定义IntVec来作为中断（异常）向量入口、跳转对应的服务子程序和规范临界区的状态所要做的事情。
# 包含的函数：
# IntVec 作用：作为中断（异常）向量入口、跳转对应的服务子程序和规范临界区的状态所要做的事情。
# #######################################################################################################
.include "PUSHPOP.S"
.include "memmap.inc"
.include "GPIO.inc"

.weak OSIntLock  # 这是临界区进出标志 等于0就是不在临界区，进临界区一次就+1 出去就-1
.weak OSCtxSw # 这是任务切换的调用代码段
.weak OSTickISR # 这是计时器中断，时钟节拍的服务子程序的代码段
.weak MExternIntISR

.section .text
.align 2
.globl IntVec

IntVec:

    PUSHREG

    la t0,OSIntLock # 拿到OSIntLock的地址
    lw t0,0(t0) # 拿到OSIntLock的值
    li t1,0 # t1 = 0；
    bne t0,t1,IntVecQuit # 和0比较，不等于0就是在临界区内，不做任何服务子程序

    csrrs t0,mcause,zero # 读取mcause的值，才会知道发生了什么事。中断还是异常
    
    bgez t0,ErrorVec # 假设t0大于等于0 那就是最高位为0

    slli t0,t0,1 # 把31位的1移出去
    srli t0,t0,1 # 31位移进一个0 这样就达到了31位的1变成了0的效果

    li t1,3  # 3是软件中断
    beq t0,t1,MSoftInt  # 这里没有用到软件中断。调试不方便的问题。
    li t1,7 # 7 是计数器中断
    beq t0,t1,MTimeInt
    li t1,11
    beq t0,t1,MExternInt

    POPREG # 恢复现场，没有要对应的中断类型，直接跑了

    mret

MSoftInt:
    li t0,0x02000000
    sw zero,0(t0)
    j OSCtxSw
MTimeInt:
    j OSTickISR  # 跳转到计数器中断的服务子程序
MExternInt:
    jal MExternIntISR
    POPREG # 恢复现场，没有要对应的中断类型，直接跑了

    mret
ErrorVec:
    li t1,11  # 11是ECALL
    beq t0,t1,ECALLERR

    csrrs t0,mepc,zero # mepc的值+4
    addi t0,t0,4
    sw t0,116(sp) # t0现在是返回地址 所以根据压栈顺序，116就是mepc的值，做更新而已

    POPREG # 恢复现场，没有要对应的中断类型，直接跑了

    mret

ECALLERR:
    csrrs t0,mepc,zero # mepc的值+4
    addi t0,t0,4
    sw t0,116(sp) # t0现在是返回地址 所以根据压栈顺序，116就是mepc的值，做更新而已

    j OSCtxSw # 跳转到ECALL的对应服务程序

IntVecQuit:
    # 判断是不是计数器中断，因为不会重新计数，要手动设置。
    csrrs t0,mcause,zero # 读取mcause的值，才会知道发生了什么事。中断还是异常
    
    bgez t0,ErrorVecEnd # 假设t0大于等于0 那就是最高位为0

    slli t0,t0,1 # 把31位的1移出去
    srli t0,t0,1 # 31位移进一个0 这样就达到了31位的1变成了0的效果

    li t1,3
    beq t0,t1,SoftIntQuit

    li t1,7 # 7 是计数器中断
    bne t0,t1,IntVecEnd # 不是计数器中断就直接中断退出

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

    j IntVecEnd

SoftIntQuit:
    li t0,0x02000000
    sw zero,0(t0)
IntVecEnd:
    # 恢复现场就退出中断，保证没有影响原来任务的进程
    POPREG
    mret

ErrorVecEnd:
    # 这是异常退出，mepc先加四，存疑
    csrrs t0,mepc,zero # mepc的值+4
    addi t0,t0,4
    sw t0,116(sp) # t0现在是返回地址 所以根据压栈顺序，116就是mepc的值，做更新而已
    
    POPREG
    mret

