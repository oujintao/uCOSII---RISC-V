/* 
*****************************************************************************************
编写者：tao
文件：SPI.H
日期：2020.8.17
作用：声明了SPI.S的汇编函数，并且拓展了几个函数的C声明和定义，方便使用
*****************************************************************************************
*/

/*
SCKDIV
div 11:0
*/
extern void SPI0SetFSCKDIV(unsigned int Data12Bit);
extern void SPI1SetFSCKDIV(unsigned int Data12Bit);
extern void SPI2SetFSCKDIV(unsigned int Data12Bit);
/*
SCKMODE
Polarity 1
Phase 0
*/
extern void SPI0SetSCKPolarityAndPhase(unsigned int Data2Bit);
extern void SPI1SetSCKPolarityAndPhase(unsigned int Data2Bit);
extern void SPI2SetSCKPolarityAndPhase(unsigned int Data2Bit);
#define CSID_SS1 1
#define CSID_SS2 2
#define CSID_SS3 3
/*
CSID
Enable SSX
SS3 3 2
SS2 2 1
SS1 1 0
*/
extern void SPI0SetChipSelectID(unsigned int Data);
extern void SPI1SetChipSelectID(unsigned int Data);
extern void SPI2SetChipSelectID(unsigned int Data);
#define CSDEF_CS0 0
#define CSDEF_CS1 1
#define CSDEF_CS2 2
#define CSDEF_CS3 3
/*
CSDEF
CS0 0
CS1 1
CS2 2
CS3 3
*/
extern void SPI0SetChipSelectDefaultValue(unsigned int Data);
extern void SPI1SetChipSelectDefaultValue(unsigned int Data);
extern void SPI2SetChipSelectDefaultValue(unsigned int Data);
#define CSMODE_OFF 3
#define CSMODE_HOLD 2
#define CSMODE_AUTO 0
/*
CSMODE
OFF 3
HOLD 2
AUTO 0
*/
extern void SPI0SetCSModeOFF3HOLD2AUTO0(unsigned int Data2Bit);
extern void SPI1SetCSModeOFF3HOLD2AUTO0(unsigned int Data2Bit);
extern void SPI2SetCSModeOFF3HOLD2AUTO0(unsigned int Data2Bit);
/*
DELAY0
SCKCS 在发送完毕之后多少个周期依然有效
CSSCK 在发送之前多少个周期后才有效
*/
extern void SPI0SetSCKCS(unsigned int data8Bit);
extern void SPI0SetCSSCK(unsigned int data8Bit);
extern void SPI1SetSCKCS(unsigned int data8Bit);
extern void SPI1SetCSSCK(unsigned int data8Bit);
extern void SPI2SetSCKCS(unsigned int data8Bit);
extern void SPI2SetCSSCK(unsigned int data8Bit);
/*
DELAY1
interxfr 两个数据帧之前的最少间隔周期数
intercs 有效到无效后 在 重新有效之前 多少周期数
*/
extern void SPI0SetInterxfr(unsigned int data8Bit);
extern void SPI0SetIntercs(unsigned int data8Bit);
extern void SPI1SetInterxfr(unsigned int data8Bit);
extern void SPI1SetIntercs(unsigned int data8Bit);
extern void SPI2SetInterxfr(unsigned int data8Bit);
extern void SPI2SetIntercs(unsigned int data8Bit);
#define PROTO_QUAD_SPI 2
#define PROTO_DUAL_SPI 1
#define PROTO_SIGNAL_SPI 0
#define PROTO_LSB 1
#define PROTO_MSB 0
#define PROTO_TX 1
#define PROTO_RX 0
/*
FMT
proto 1:0  2 Quad-SPI 1 Dual-SPI 0 Signal-SPI
endian 2 1 LSB 0 MSB
dir 3 1 TX 0 RX
len 19:16 一帧数据的比特数  0-8
*/
extern void SPI0SetProto(unsigned int Data2Bit);
extern void SPI0SetEndianLSBMSB(unsigned int Data1Bit);
extern void SPI0SetDirTXOrRX(unsigned int Data1Bit);
extern void SPI0SetLen(unsigned int Data4Bit);
extern void SPI1SetProto(unsigned int Data2Bit);
extern void SPI1SetEndianLSBMSB(unsigned int Data1Bit);
extern void SPI1SetDirTXOrRX(unsigned int Data1Bit);
extern void SPI1SetLen(unsigned int Data4Bit);
extern void SPI2SetProto(unsigned int Data2Bit);
extern void SPI2SetEndianLSBMSB(unsigned int Data1Bit);
extern void SPI2SetDirTXOrRX(unsigned int Data1Bit);
extern void SPI2SetLen(unsigned int Data4Bit);
/*
TXDATA
*/
extern unsigned int SPI0TXCheckFull();
extern void SPI0TXWriteData(unsigned int data8Bit);
extern unsigned int SPI1TXCheckFull();
extern void SPI1TXWriteData(unsigned int data8Bit);
extern unsigned int SPI2TXCheckFull();
extern void SPI2TXWriteData(unsigned int data8Bit);
/*
RXDATA
*/
extern unsigned int SPI0RXCheckEmpty();
extern unsigned int SPI0RXReadData();
extern unsigned int SPI1RXCheckEmpty();
extern unsigned int SPI1RXReadData();
extern unsigned int SPI2RXCheckEmpty();
extern unsigned int SPI2RXReadData();
/*
TXDATA
TX Count Interrupt watermark
*/
extern void SPI0SetTXMark(unsigned int Data3Bit);
extern void SPI1SetTXMark(unsigned int Data3Bit);
extern void SPI2SetTXMark(unsigned int Data3Bit);
/*
RXDATA
RX Count Interrupt watermark
*/
extern void SPI0SetRXMark(unsigned int Data3Bit);
extern void SPI1SetRXMark(unsigned int Data3Bit);
extern void SPI2SetRXMark(unsigned int Data3Bit);
/*
FCTRL
SPI0 FLASHXiPEnable
*/
extern void SPI0FlashXiPEnable();
extern void SPI0FlashXiPDisable();
/*
FFMT
cmd_en 0
addr_len 3:1
pad_cnt 7:4
cmd_proto 9:8
addr_proto 11:10
data_proto 13:12
cmd_code 23:16
pad_code 31:24
*/
extern void SPI0SendCmdEnable();
extern void SPI0SendCmdDisable();
extern void SPI0SetADDRLen0To4(unsigned int Data3Bit0To4);
extern void SPI0SetDummyCyclesCount(unsigned int Data4Bit);
extern void SPI0SetCMDProto(unsigned int Data2Bit);
extern void SPI0SetADDRProto(unsigned int Data2Bit);
extern void SPI0SetDataProto(unsigned int Data2Bit);
extern void SPI0SetCMDCode(unsigned int data8Bit);
extern void SPI0SetPadCode8Bit(unsigned int data8Bit);
/*
IE
TX RX Interrupt Enable
*/
extern void SPI0TXInterruptEnable();
extern void SPI0TXInterruptDisable();
extern void SPI0RXInterruptEnable();
extern void SPI0RXInterruptDisable();
extern void SPI1TXInterruptEnable();
extern void SPI1TXInterruptDisable();
extern void SPI1RXInterruptEnable();
extern void SPI1RXInterruptDisable();
extern void SPI2TXInterruptEnable();
extern void SPI2TXInterruptDisable();
extern void SPI2RXInterruptEnable();
extern void SPI2RXInterruptDisable();
/*
IP
TX RX Interrupt Pending
*/
extern unsigned int SPI0CheckTXIP();
extern unsigned int SPI0CheckRXIP();
extern unsigned int SPI1CheckTXIP();
extern unsigned int SPI1CheckRXIP();
extern unsigned int SPI2CheckTXIP();
extern unsigned int SPI2CheckRXIP();

extern void SPI0SendData(unsigned int data8Bit)
{
    while (SPI0TXCheckFull())
    {
    }
    SPI0SendData(data8Bit);
}

extern unsigned int SPI0ReadData(unsigned int data8Bit)
{
    while (SPI0RXCheckEmpty())
    {
    }
    return SPI0RXReadData();
}

extern void SPI1SendData(unsigned int data8Bit)
{
    while (SPI1TXCheckFull())
    {
    }
    SPI1SendData(data8Bit);
}

extern unsigned int SPI1ReadData(unsigned int data8Bit)
{
    while (SPI1RXCheckEmpty())
    {
    }
    return SPI1RXReadData();
}

extern void SPI2SendData(unsigned int data8Bit)
{
    while (SPI2TXCheckFull())
    {
    }
    SPI2SendData(data8Bit);
}

extern unsigned int SPI2ReadData(unsigned int data8Bit)
{
    while (SPI2RXCheckEmpty())
    {
    }
    return SPI2RXReadData();
}