/* 
*****************************************************************************************
编写者：tao
文件：PMU.H
日期：2020.8.17
作用：声明了PMU.S的汇编函数，方便使用
*****************************************************************************************
*/

#define PMU_HFCLKRST 0x100
#define PMU_CORERST 0x80
#define PMU_PADRST 0x40
#define PMU_VDDPADEN 0x20
#define PMU_PMU_OUT_1_EN 0x20
#define PMU_PMU_OUT_0_EN 0x10

extern void SetPMUWAKEUPI0Value(unsigned int data8To5And3To0);
extern void SetPMUWAKEUPI1Value(unsigned int data8To5And3To0);
extern void SetPMUWAKEUPI2Value(unsigned int data8To5And3To0);
extern void SetPMUWAKEUPI3Value(unsigned int data8To5And3To0);
extern void SetPMUWAKEUPI4Value(unsigned int data8To5And3To0);
extern void SetPMUWAKEUPI5Value(unsigned int data8To5And3To0);
extern void SetPMUWAKEUPI6Value(unsigned int data8To5And3To0);
extern void SetPMUWAKEUPI7Value(unsigned int data8To5And3To0);

extern void SetPMUSLEEPI0Value(unsigned int data8To5And3To0);
extern void SetPMUSLEEPI1Value(unsigned int data8To5And3To0);
extern void SetPMUSLEEPI2Value(unsigned int data8To5And3To0);
extern void SetPMUSLEEPI3Value(unsigned int data8To5And3To0);
extern void SetPMUSLEEPI4Value(unsigned int data8To5And3To0);
extern void SetPMUSLEEPI5Value(unsigned int data8To5And3To0);
extern void SetPMUSLEEPI6Value(unsigned int data8To5And3To0);
extern void SetPMUSLEEPI7Value(unsigned int data8To5And3To0);

extern void PMUWakeupEnableDwakeup();
extern void PMUWakeupDisableDwakeup();
extern void PMUWakeupEnableRTC();
extern void PMUWakeupDisableRTC();

#define RESETCAUSE_POR 0x0
#define RESETCAUSE_EXTRESET 0x1
#define RESETCAUSE_WATCHDOG 0x2

#define WAKEUPCAUSE_RESET 0x0
#define WAKEUPCAUSE_RTCINTERRUPT 0x1
#define WAKEUPCAUSE_DWAKEUP 0x2
extern unsigned int ReadPMUCAUSEValue();

extern void CoreSleep();