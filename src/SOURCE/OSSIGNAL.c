/*
*********************************************************************************************************
*                                                uC/OS-II
*                                          The Real-Time Kernel
*                                             SIGNAL MANAGER
*
* File : OSSIGNAL.c
* By   : tao
*********************************************************************************************************
*/

#ifndef OS_MASTER_FILE
#include "..\LED\INCLUDES.H"
#endif

#define OS_SIGNAL_NOT_FIND 1
#define OS_SIGNAL_CLASH 2
#define OS_SIGNAL_PRIO_ERR 3
#define OS_SIGNAL_IN_CRITICAL 4

OS_EXT void OSSignalRecevieSE(int startOrEnd);
OS_EXT void OSSignalRecevie(void *pdata, void (*func)(void *));

/*$PAGE*/
/*
*********************************************************************************************************
*                               OSSignalInit
*
* Description: 这是用来初始化信号记录表（OSSignalFuncRegisterTabel）和任务信号全体屏蔽表（OSSignalTaskMask）
*
* Arguments : 无
*
* Returns   : 无
*
* Note(s)   :   1)  这个函数使用在uCOSII还没启动之前，也就是在OSInit()之后，OSStart之前。此函数是不包括对申请的空间的释放
*********************************************************************************************************
*/
void OSSignalInit()
{
    int i;
    OS_ENTER_CRITICAL();
    i = 0;
    while (i <= OS_LOWEST_PRIO)
    {
        OSSignalFuncRegisterTabel[i] = NULL; //清空
        OSSignalTaskMask[i] = 0;
        i++;
    }
    OS_EXIT_CRITICAL();
}
/*$PAGE*/
/*
*********************************************************************************************************
*                               OSSignalDeinit
*
* Description: 这是用来释放信号记录表（OSSignalFuncRegisterTabel）申请的空间和初始化任务信号全体屏蔽表（OSSignalTaskMask）
*
* Arguments : 无
*
* Returns   : 无
*
* Note(s)   :   1)  这个函数其实也是一个初始化函数和OSSignalInit多了个释放空间
*********************************************************************************************************
*/
void OSSignalDeinit()
{
    int i;
    OSSignalEvent *lowerNumTemp;
    OSSignalEvent *temp;
    OSSignalEvent *nextTemp;
    OS_ENTER_CRITICAL();
    i = 0;
    while (i <= OS_LOWEST_PRIO) //遍历
    {
        if (OSSignalFuncRegisterTabel[i] != NULL) //跳过空的
        {
            temp = OSSignalFuncRegisterTabel[i];
            while (temp != NULL) //
            {
                nextTemp = temp->pNextNum; //拿着下一个
                lowerNumTemp = temp;
                temp = temp->pNext;
                while (temp != NULL) //清空所有跳表
                {
                    free(lowerNumTemp);
                    lowerNumTemp = temp;
                    temp = temp->pNext;
                }
                free(lowerNumTemp);
                temp = nextTemp;
            }
            OSSignalFuncRegisterTabel[i] = NULL; //清空了
        }
        OSSignalTaskMask[i] = 0;
        i++;
    }
    OS_ENTER_CRITICAL();
}

