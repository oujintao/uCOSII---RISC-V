/* 
*****************************************************************************************
编写者：tao
文件：PLIC.H
日期：2020.8.17
作用：声明了PLIC.S的汇编函数，并且拓展了几个函数的C声明和定义，方便使用
*****************************************************************************************
*/

#define WDOGCMP_Interrupt 1
#define RTCCMP_Interrupt 2
#define UART0_Interrupt 3
#define UART1_Interrupt 4
#define QSPI0_Interrupt 5
#define QSPI1_Interrupt 6
#define QSPI2_Interrupt 7
#define GPIO0_Interrupt 8
#define GPIO1_Interrupt 9
#define GPIO2_Interrupt 10
#define GPIO3_Interrupt 11
#define GPIO4_Interrupt 12
#define GPIO5_Interrupt 13
#define GPIO6_Interrupt 14
#define GPIO7_Interrupt 15
#define GPIO8_Interrupt 16
#define GPIO9_Interrupt 17
#define GPIO10_Interrupt 18
#define GPIO11_Interrupt 19
#define GPIO12_Interrupt 20
#define GPIO13_Interrupt 21
#define GPIO14_Interrupt 22
#define GPIO15_Interrupt 23
#define GPIO16_Interrupt 24
#define GPIO17_Interrupt 25
#define GPIO18_Interrupt 26
#define GPIO19_Interrupt 27
#define GPIO20_Interrupt 28
#define GPIO21_Interrupt 29
#define GPIO22_Interrupt 30
#define GPIO23_Interrupt 31
#define GPIO24_Interrupt 32
#define GPIO25_Interrupt 33
#define GPIO26_Interrupt 34
#define GPIO27_Interrupt 35
#define GPIO28_Interrupt 36
#define GPIO29_Interrupt 37
#define GPIO30_Interrupt 38
#define GPIO31_Interrupt 39
#define PWM0CMP0_Interrupt 40
#define PWM0CMP1_Interrupt 41
#define PWM0CMP2_Interrupt 42
#define PWM0CMP3_Interrupt 43
#define PWM1CMP0_Interrupt 44
#define PWM1CMP1_Interrupt 45
#define PWM1CMP2_Interrupt 46
#define PWM1CMP3_Interrupt 47
#define PWM2CMP0_Interrupt 48
#define PWM2CMP1_Interrupt 49
#define PWM2CMP2_Interrupt 50
#define PWM2CMP3_Interrupt 51

extern void SetSource1Priority(unsigned int data3Bit);
extern void SetSource2Priority(unsigned int data3Bit);
extern void SetSource3Priority(unsigned int data3Bit);
extern void SetSource4Priority(unsigned int data3Bit);
extern void SetSource5Priority(unsigned int data3Bit);
extern void SetSource6Priority(unsigned int data3Bit);
extern void SetSource7Priority(unsigned int data3Bit);
extern void SetSource8Priority(unsigned int data3Bit);
extern void SetSource9Priority(unsigned int data3Bit);
extern void SetSource10Priority(unsigned int data3Bit);
extern void SetSource11Priority(unsigned int data3Bit);
extern void SetSource12Priority(unsigned int data3Bit);
extern void SetSource13Priority(unsigned int data3Bit);
extern void SetSource14Priority(unsigned int data3Bit);
extern void SetSource15Priority(unsigned int data3Bit);
extern void SetSource16Priority(unsigned int data3Bit);
extern void SetSource17Priority(unsigned int data3Bit);
extern void SetSource18Priority(unsigned int data3Bit);
extern void SetSource19Priority(unsigned int data3Bit);
extern void SetSource20Priority(unsigned int data3Bit);
extern void SetSource21Priority(unsigned int data3Bit);
extern void SetSource22Priority(unsigned int data3Bit);
extern void SetSource23Priority(unsigned int data3Bit);
extern void SetSource24Priority(unsigned int data3Bit);
extern void SetSource25Priority(unsigned int data3Bit);
extern void SetSource26Priority(unsigned int data3Bit);
extern void SetSource27Priority(unsigned int data3Bit);
extern void SetSource28Priority(unsigned int data3Bit);
extern void SetSource29Priority(unsigned int data3Bit);
extern void SetSource30Priority(unsigned int data3Bit);
extern void SetSource31Priority(unsigned int data3Bit);
extern void SetSource32Priority(unsigned int data3Bit);
extern void SetSource33Priority(unsigned int data3Bit);
extern void SetSource34Priority(unsigned int data3Bit);
extern void SetSource35Priority(unsigned int data3Bit);
extern void SetSource36Priority(unsigned int data3Bit);
extern void SetSource37Priority(unsigned int data3Bit);
extern void SetSource38Priority(unsigned int data3Bit);
extern void SetSource39Priority(unsigned int data3Bit);
extern void SetSource40Priority(unsigned int data3Bit);
extern void SetSource41Priority(unsigned int data3Bit);
extern void SetSource42Priority(unsigned int data3Bit);
extern void SetSource43Priority(unsigned int data3Bit);
extern void SetSource44Priority(unsigned int data3Bit);
extern void SetSource45Priority(unsigned int data3Bit);
extern void SetSource46Priority(unsigned int data3Bit);
extern void SetSource47Priority(unsigned int data3Bit);
extern void SetSource48Priority(unsigned int data3Bit);
extern void SetSource49Priority(unsigned int data3Bit);
extern void SetSource50Priority(unsigned int data3Bit);
extern void SetSource51Priority(unsigned int data3Bit);

