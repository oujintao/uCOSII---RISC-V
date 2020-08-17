/* 
*****************************************************************************************
编写者：tao
文件：UART.H
日期：2020.8.17
作用：声明了UART.S的汇编函数，并且拓展了几个函数的C声明和定义，方便使用
*****************************************************************************************
*/

extern unsigned int UART0CheckTXFull();
extern unsigned int UART1CheckTXFull();

extern void UART0TXDataWrite(unsigned int Data8Bit);
extern void UART1TXDataWrite(unsigned int Data8Bit);

extern unsigned int UART0CheckRXEmpty();
extern unsigned int UART1CheckRXEmpty();

extern unsigned int UART0RXDataRead();
extern unsigned int UART1RXDataRead();
extern void UART0TXEnable();
extern void UART0TXDisable();
extern void UART1TXEnable();
extern void UART1TXDisable();

extern void UART0OneStopBit();
extern void UART0TwoStopBit();
extern void UART1OneStopBit();
extern void UART1TwoStopBit();

extern void UART0TXSetInterruptWatermark(unsigned int Data3Bit);
extern void UART1TXSetInterruptWatermark(unsigned int Data3Bit);

extern void UART0RXEnable();
extern void UART0RXDisable();
extern void UART1RXEnable();
extern void UART1RXDisable();

extern void UART0RXSetInterruptWatermark(unsigned int Data3Bit);
extern void UART1RXSetInterruptWatermark(unsigned int Data3Bit);

extern void UART0TXInterruptEnable();
extern void UART0TXInterruptDisable();
extern void UART1TXInterruptEnable();
extern void UART1TXInterruptDisable();

extern void UART0RXInterruptEnable();
extern void UART0RXInterruptDisable();
extern void UART1RXInterruptEnable();
extern void UART1RXInterruptDisable();

extern unsigned int UART0TXInterruptPending();
extern unsigned int UART1TXInterruptPending();
extern unsigned int UART0RXInterruptPending();
extern unsigned int UART1RXInterruptPending();

extern void UART0DivUpdate(unsigned int Data16Bit);
extern void UART1DivUpdate(unsigned int Data16Bit);

/*
HIFiveRevB没有IOF口是接UART1
*/
#define UART0Set9600BaudRate UART0DivUpdate(39999);
#define UART0Set115000BaudRate UART0DivUpdate(3338);
extern unsigned int UART0SetBaudRate(unsigned int baudRate)
{
    unsigned int temp;
    if (baudRate < 16)
    {
        return 1;
    }
    else
    {
        temp = 384000000 / baudRate;
        temp--;
        UART0DivUpdate(temp);
    }
    return 0;
}

extern void UART0Send8bit(unsigned int Data8Bit)
{
    while (UART0CheckTXFull())
    {
    }
    UART0TXDataWrite(Data8Bit);
}

extern unsigned int UART0Readd8bit(void)
{
    while (UART0CheckRXEmpty())
    {
    }
    return UART0RXDataRead();
}