/*$PAGE*/
/*
*********************************************************************************************************
*                               OSSignalConnect
*
* Description: 这是用来创建信号连接的，是给发送信号的任务使用
*
* Arguments :   signalNum 这个是信号的类型，是一个数字，建议是大于0的，不同的数字代表不同的信号
*               targetTaskPrio  信号接收方的任务的优先级
*               eventFunc   这是接收到信号之后，接收方的任务需要做的函数，是一个只有一个传递空指针的参数的函数
*
* Returns   :   OS_NO_ERR 这是没问题的返回值
*               OS_SIGNAL_PRIO_ERR prio参数不合法 0-OS_LOWEST_PRIO代表一个任务
*               OS_SIGNAL_CLASH 这是信号冲突的返回值 就是 signalNum和prio都已经有一样的信号登记了
*
* Note(s)   : 
*********************************************************************************************************
*/
int OSSignalConnect(int signalNum, int targetTaskPrio, void (*eventFunc)(void *))
{
    if (targetTaskPrio > OS_LOWEST_PRIO || targetTaskPrio < 0)
    {
        return OS_SIGNAL_PRIO_ERR;
    }
    int curPrio;
    //有没有的标志位的设置
    OS_ENTER_CRITICAL();
    curPrio = OSPrioCur;

    if (OSSignalFuncRegisterTabel[curPrio] == NULL) //如果第一个是64 就是还没有开发 原基础上建立
    {
        OSSignalEvent *temp = OSSignalFuncRegisterTabel[curPrio];
        temp = (OSSignalEvent *)malloc(sizeof(OSSignalEvent));
        temp->prio = targetTaskPrio;
        temp->signalNum = signalNum;
        temp->func = eventFunc;
        temp->mask = 0;
        temp->pNextNum = NULL;
        temp->pNext = NULL;
        OSSignalFuncRegisterTabel[curPrio] = temp;
    }
    else
    {
        //新单元
        OSSignalEvent *newSignalUnit = (OSSignalEvent *)malloc(sizeof(OSSignalEvent));
        newSignalUnit->prio = targetTaskPrio;
        newSignalUnit->signalNum = signalNum;
        newSignalUnit->func = eventFunc;
        newSignalUnit->mask = 0;
        newSignalUnit->pNextNum = NULL;
        newSignalUnit->pNext = NULL;

        OSSignalEvent *temp = OSSignalFuncRegisterTabel[curPrio];
        OSSignalEvent *lowerNumTemp = NULL;
        while (temp->signalNum < signalNum)
        {
            if (temp->pNextNum == NULL)
            {
                break;
            }
            lowerNumTemp = temp;
            temp = (OSSignalEvent *)temp->pNextNum;
        }                         //上面出来的情况 3 3 3    3 3 3 4    3 3 3 4 5
        if (lowerNumTemp == NULL) //3 3 3  //最后一个是3链接的是NULL
        {
            if (temp->signalNum < signalNum) // 2 3 3
            {
                newSignalUnit->pNextNum = temp;
                OSSignalFuncRegisterTabel[curPrio] = newSignalUnit;
            }
            else if (temp->signalNum == signalNum)
            {
                lowerNumTemp = temp;
                temp = temp->pNext;
                while (temp != NULL)
                {
                    if (temp->prio == targetTaskPrio)
                    {
                        OS_EXIT_CRITICAL();
                        return OS_SIGNAL_CLASH;
                    }
                    else
                    {
                        lowerNumTemp = temp;
                        temp = temp->pNext;
                    }
                }
                lowerNumTemp->pNext = newSignalUnit;
            }
            else // 3 3 4
            {
                temp->pNextNum = newSignalUnit;
            }
        }
        else
        {
            if (temp->signalNum > signalNum) // 3 3 5 5
            {
                lowerNumTemp->pNextNum = newSignalUnit;
                newSignalUnit->pNextNum = temp;
            }
            else // 3 3 4 4 5 5   3 3 4 5 5
            {
                if (temp->prio == targetTaskPrio)
                {
                    //ERROR
                    OS_EXIT_CRITICAL();
                    return OS_SIGNAL_CLASH;
                }
                lowerNumTemp = temp;
                temp = temp->pNext;
                while (temp != NULL)
                {
                    if (temp->prio == targetTaskPrio)
                    {
                        //ERROR
                        OS_EXIT_CRITICAL();
                        return OS_SIGNAL_CLASH;
                    }
                    lowerNumTemp = temp;
                    temp = temp->pNext;
                }
                lowerNumTemp->pNext = newSignalUnit;
            }
        }
    }
    OS_EXIT_CRITICAL();
    return OS_NO_ERR;
}

