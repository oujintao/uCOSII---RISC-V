/*
*********************************************************************************************************
*                                                uC/OS-II
*                                          The Real-Time Kernel
*
*                           (c) Copyright 1992-2002, Jean J. Labrosse, Weston, FL
*                                           All Rights Reserved
*
*                                               EXAMPLE #1
*********************************************************************************************************
*/
/*
*****************************************************************************************
修改者：tao
修改：添加了测试程序1和测试程序2
*****************************************************************************************
*/

#include "includes.h"

/*
*********************************************************************************************************
*                                               CONSTANTS
*********************************************************************************************************
*/
//开发板空间不够大
#define TASK_STK_SIZE 512 /* Size of each task's stacks (# of WORDs)            */
#define N_TASKS 3        /* Number of identical tasks                          */

/*
*********************************************************************************************************
*                                               VARIABLES
*********************************************************************************************************
*/

OS_STK TaskStk[N_TASKS][TASK_STK_SIZE]; /* Tasks stacks                                  */
OS_STK TaskStartStk[TASK_STK_SIZE];

//四个信号量，白色 蓝色 绿色 红色
OS_EVENT *whiteSem;
OS_EVENT *redSem;
OS_EVENT *greenSem;
OS_EVENT *blueSem;

//这是一个延时函数，全局变量就不会导致编译器优化
int delayCount;
//这是一个参考值，100000时间很短，100的话用于调试，1000000用于慢慢看结果
//（因为这是灯光闪烁来判断是够切换成功）
int delay = 1;
void Delay()
{
    for(int i=0;i<delay;i++)
    {
        for(int j=0;j<delay;j++){delayCount++;}
    }
}

/*
*********************************************************************************************************
*                                           FUNCTION PROTOTYPES
*********************************************************************************************************
*/
void TaskStart(void *data); /* Function prototypes of Startup task           */

//这是三个任务，一个任务对应一个灯光。R 红色 G 绿色 B 蓝色
void TaskR(void *data);
void TaskG(void *data);
void TaskB(void *data);

/*$PAGE*/
/*
*********************************************************************************************************
*                                                MAIN
*********************************************************************************************************
*/

void main(void)
{
    OSInit(); /* Initialize uC/OS-II                      */

    //这是创建信号量，要白色先亮，也就是对应的信号量初始化1，其他是0
    whiteSem = OSSemCreate(1);
    redSem = OSSemCreate(0);
    greenSem = OSSemCreate(0);
    blueSem = OSSemCreate(0);

    //这是创建任务，最高优先级是显示白色的，然后其余三个很容易知道是什么灯光。
    //最后的参数是优先级，数字越小，优先级越大。
    OSTaskCreate(TaskStart, (void *)0, &TaskStartStk[TASK_STK_SIZE - 1], 0);
    OSTaskCreate(TaskR, (void *)0, &TaskStk[0][TASK_STK_SIZE - 1], 1);
    OSTaskCreate(TaskG, (void *)0, &TaskStk[1][TASK_STK_SIZE - 1], 2);
    OSTaskCreate(TaskB, (void *)0, &TaskStk[2][TASK_STK_SIZE - 1], 3);
    OSStart(); /* Start multitasking                       */
}

/*
*********************************************************************************************************
*                                              STARTUP TASK
*********************************************************************************************************
*/
/*
总体逻辑如下，
最高优先级的执行完，
然后执行最低优先级的（不是IDLE任务），
然后执行第二低优先级的，
然后执行第三低优先级的，
最后执行最高优先级的，以此类推。
总体显示效果就是
白色灯光 -> 蓝色灯光 -> 绿色灯光 -> 红色灯光 -> 白色灯光
*/
/*
第二个测试程序的逻辑如下：
最高优先级延时8秒，然后显示白色灯光
第二优先级延时4秒，然后显示红色灯光
第三优先级延时2秒，然后显示绿色灯光
最低优先级（不是IDLE）不延时，直接显示蓝色灯光
总体显示效果就是：
蓝色显示2秒，接着绿色显示2秒，接着红色显示4秒，接着一直显示白色。
*/
void TaskStart(void *pdata)
{
#if OS_CRITICAL_METHOD == 3 /* Allocate storage for CPU status register */
    OS_CPU_SR cpu_sr;
#endif
    //这个函数就是第一个任务的执行函数 显示白色灯光
    /*
    这个逻辑是获取信号量（自己对应的信号量），
    然后显示对应的灯光，
    然后延时一段时间来观察，
    最后释放一个信号量来决定下一个切换的灯光（也就是任务）
    */
    unsigned char err;
    while(1)
    {
        OSSemPend(whiteSem,0,&err);
        SetWhiteLED();
        Delay();
        OSSemPost(blueSem);
    }

    /*
    这是第二个测试程序
    延时8秒后显示白色灯光
    */
    // OSTimeDlyHMSM(0,0,8,0);
    // SetWhiteLED();
    // while(1){}
}

void TaskR(void *pdata)
{
#if OS_CRITICAL_METHOD == 3 /* Allocate storage for CPU status register */
    OS_CPU_SR cpu_sr;
#endif
    //这个函数就是第一个任务的执行函数 显示白色灯光
    /*
    这个逻辑是获取信号量（自己对应的信号量），
    然后显示对应的灯光，
    然后延时一段时间来观察，
    最后释放一个信号量来决定下一个切换的灯光（也就是任务）
    */
    unsigned char err;
    while (1)
    {
        OSSemPend(redSem, 0, &err);
        SetRedLED();
        Delay();
        OSSemPost(whiteSem);
    }

    /*
    延时4秒显示红色灯光
    */
    // OSTimeDlyHMSM(0, 0, 4, 0);
    // SetRedLED();
    // while(1){}
}

void TaskG(void *pdata)
{
#if OS_CRITICAL_METHOD == 3 /* Allocate storage for CPU status register */
    OS_CPU_SR cpu_sr;
#endif
    //这个函数就是第一个任务的执行函数 显示白色灯光
    /*
    这个逻辑是获取信号量（自己对应的信号量），
    然后显示对应的灯光，
    然后延时一段时间来观察，
    最后释放一个信号量来决定下一个切换的灯光（也就是任务）
    */
    unsigned char err;
    while (1)
    {
        OSSemPend(greenSem, 0, &err);
        SetGreenLED();
        Delay();
        OSSemPost(redSem);
    }

    /*
    延时2秒显示绿色灯光
    */
    // OSTimeDlyHMSM(0, 0, 2, 0);
    // SetGreenLED();
    // while(1){}
}

void TaskB(void *pdata)
{
#if OS_CRITICAL_METHOD == 3 /* Allocate storage for CPU status register */
    OS_CPU_SR cpu_sr;
#endif
    //这个函数就是第一个任务的执行函数 显示白色灯光
    /*
    这个逻辑是获取信号量（自己对应的信号量），
    然后显示对应的灯光，
    然后延时一段时间来观察，
    最后释放一个信号量来决定下一个切换的灯光（也就是任务）
    */
    unsigned char err;
    while (1)
    {
        OSSemPend(blueSem, 0, &err);
        SetBlueLED();
        Delay();
        OSSemPost(greenSem);
    }

    /*
    马上显示蓝色灯光，等待绿色的2秒结束就会切换
    */
    // SetBlueLED();
    // while (1){}
}