extern unsigned int CheckSourcePending(unsigned int data0To51);
extern void ClearSourcePending(unsigned int data0To51);

extern void Target0InterruptXEnable(unsigned int data0To51);
extern void Target0InterruptXDisable(unsigned int data0To51);

extern void SetTarget0PriorityThreshold(unsigned int data3Bit);

extern void CheckTarget0Claim();
extern void ClearTarget0Complete();

#define SetWDogCMPPriority(data3Bit) SetSource1Priority(data3Bit)
#define SetRTCCMPPriority(data3Bit) SetSource2Priority(data3Bit)
#define SetUART0Priority(data3Bit) SetSource3Priority(data3Bit)
#define SetUART1Priority(data3Bit) SetSource4Priority(data3Bit)
#define SetQSPI0Priority(data3Bit) SetSource5Priority(data3Bit)
#define SetQSPI1Priority(data3Bit) SetSource6Priority(data3Bit)
#define SetQSPI2Priority(data3Bit) SetSource7Priority(data3Bit)
#define SetGPIO0Priority(data3Bit) SetSource8Priority(data3Bit)
#define SetGPIO1Priority(data3Bit) SetSource9Priority(data3Bit)
#define SetGPIO2Priority(data3Bit) SetSource10Priority(data3Bit)
#define SetGPIO3Priority(data3Bit) SetSource11Priority(data3Bit)
#define SetGPIO4Priority(data3Bit) SetSource12Priority(data3Bit)
#define SetGPIO5Priority(data3Bit) SetSource13Priority(data3Bit)
#define SetGPIO6Priority(data3Bit) SetSource14Priority(data3Bit)
#define SetGPIO7Priority(data3Bit) SetSource15Priority(data3Bit)
#define SetGPIO8Priority(data3Bit) SetSource16Priority(data3Bit)
#define SetGPIO9Priority(data3Bit) SetSource17Priority(data3Bit)
#define SetGPIO10Priority(data3Bit) SetSource18Priority(data3Bit)
#define SetGPIO11Priority(data3Bit) SetSource19Priority(data3Bit)
#define SetGPIO12Priority(data3Bit) SetSource20Priority(data3Bit)
#define SetGPIO13Priority(data3Bit) SetSource21Priority(data3Bit)
#define SetGPIO14Priority(data3Bit) SetSource22Priority(data3Bit)
#define SetGPIO15Priority(data3Bit) SetSource23Priority(data3Bit)
#define SetGPIO16Priority(data3Bit) SetSource24Priority(data3Bit)
#define SetGPIO17Priority(data3Bit) SetSource25Priority(data3Bit)
#define SetGPIO18Priority(data3Bit) SetSource26Priority(data3Bit)
#define SetGPIO19Priority(data3Bit) SetSource27Priority(data3Bit)
#define SetGPIO20Priority(data3Bit) SetSource28Priority(data3Bit)
#define SetGPIO21Priority(data3Bit) SetSource29Priority(data3Bit)
#define SetGPIO22Priority(data3Bit) SetSource30Priority(data3Bit)
#define SetGPIO23Priority(data3Bit) SetSource31Priority(data3Bit)
#define SetGPIO24Priority(data3Bit) SetSource32Priority(data3Bit)
#define SetGPIO25Priority(data3Bit) SetSource33Priority(data3Bit)
#define SetGPIO26Priority(data3Bit) SetSource34Priority(data3Bit)
#define SetGPIO27Priority(data3Bit) SetSource35Priority(data3Bit)
#define SetGPIO28Priority(data3Bit) SetSource36Priority(data3Bit)
#define SetGPIO29Priority(data3Bit) SetSource37Priority(data3Bit)
#define SetGPIO30Priority(data3Bit) SetSource38Priority(data3Bit)
#define SetGPIO31Priority(data3Bit) SetSource39Priority(data3Bit)
#define PWM0CMP0Priority(data3Bit) SetSource40Priority(data3Bit)
#define PWM0CMP1Priority(data3Bit) SetSource41Priority(data3Bit)
#define PWM0CMP2Priority(data3Bit) SetSource42Priority(data3Bit)
#define PWM0CMP3Priority(data3Bit) SetSource43Priority(data3Bit)
#define PWM1CMP0Priority(data3Bit) SetSource44Priority(data3Bit)
#define PWM1CMP1Priority(data3Bit) SetSource45Priority(data3Bit)
#define PWM1CMP2Priority(data3Bit) SetSource46Priority(data3Bit)
#define PWM1CMP3Priority(data3Bit) SetSource47Priority(data3Bit)
#define PWM2CMP0Priority(data3Bit) SetSource48Priority(data3Bit)
#define PWM2CMP1Priority(data3Bit) SetSource49Priority(data3Bit)
#define PWM2CMP2Priority(data3Bit) SetSource50Priority(data3Bit)
#define PWM2CMP3Priority(data3Bit) SetSource51Priority(data3Bit)