/*$PAGE*/
/*
*********************************************************************************************************
*                               OSSignalUnregister
*
* Description: 这是信号发送方的任务用来撤销信号登记的函数和上面的OSSignalConnect是相对的一个函数
*
* Arguments :   signalNum 这个是信号的类型，是一个数字，建议是大于0的，不同的数字代表不同的信号
*               prio  信号接收方的任务的优先级
*
* Returns   :   OS_NO_ERR 这是没问题的返回值
*               OS_SIGNAL_PRIO_ERR prio参数不合法 0-OS_LOWEST_PRIO代表一个任务， 64代表全部任务
*               OS_SIGNAL_NOT_FIND 没有找到一个OSSignalEvent的signalNum和prio和参数signalNum和prio对应
*
* Note(s)   : 
*********************************************************************************************************
*/
int OSSignalUnregister(int signalNum, int prio)
{
    if (prio > OS_LOWEST_PRIO || prio < 0) //64 是全部线程
    {
        if (prio != 64)
        {
            return OS_SIGNAL_PRIO_ERR;
        }
    }
    OS_ENTER_CRITICAL();                            //进入临界区
    int curPrio = OSPrioCur;                        //获得当前任务的优先级
    if (OSSignalFuncRegisterTabel[curPrio] == NULL) //如果是没有信号连接的话，就是错误
    {
        OS_EXIT_CRITICAL();
        return OS_SIGNAL_NOT_FIND;
    }
    //temp是当前开头链表 lowerNumTemp就是temp之前的 也就是 3 3 4 5 5  temp是4的话 那么lowerNumTemp就是3
    OSSignalEvent *temp = OSSignalFuncRegisterTabel[curPrio];
    OSSignalEvent *lowerNumTemp = NULL;
    OSSignalEvent *frontTemp = NULL;

    //下面的代码是处理这个任务只有一个信号的
    if (temp->pNext == NULL && temp->pNextNum == NULL && temp->signalNum == signalNum)
    {
        if (temp->prio == prio || prio == 64) //3  如果只有一个信号 如果优先级刚好对上或者64（全部）那么就是清空就好了
        {
            free(temp);
            OSSignalFuncRegisterTabel[curPrio] = NULL;
            OS_EXIT_CRITICAL(); //推出临界区
            return OS_NO_ERR;   //没错
        }
        else
        {
            OS_EXIT_CRITICAL();        //退出临界区
            return OS_SIGNAL_NOT_FIND; // 没找到删除对象
        }
    }
    //下面的代码是处理这个任务只有一种信号类型，但是要全部删除的(signalNum都一样的)
    if (temp->pNextNum == NULL && temp->signalNum == signalNum && prio == 64) // 3 3  删除全部的3
    {                                                                         //3  如果只有一个信号 如果优先级刚好对上或者64（全部）那么就是清空就好了
        lowerNumTemp = temp;
        temp = temp->pNext;
        while (temp != NULL)
        {
            free(lowerNumTemp);
            lowerNumTemp = temp;
            temp = temp->pNext;
        }
        free(lowerNumTemp);
        OSSignalFuncRegisterTabel[curPrio] = NULL;
        OS_EXIT_CRITICAL(); //退出临界区
        return OS_NO_ERR;   //没错
    }
    while (1) //只有break才能跳出来 其实只会循环一次
    {
        while (temp != NULL) //找到对应的信号编号（signalNum），break就是找到了
        {
            if (temp->signalNum != signalNum) //不是对应的编号
            {
                lowerNumTemp = temp;   //更新上一个编号的头
                temp = temp->pNextNum; //指向下一个编号
            }
            else
            {
                break; //找到了
            }
        }

        if (temp == NULL) //没找到啊
        {
            break;
        }

        if (lowerNumTemp == NULL) // 只是第一个 3 3 4 5 5  关于3的
        {
            if (prio == 64) //只有一个 3 3这种情况已经没了 上面解决了 这里肯定是有多个3的情况
            {
                frontTemp = temp->pNextNum; //如果是空的话也没关系
                lowerNumTemp = temp;
                temp = temp->pNext;
                while (temp != NULL)
                {
                    free(lowerNumTemp);
                    lowerNumTemp = temp;
                    temp = temp->pNext;
                }
                free(lowerNumTemp);
                OSSignalFuncRegisterTabel[curPrio] = frontTemp;

                OS_EXIT_CRITICAL();
                return OS_NO_ERR;
            }
            else // 3 3 4 5 5
            {
                if (temp->prio == prio) // 3 3 4 5 5 删除第一个
                {
                    ((OSSignalEvent *)temp->pNext)->pNextNum = temp->pNextNum;
                    temp->pNextNum = NULL;
                    temp->pNext = NULL;
                    free(temp);

                    OS_EXIT_CRITICAL();
                    return OS_NO_ERR;
                }
                else //删除后面的3
                {
                    lowerNumTemp = temp; //lowerNumTemp的身份变了
                    temp = temp->pNext;
                    while (temp != NULL)
                    {
                        if (temp->prio != prio)
                        {
                            lowerNumTemp = temp;
                            temp = temp->pNext;
                        }
                        else
                        {
                            break; //找到要删除的
                        }
                    }
                    if (temp == NULL)
                    {
                        break; //找不到
                    }
                    lowerNumTemp->pNext = temp->pNext; //找到了
                    temp->pNext = NULL;                //保险操作
                    free(temp);
                    OS_EXIT_CRITICAL();
                    return OS_NO_ERR;
                }
            }
        }
        else //就是 3 3 4 5 5  不是3这个情况
        {
            if (prio == 64) // 3 3 4 4 5 5 删除全部的4
            {
                lowerNumTemp->pNextNum = temp->pNextNum;
                lowerNumTemp = temp;
                temp = temp->pNext;
                while (temp != NULL) //全部删除
                {
                    free(lowerNumTemp);
                    lowerNumTemp = temp;
                    temp = temp->pNext;
                }
                free(lowerNumTemp); //temp == NULL 但是前面的可不会是空的 所以要free
                OS_EXIT_CRITICAL();
                return OS_NO_ERR;
            }
            else
            {
                if (temp->prio == prio) //3 3 4 4 5 5  3 3 4 5 5第一个4
                {
                    if (temp->pNext == NULL) //只有一个4
                    {
                        lowerNumTemp->pNextNum = temp->pNextNum; // 3指向5
                        temp->pNextNum = NULL;
                        free(temp);
                        OS_EXIT_CRITICAL();
                        return OS_NO_ERR;
                    }
                    else //多个4
                    {
                        lowerNumTemp->pNextNum = temp->pNext;                      //3 指向下一个 4
                        ((OSSignalEvent *)temp->pNext)->pNextNum = temp->pNextNum; //下一个4 指向 5
                        temp->pNext = NULL;                                        //保险操作
                        temp->pNextNum = NULL;
                        free(temp);
                        OS_EXIT_CRITICAL();
                        return OS_NO_ERR;
                    }
                }
                else
                {
                    lowerNumTemp = temp; //lowerNumTemp的意义不同了 是pNext的
                    temp = temp->pNext;
                    while (temp != NULL)
                    {
                        if (temp->prio == prio) //找到了
                        {
                            lowerNumTemp->pNext = temp->pNext;
                            temp->pNext = NULL;
                            free(temp);
                            OS_EXIT_CRITICAL();
                            return OS_NO_ERR;
                        }
                        else
                        {
                            lowerNumTemp = temp;
                            temp = temp->pNext;
                        }
                    }
                    break; //找不到
                }
            }
        }
    }
    OS_EXIT_CRITICAL();
    return OS_SIGNAL_NOT_FIND;
}

