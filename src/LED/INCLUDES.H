/*
*********************************************************************************************************
*                                                uC/OS-II
*                                          The Real-Time Kernel
*
*                           (c) Copyright 1992-1999, Jean J. Labrosse, Weston, FL
*                                           All Rights Reserved
*
*                                           MASTER INCLUDE FILE
*********************************************************************************************************
*/
/*
*****************************************************************************************
修改者：tao
修改：添加了外部函数的声明（灯光和初始化开发板） 和 修改了对应的include文件路径
*****************************************************************************************
*/
extern void SetWhiteLED();
extern void SetRedLED();
extern void SetGreenLED();
extern void SetBlueLED();

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <setjmp.h>

#include "..\RISCV\OS_CPU.H"
#include "OS_CFG.H"
#include "..\SOURCE\uCOSII.H"

