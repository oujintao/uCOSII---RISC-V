/* 
*****************************************************************************************
编写者：tao
文件：GPIO.H
日期：2020.8.17
作用：声明了GPIO.S的汇编函数，并且拓展了几个函数的C声明和定义，方便使用
*****************************************************************************************
*/

#define GPIO_PIN0 0x00000001
#define GPIO_PIN1 0x00000002
#define GPIO_PIN2 0x00000004
#define GPIO_PIN3 0x00000008
#define GPIO_PIN4 0x00000010
#define GPIO_PIN5 0x00000020
#define GPIO_PIN6 0x00000040
#define GPIO_PIN7 0x00000080
#define GPIO_PIN8 0x00000100
#define GPIO_PIN9 0x00000200
#define GPIO_PIN10 0x00000400
#define GPIO_PIN11 0x00000800
#define GPIO_PIN12 0x00001000
#define GPIO_PIN13 0x00002000
#define GPIO_PIN14 0x00004000
#define GPIO_PIN15 0x00008000
#define GPIO_PIN16 0x00010000
#define GPIO_PIN17 0x00020000
#define GPIO_PIN18 0x00040000
#define GPIO_PIN19 0x00080000
#define GPIO_PIN20 0x00100000
#define GPIO_PIN21 0x00200000
#define GPIO_PIN22 0x00400000
#define GPIO_PIN23 0x00800000
#define GPIO_PIN24 0x01000000
#define GPIO_PIN25 0x02000000
#define GPIO_PIN26 0x04000000
#define GPIO_PIN27 0x08000000
#define GPIO_PIN28 0x10000000
#define GPIO_PIN29 0x20000000
#define GPIO_PIN30 0x40000000
#define GPIO_PIN31 0x80000000

#define GPIO_UART0RX GPIO_PIN16
#define GPIO_UART0TX GPIO_PIN17

#define GPIO_SPI1SS0 GPIO_PIN2
#define GPIO_SPI1SD0 GPIO_PIN3
#define GPIO_SPI1MOSI GPIO_PIN3
#define GPIO_SPI1SD1 GPIO_PIN4
#define GPIO_SPI1MISO GPIO_PIN4
#define GPIO_SPI1SCK GPIO_PIN5

#define GPIO_SPI1SS2 GPIO_PIN9
#define GPIO_SPI1SS3 GPIO_PIN10

#define GPIO_PWM00 GPIO_PIN0
#define GPIO_PWM01 GPIO_PIN1
#define GPIO_PWM02 GPIO_PIN2
#define GPIO_PWM03 GPIO_PIN3

#define GPIO_PWM10 GPIO_PIN20
#define GPIO_PWM11 GPIO_PIN19
#define GPIO_PWM12 GPIO_PIN21
#define GPIO_PWM13 GPIO_PIN22

#define GPIO_PWM20 GPIO_PIN10
#define GPIO_PWM21 GPIO_PIN11
#define GPIO_PWM22 GPIO_PIN12
#define GPIO_PWM23 GPIO_PIN13

#define GPIO_LED_RED GPIO_PIN22
#define GPIO_LED_GREEN GPIO_PIN19
#define GPIO_LED_BLUE GPIO_PIN21

#define GPIO_PIN_Interrupt_Set_RISE 0
#define GPIO_PIN_Interrupt_Set_FALL 1
#define GPIO_PIN_Interrupt_Set_HIGH 2
#define GPIO_PIN_Interrupt_Set_LOW 3

extern void SetGPIOPINValue(unsigned int GPIO_PIN_NUM);
extern void ClearGPIOPINValue(unsigned int GPIO_PIN_NUM);
extern void XORGPIOPINValue(unsigned int GPIO_PIN_NUM);
extern void NORXORGPIOPINValue(unsigned int GPIO_PIN_NUM);
extern void GPIOPINOutputEnable(unsigned int GPIO_PIN_NUM);
extern void GPIOPINOutputDisable(unsigned int GPIO_PIN_NUM);
extern void GPIOPINInputEnable(unsigned int GPIO_PIN_NUM);
extern void GPIOPINInputDisable(unsigned int GPIO_PIN_NUM);
extern unsigned int GPIOInputValueRead();
extern void GPIOPINDSSet(unsigned int GPIO_PIN_DS);
extern void GPIOPINInterruptSetIE(unsigned int GPIO_PIN_NUM, unsigned int GPIO_Interrupt_Mode);
extern void GPIOPINInterruptClearIE(unsigned int GPIO_PIN_NUM, unsigned int GPIO_Interrupt_Mode);
/*
GPIO_Interrupt_Mode:
#define GPIO_PIN_Interrupt_Set_RISE 0
#define GPIO_PIN_Interrupt_Set_FALL 1
#define GPIO_PIN_Interrupt_Set_HIGH 2
#define GPIO_PIN_Interrupt_Set_LOW 3
*/
extern void GPIOPINReadIPState(unsigned int GPIO_Interrupt_Mode);

extern void GPIOPINIOFEnable(unsigned int GPIO_PIN_NUM);
extern void GPIOPINIOFDisable(unsigned int GPIO_PIN_NUM);
extern void GPIOPINIOFSelSet(unsigned int GPIO_PIN_NUM);
extern void GPIOPINIOFSelClear(unsigned int GPIO_PIN_NUM);