/*$PAGE*/
/*
*********************************************************************************************************
*                               OSSignalDisConnect
*
* Description: 这是信号接收方的任务用来撤销信号登记的函数，和OSSignalUnregister不同的是使用这个函数的任务的身份
*
* Arguments :   signalNum 这个是信号的类型，是一个数字，建议是大于0的，不同的数字代表不同的信号
*               originPrio  信号发送方的任务的优先级
*
* Returns   :   OS_NO_ERR 这是没问题的返回值
*               OS_SIGNAL_PRIO_ERR prio参数不合法 0-OS_LOWEST_PRIO代表一个任务
*               OS_SIGNAL_NOT_FIND 没有找到一个OSSignalEvent的signalNum和prio和参数signalNum和originPrio对应
*
* Note(s)   : 
*********************************************************************************************************
*/
int OSSignalDisConnect(int signalNum, int originPrio)
{
    if (originPrio > OS_LOWEST_PRIO || originPrio < 0)
    {
        return OS_SIGNAL_PRIO_ERR;
    }
    int curPrio;
    int prio;
    OSSignalEvent *lowerNumTemp;
    OSSignalEvent *temp;
    OS_ENTER_CRITICAL(); //进入临界区
    curPrio = OSPrioCur; //获得当前任务的优先级
    prio = originPrio;
    if (OSSignalFuncRegisterTabel[curPrio] == NULL) //如果是没有信号连接的话，就是错误
    {
        OS_EXIT_CRITICAL();
        return OS_SIGNAL_NOT_FIND;
    }
    //temp是当前开头链表 lowerNumTemp就是temp之前的 也就是 3 3 4 5 5  temp是4的话 那么lowerNumTemp就是3
    temp = OSSignalFuncRegisterTabel[curPrio];
    lowerNumTemp = NULL;

    //下面的代码是处理这个任务只有一个信号的
    if (temp->pNext == NULL && temp->pNextNum == NULL && temp->signalNum == signalNum)
    {
        if (temp->prio == prio) //3  如果只有一个信号 如果优先级刚好对上或者64（全部）那么就是清空就好了
        {
            free(temp);
            OSSignalFuncRegisterTabel[curPrio] = NULL;
            OS_EXIT_CRITICAL(); //推出临界区
            return OS_NO_ERR;   //没错
        }
        else
        {
            OS_EXIT_CRITICAL();        //退出临界区
            return OS_SIGNAL_NOT_FIND; // 没找到删除对象
        }
    }

    while (1) //只有break才能跳出来 其实只会循环一次
    {
        while (temp != NULL) //找到对应的信号编号（signalNum），break就是找到了
        {
            if (temp->signalNum != signalNum) //不是对应的编号
            {
                lowerNumTemp = temp;   //更新上一个编号的头
                temp = temp->pNextNum; //指向下一个编号
            }
            else
            {
                break; //找到了
            }
        }

        if (temp == NULL) //没找到啊
        {
            break;
        }

        if (lowerNumTemp == NULL) // 只是第一个 3 3 4 5 5  关于3的
        {
            if (temp->prio == prio) // 3 3 4 5 5 删除第一个
            {
                ((OSSignalEvent *)temp->pNext)->pNextNum = temp->pNextNum;
                temp->pNextNum = NULL;
                temp->pNext = NULL;
                free(temp);

                OS_EXIT_CRITICAL();
                return OS_NO_ERR;
            }
            else //删除后面的3
            {
                lowerNumTemp = temp; //lowerNumTemp的身份变了
                temp = temp->pNext;
                while (temp != NULL)
                {
                    if (temp->prio != prio)
                    {
                        lowerNumTemp = temp;
                        temp = temp->pNext;
                    }
                    else
                    {
                        break; //找到要删除的
                    }
                }
                if (temp == NULL)
                {
                    break; //找不到
                }
                lowerNumTemp->pNext = temp->pNext; //找到了
                temp->pNext = NULL;                //保险操作
                free(temp);
                OS_EXIT_CRITICAL();
                return OS_NO_ERR;
            }
        }
        else //就是 3 3 4 5 5  不是3这个情况
        {
            if (temp->prio == prio) //3 3 4 4 5 5  3 3 4 5 5第一个4
            {
                if (temp->pNext == NULL) //只有一个4
                {
                    lowerNumTemp->pNextNum = temp->pNextNum; // 3指向5
                    temp->pNextNum = NULL;
                    free(temp);
                    OS_EXIT_CRITICAL();
                    return OS_NO_ERR;
                }
                else //多个4
                {
                    lowerNumTemp->pNextNum = temp->pNext;                      //3 指向下一个 4
                    ((OSSignalEvent *)temp->pNext)->pNextNum = temp->pNextNum; //下一个4 指向 5
                    temp->pNext = NULL;                                        //保险操作
                    temp->pNextNum = NULL;
                    free(temp);
                    OS_EXIT_CRITICAL();
                    return OS_NO_ERR;
                }
            }
            else
            {
                lowerNumTemp = temp; //lowerNumTemp的意义不同了 是pNext的
                temp = temp->pNext;
                while (temp != NULL)
                {
                    if (temp->prio == prio) //找到了
                    {
                        lowerNumTemp->pNext = temp->pNext;
                        temp->pNext = NULL;
                        free(temp);
                        OS_EXIT_CRITICAL();
                        return OS_NO_ERR;
                    }
                    else
                    {
                        lowerNumTemp = temp;
                        temp = temp->pNext;
                    }
                }
                break; //找不到
            }
        }
    }
    OS_EXIT_CRITICAL();
    return OS_NO_ERR;
}

