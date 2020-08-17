/* 
*****************************************************************************************
编写者：tao
文件：RTC.H
日期：2020.8.17
作用：声明了RTC.S的汇编函数，方便使用
*****************************************************************************************
*/

extern unsigned int RTCCheckIP();
extern void RTCEnableAlways();
extern void RTCDisableAlways();
extern void RTCSetScaleValue(unsigned int data4Bit);

extern unsigned int RTCReadLOValue();
extern void RTCSetLOValue(unsigned int data32Bit);

extern unsigned int RTCReadHIValue();
extern void RTCSetHIValue(unsigned int data16Bit);

extern unsigned int RTCReadCSL32Value();

extern void RTCReadCSL32Value(unsigned int data32Bit);

extern void RTCSetCMPValue(unsigned int data32Bit);