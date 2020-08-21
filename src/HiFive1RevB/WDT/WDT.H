/* 
*****************************************************************************************
编写者：tao
文件：WDT.H
日期：2020.8.17
作用：声明了WDT.S的汇编函数，方便使用
*****************************************************************************************
*/

extern unsigned int WDTCheckIP();
extern void WDTSetIPValue(unsigned int data1Bit);
extern void WDTEnableCoreAwake();
extern void WDTDisableCoreAwake();
extern void WDTEnableAlways();
extern void WDTDisableAlways();
extern void WDTEnableZeroCMP();
extern void WDTDisableZeroCMP();
extern void WDTEnableRSTEN();
extern void WDTDisableRSTEN();
extern void WDTSetScaleValue(unsigned int data4Bit);

extern unsigned int WDTGetWDOGCOUNTValue();
extern void WDTSetWDOGCOUNTValue(unsigned int data31Bit);

extern unsigned int WDTGetWDOGSValue();

extern void WDTFeed();

extern void WDTObtainKey();

extern void WDTSetCMPValue(unsigned int data16Bit);