/*$PAGE*/
/*
*********************************************************************************************************
*                               OSSignalSend
*
* Description: 这是任务发送方的任务使用的发送信号的函数，类似于单工信号线
*
* Arguments :   signalNum 这个是信号的类型，是一个数字，建议是大于0的，不同的数字代表不同的信号
*               pdata  信号发送方的任务给的参数，可以看作一个信息
*
* Returns   :   OS_NO_ERR 这是没问题的返回值
*               OS_SIGNAL_IN_CRITICAL 在临界区不能发信号（怕导致时间过长）
*               OS_SIGNAL_NOT_FIND 没有找到一个OSSignalEvent的signalNum和参数signalNum
*
* Note(s)   :   1） 在临界区的时候不要使用
*               2） 在中断的时候不要使用
*********************************************************************************************************
*/
int OSSignalSend(int signalNum, void *pdata)
{
    //中断的时候不能用这个函数
    if (OSIntLock != 0)
    {
        return OS_SIGNAL_IN_CRITICAL;
    }
    int curPrio;
    OSSignalEvent *temp;
    OS_ENTER_CRITICAL();
    curPrio = OSPrioCur;                       //获得现在的优先级
    temp = OSSignalFuncRegisterTabel[curPrio]; //获得跳表
    while (temp->signalNum < signalNum)        //小的数跳过
    {
        if (temp->signalNum == signalNum) //是这个数就跳出来
        {
            break;
        }
        temp = temp->pNextNum; //下一个数字
        if (temp == NULL)      //空的
        {
            OS_EXIT_CRITICAL();
            return OS_SIGNAL_NOT_FIND;
        }
    }
    if (temp->signalNum != signalNum) //要的是4的话 那么5 也会跳出那个while 所以这里判断
    {
        OS_EXIT_CRITICAL();
        return OS_SIGNAL_NOT_FIND;
    }
    else
    {
        OSSignalRecevieSE(0); //保存当前的sp
        while (temp != NULL)
        {
            if (temp->mask == 0 && OSSignalTaskMask[temp->prio] == 0) //没有被屏蔽
            {
                OSTCBCur = OSTCBPrioTbl[temp->prio];
                OSPrioCur = temp->prio;
                OSSignalRecevie(pdata, temp->func); //执行信号对应的函数
            }
            temp = temp->pNext; //下一个
        }
        OSTCBCur = OSTCBPrioTbl[curPrio];
        OSPrioCur = curPrio;
        OSSignalRecevieSE(1); //恢复当前的sp
    }
    OS_EXIT_CRITICAL();
    return OS_NO_ERR;
}

