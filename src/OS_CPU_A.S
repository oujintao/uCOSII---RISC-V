# #######################################################################################################
# 编写者：tao
# 文件：OS_CPU_A.S
# 日期：2020.6.22
# 文件作用：定义汇编函数，用于任务切换，时钟节拍服务程序
# 包含的函数：
# OSStartHighRdy 作用：多任务启动，执行最高优先级任务的切换，并且调用InitHiFive来初始化开发板
# OSCtwSW 作用：任务切换保存当前任务，切换另外的任务
# OSIntCtwSW 作用：中断退出的时候调用的任务切换，切换更高优先级任务。
# OSTickISR 作用：计时器中断服务子程序
# #######################################################################################################
.include "PUSHPOP.S"
.include "memmap.inc"
.include "GPIO.inc"

.weak OSIntExit
.weak OSTimeTick
.weak OSTaskSwHook

.weak OSIntNesting
.weak OSPrioHighRdy
.weak OSPrioCur
.weak OSRunning
.weak OSTCBCur
.weak OSTCBHighRdy

.weak InitHiFive

.section .text
.align 2
.globl OSStartHighRdy

OSStartHighRdy:
    
    la t0,OSRunning # OSRunning = 1 这是多任务启动的标志，
    li t1,1
    sw t1,0(t0)

    la t0,OSTCBHighRdy # OSCTBHighRdy是最高优先级任务的TCB块的指针（t0现在是指针的指针）
    lw t0,0(t0) # t0指向OSCTBHighRdy的指针的值（t0现在是指针，也就是具体那个TCB在内存的开始地址）
    lw sp,0(t0) # 第一个成员是堆栈指针，所以偏移地址是0

    POPREG # 这是一个宏定义，之后我们工作空间定义好才写

    addi sp,sp,-4
    sw ra,0(sp) # 保存返回地址
    jal InitHiFive # 初始化开发板
    lw ra,0(sp) # 恢复返回地址，作用不大，因为POPREG也会改写ra
    addi sp,sp,4

    ret # 这个不是因为中断而执行的，所以直接是函数返回就好了

.section .text
.align 2
.globl OSCtxSw

OSCtxSw:
    
    # PUSHREG # 也是一个宏，现在先不写,用于恢复现场,但是IntVec那里已经保存过一次了

    la t0,OSTCBCur # OSTCBCur->OSTCBStkPtr = SS:SP
    lw t0,0(t0)
    sw sp,0(t0)

    la t0,OSTCBCur # OSTCBCur = OSTCBHighRdy t0是指针的指针
    la t1,OSTCBHighRdy # t0是指针的指针
    lw t1,0(t1) # 这是拿到了最高优先级的TCB的指针
    sw t1,0(t0) # 直接赋予就好了

    la t0,OSPrioCur # OSPrioCur = OSPrioHighRdy t0是指针（因为OSPrioCur是一个声明是unsigned int）
    la t1,OSPrioHighRdy # 同理
    lw t1,0(t1)
    sw t1,0(t0)

    la t0,OSTCBHighRdy # SS:SP = OSTCBHighRdy->OSTCBStkPtr
    lw t0,0(t0)  # 堆栈指针的恢复
    lw sp,0(t0)

    POPREG

    mret # 这个函数是因为ECALL（或者是软件中断触发而来的）所以返回是需要中断的返回指令mret

.section .text
.align 2
.globl OSIntCtxSw

OSIntCtxSw:

    # 因为这个函数能进来是因为在中断的过程中调用的，但是在此之前，现场已经保护了，所以不需要在保护现场和SP
    la t0,OSTCBCur # OSTCBCur = OSTCBHighRdy t0是指针的指针
    la t1,OSTCBHighRdy # t0是指针的指针
    lw t1,0(t1) # 这是拿到了最高优先级的TCB的指针
    sw t1,0(t0) # 直接赋予就好了

    la t0,OSPrioCur # OSPrioCur = OSPrioHighRdy t0是指针（因为OSPrioCur是一个声明是unsigned int）
    la t1,OSPrioHighRdy # 同理
    lw t1,0(t1)
    sw t1,0(t0)

    la t0,OSTCBHighRdy # SS:SP = OSTCBHighRdy->OSTCBStkPtr
    lw t0,0(t0)  # 堆栈指针的恢复
    lw sp,0(t0)

    POPREG

    mret # 这个函数是因为ECALL（或者是软件中断触发而来的）所以返回是需要中断的返回指令mret

.section .text
.align 2
.globl OSTickISR

OSTickISR:

    # PUSHREG # 保护现场 同理，IntVec那里已经保存过了

    # 变成unsigned int的原因就是因为可以用lw，不用这么麻烦
    # la t0,OSIntNesting # 中断嵌套+1 但是我们没实现中断嵌套（因为RISC-V默认没有中断嵌套）
    # lw t1,0(t0)  # 获取当前的OSIntNesting
    # addi t1,t1,1 # 加一
    # sw t1,0(t0) # 写回OSIntNesting

    # li t0,1 # 比较是不是1
    # bne t1,t0,OSTickISR3 # 如果不是那么就不用保存SP指针

    la t0,OSTCBCur # 保存SP指针，因为只有第一层的中断才可能会引发调度
    lw t0,0(t0)
    sw sp,0(t0)

OSTickISR3:

    # 时钟节拍之后需要重新上发条（对MTIMPCMP赋值），之前遗漏了。
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

    jal OSTimeTick # 时钟节拍的处理函数
    jal OSIntExit # 寻找有没有更高优先级的任务，若果有，就会调用OSIntCtxSw从而就会不执行下面的代码
    
    POPREG # 现场恢复，来到这里的原因是因为没有更高优先级的任务

    mret # 中断返回

.section .text
.align 2
.globl OSSignalRecevieSE

OSSignalRecevieSE:
    # addi sp,sp,16
    # sw t0,0(sp)

    bnez a0,OSSignalRecevieEnd
OSSignalRecevieStart:
    # addi sp,sp,-4
    # sw t0,0(sp)  # 因为OSSignalRecevie要用到t0
    la t0,OSTCBCur
    lw t0,0(t0)
    sw sp,0(t0)
    j OSSignalRecevieSEE
OSSignalRecevieEnd:
    la t0,OSTCBCur
    lw t0,0(t0)
    lw sp,0(t0)
    # lw t0,0(sp)
    # addi sp,sp,4
OSSignalRecevieSEE:
    ret

.section .text
.align 2
.globl OSSignalRecevie

OSSignalRecevie:
    # 不用现场恢复
    la t0,OSTCBCur
    lw t0,0(t0)
    lw sp,0(t0)

    addi sp,sp,-16 # 防止破坏原来的现场


    addi sp,sp,-4
    sw ra,0(sp)  # 保护返回地址

    jalr a1  # a0 依然是 pdata 所以不用准备

    lw ra,0(sp)
    addi sp,sp,4

    addi sp,sp,16 # 防止破坏原来的现场

    ret # 返回原来的那个函数