/*$PAGE*/
/*
*********************************************************************************************************
*                               OSSignalDeleteResquestFromOrigin
*
* Description: 这是对于一个任务曾经被删除，然后有一个新的任务是同一个prio的话，需要对作为发送方时之前的信号进行清理
*
* Arguments :
*
* Returns   :
*
* Note(s)   :   1） 这是在同一个prio的任务，任务1被删除，之后任务2创建，那么可能需要使用此函数进行原来登记要发送的信号清理，如果没使用过信号也可以忽略
*********************************************************************************************************
*/
void OSSignalDeleteResquestFromOrigin()
{
    int curPrio;
    OSSignalEvent *frontTemp;
    OSSignalEvent *lowerNumTemp;
    OSSignalEvent *temp;
    OSSignalEvent *higherNumTemp;
    OS_ENTER_CRITICAL();
    curPrio = OSPrioCur;
    if (OSSignalFuncRegisterTabel[curPrio] != NULL) //证明有信号
    {
        temp = OSSignalFuncRegisterTabel[curPrio];
        if (temp->pNext != NULL) //开头不止一个 3 3 3 3
        {
            frontTemp = temp;
            temp = temp->pNext;
            while (temp != NULL)
            {
                frontTemp->pNext = NULL;
                free(frontTemp);
                frontTemp = temp;
                temp = temp->pNext;
            }
            frontTemp->pNext = NULL;
            free(frontTemp);
            temp = OSSignalFuncRegisterTabel[curPrio];
        }
        if (temp->pNextNum == NULL) // 3 3 3 只有一种signalNum的情况
        {
            free(temp);
            OSSignalFuncRegisterTabel[curPrio] = NULL;
            OS_EXIT_CRITICAL();
            return;
        }
        temp = temp->pNextNum; //3 4 5 指向4
        lowerNumTemp = temp;   //4
        temp = temp->pNextNum; //3 4 5 指向5
        while (temp != NULL)   //会把5灭了
        {
            higherNumTemp = temp->pNextNum;
            frontTemp = temp;
            temp = temp->pNext;
            while (temp != NULL)
            {
                free(frontTemp);
                frontTemp = temp;
                temp = temp->pNext;
            }
            free(frontTemp);
            temp = higherNumTemp;
        }
        //还有4没灭
        frontTemp = lowerNumTemp;
        temp = lowerNumTemp->pNext;
        while (temp != NULL)
        {
            free(frontTemp);
            frontTemp = temp;
            temp = temp->pNext;
        }
        free(frontTemp);
    }
    if (OSSignalFuncRegisterTabel[curPrio] != NULL)
    {
        free(OSSignalFuncRegisterTabel[curPrio]);
    }
    OSSignalFuncRegisterTabel[curPrio] = NULL; //清空
    OS_EXIT_CRITICAL();
}

/*$PAGE*/
/*
*********************************************************************************************************
*                               OSSignalDeleteResquestFromTarget
*
* Description: 这是对于一个任务曾经被删除，然后有一个新的任务是同一个prio的话，需要对作为接收方时之前的信号进行清理
*
* Arguments :
*
* Returns   :
*
* Note(s)   :   1） 这是在同一个prio的任务，任务1被删除，之后任务2创建，那么可能需要使用此函数进行原来登记要接受的信号清理，如果没使用过信号也可以忽略
*********************************************************************************************************
*/
void OSSignalDeleteResquestFromTarget()
{
    int i;
    int curPrio;
    OSSignalEvent *lowerNumTemp;
    OSSignalEvent *nextTemp;
    OSSignalEvent *temp;
    OS_ENTER_CRITICAL();
    i = 0;
    curPrio = OSPrioCur;
    while (i <= OS_LOWEST_PRIO) //遍历所有的表格
    {
        if (OSSignalFuncRegisterTabel[i] != NULL) //如果是空，就可以跳过了
        {
            temp = OSSignalFuncRegisterTabel[i]; //拿这个跳表
            while (temp != NULL)                 //到最后一个就是空了
            {
                if (temp->prio == curPrio) //第一个要删除
                {
                    if (temp->pNext != NULL) //3 3 3
                    {
                        ((OSSignalEvent *)temp->pNext)->pNextNum = temp->pNextNum; //后面的3做第一个
                        OSSignalFuncRegisterTabel[curPrio] = temp->pNext;
                        temp->pNext = NULL; //已经不会影响OSSignalFuncRegisterTabel
                        temp->pNextNum = NULL;
                        free(temp);
                        temp = OSSignalFuncRegisterTabel[curPrio]->pNextNum; //4
                    }
                    else //只有一个
                    {
                        OSSignalFuncRegisterTabel[curPrio] = temp->pNextNum; //已经变成4了
                        temp->pNext = NULL;
                        temp->pNextNum = NULL;
                        free(temp);
                        temp = OSSignalFuncRegisterTabel[curPrio]; //上面已经变成4了
                    }
                }
                else
                {
                    nextTemp = temp->pNextNum;  //拿着下个东西的指针，因为这一个就已经要消除了
                    lowerNumTemp = temp->pNext; //因为不是第一个  起码从第2第3个开始 已经2
                    temp = temp->pNext;         //temp 变成 2
                    temp = temp->pNext;         //temp 变成 3
                    while (temp != NULL)
                    {
                        if (temp->prio == curPrio) //中了 就可以删除
                        {
                            lowerNumTemp->pNext = temp->pNext; //跳过这个目标
                            temp->pNext = NULL;                //保险
                            free(temp);
                            break; //已经完成了
                        }
                        else
                        {
                            lowerNumTemp = temp->pNext; //指向下一个
                            temp = temp->pNext;
                        }
                    }
                    temp = nextTemp; //拿下一个
                }
            } //NULL 已经弄完了
        }
        i++;
    }
    OS_EXIT_CRITICAL();
}

/*$PAGE*/
/*
*********************************************************************************************************
*                               OSSignalSetMaskFromOrigin
*
* Description: 这是对一个信号OSSignalEvent的掩码为进行设置
*
* Arguments :   signalNum 这个是信号的类型
*               prio 这是任务接收方的任务的prio
*               mask 这是掩码的数值，建议为1（不发送）或者0（会发送）
*
* Returns   :   OS_NO_ERR 运行成功
*				OS_SIGNAL_PRIO_ERR prio数值不对 0-OS_LOWEST_PRIO是具体某一个 64是全体
*				OS_SIGNAL_NOT_FIND 没有找到对应的信号
*
* Note(s)   :   1） 这是信号发送方的任务使用的
*********************************************************************************************************
*/
int OSSignalSetMaskFromOrigin(int signalNum, int prio, int mask)
{
    if (prio > OS_LOWEST_PRIO || prio < 0)
    {
        if (prio != 64)
        {
            return OS_SIGNAL_PRIO_ERR;
        }
    }
    int curPrio;
    OSSignalEvent *temp;
    OS_ENTER_CRITICAL();
    curPrio = OSPrioCur;
    temp = OSSignalFuncRegisterTabel[curPrio];
    while (temp->signalNum < signalNum) //跳过小的
    {
        temp = temp->pNextNum;
        if (temp == NULL)
        {
            break;
        }
    }
    if (temp == NULL) //如果是空的话 那么就是没有对应的信号
    {
        OS_EXIT_CRITICAL();
        return OS_SIGNAL_NOT_FIND;
    }
    if (temp->signalNum == signalNum) //找到了 signalNum
    {
        if (prio == 64)
        {
            while (temp != NULL)
            {
                temp->mask = mask;
                temp = temp->pNext;
            }
            OS_EXIT_CRITICAL();
            return OS_NO_ERR;
        }
        else
        {
            while (temp != NULL) //接下找prio
            {
                if (temp->prio == prio)
                {
                    temp->mask = mask;
                    OS_EXIT_CRITICAL();
                    return OS_NO_ERR;
                }
                else
                {
                    temp = temp->pNext;
                }
            }
            OS_EXIT_CRITICAL();
            return OS_SIGNAL_NOT_FIND;
        }
    }
    else
    {
        OS_EXIT_CRITICAL();
        return OS_SIGNAL_NOT_FIND;
    }
    OS_EXIT_CRITICAL();
}

/*$PAGE*/
/*
*********************************************************************************************************
*                               OSSignalSetALLMaskFromTarget
*
* Description:	这是对信号接收方的任务是否接受发送给它的信号的掩码设置
*
* Arguments :   mask 这是掩码的数值，建议为1（不发送）或者0（会发送）
*
* Returns   :
*
* Note(s)   :   1） 这是信号接收方的任务使用的
*********************************************************************************************************
*/
void OSSignalSetALLMaskFromTarget(int mask)
{
    int curPrio;
    OS_ENTER_CRITICAL();
    curPrio = OSPrioCur;
    OSSignalTaskMask[curPrio] = mask; //这是总的mask
    OS_EXIT_CRITICAL();
}

/*$PAGE*/
/*
*********************************************************************************************************
*                               OSSignalSetMaskFromOrigin
*
* Description: 这是对信号接收方的任务是否接受发送给它的具体某一个信号的掩码设置
*
* Arguments :   signalNum 这个是信号的类型
*               originPrio 这是任务接收方的任务的prio
*               mask 这是掩码的数值，建议为1（不发送）或者0（会发送）
*
* Returns   :   OS_NO_ERR 运行成功
*				OS_SIGNAL_PRIO_ERR prio数值不对 0-最低优先级是具体某一个
*				OS_SIGNAL_NOT_FIND 没有找到对应的信号
*
* Note(s)   :   1） 这是信号接收方的任务使用的
*********************************************************************************************************
*/
int OSSignalSetMaskFromTarget(int signalNum, int originPrio, int mask)
{
    if (originPrio > OS_LOWEST_PRIO || originPrio < 0)
    {
        return OS_SIGNAL_PRIO_ERR;
    }
    int curPrio;
    OSSignalEvent *temp;
    OS_ENTER_CRITICAL();
    curPrio = OSPrioCur;
    temp = OSSignalFuncRegisterTabel[originPrio];
    while (temp->signalNum < signalNum) //跳过小数
    {
        temp = temp->pNextNum;
        if (temp == NULL)
        {
            OS_EXIT_CRITICAL();
            return OS_SIGNAL_NOT_FIND;
        }
    }
    if (temp->signalNum == signalNum) //是这个数
    {
        while (temp != NULL)
        {
            if (temp->prio == curPrio) //是这个目标
            {
                temp->mask = mask; //设置这个掩码
                OS_EXIT_CRITICAL();
                return OS_NO_ERR;
            }
            else
            {
                temp = temp->pNext; //指向下一个
            }
        }
    }
    OS_EXIT_CRITICAL();
    return OS_SIGNAL_NOT_FIND;
}