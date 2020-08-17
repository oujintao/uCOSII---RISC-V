/* 
*****************************************************************************************
编写者：tao
文件：PWM.H
日期：2020.8.17
作用：声明了PWM.S的汇编函数，并且拓展了几个函数的C声明和定义，方便使用
*****************************************************************************************
*/

//////////////////////////////PWMCFG//////////////////////////////
extern unsigned int PWM0CheckCMP0IP();
extern void PWM0SetCMP0IPValue(unsigned int data1Bit);
extern unsigned int PWM0CheckCMP1IP();
extern void PWM0SetCMP1IPValue(unsigned int data1Bit);
extern unsigned int PWM0CheckCMP2IP();
extern void PWM0SetCMP2IPValue(unsigned int data1Bit);
extern unsigned int PWM0CheckCMP3IP();
extern void PWM0SetCMP3IPValue(unsigned int data1Bit);
extern void PWM0SetCMP01GANGValue(unsigned int data1Bit);
extern void PWM0SetCMP12GANGValue(unsigned int data1Bit);
extern void PWM0SetCMP23GANGValue(unsigned int data1Bit);
extern void PWM0SetCMP30GANGValue(unsigned int data1Bit);
extern void PWM0SetCMP0CompareCenterValue(unsigned int data1Bit);
extern void PWM0SetCMP1CompareCenterValue(unsigned int data1Bit);
extern void PWM0SetCMP2CompareCenterValue(unsigned int data1Bit);
extern void PWM0SetCMP3CompareCenterValue(unsigned int data1Bit);
extern void PWM0EnableAlways();
extern void PWM0EnableOneShot();
extern void PWM0Disable();
extern void PWM0SetDeglitchValue(unsigned int data1Bit);
extern void PWM0SetZeroCMPValue(unsigned int data1Bit);
extern void PWM0SetStickyValue(unsigned int data1Bit);
extern void PWM0SetPWMScaleValue(unsigned int data4Bit);

extern unsigned int PWM1CheckCMP0IP();
extern void PWM1SetCMP0IPValue(unsigned int data1Bit);
extern unsigned int PWM1CheckCMP1IP();
extern void PWM1SetCMP1IPValue(unsigned int data1Bit);
extern unsigned int PWM1CheckCMP2IP();
extern void PWM1SetCMP2IPValue(unsigned int data1Bit);
extern unsigned int PWM1CheckCMP3IP();
extern void PWM1SetCMP3IPValue(unsigned int data1Bit);
extern void PWM1SetCMP01GANGValue(unsigned int data1Bit);
extern void PWM1SetCMP12GANGValue(unsigned int data1Bit);
extern void PWM1SetCMP23GANGValue(unsigned int data1Bit);
extern void PWM1SetCMP30GANGValue(unsigned int data1Bit);
extern void PWM1SetCMP0CompareCenterValue(unsigned int data1Bit);
extern void PWM1SetCMP1CompareCenterValue(unsigned int data1Bit);
extern void PWM1SetCMP2CompareCenterValue(unsigned int data1Bit);
extern void PWM1SetCMP3CompareCenterValue(unsigned int data1Bit);
extern void PWM1EnableAlways();
extern void PWM1EnableOneShot();
extern void PWM1Disable();
extern void PWM1SetDeglitchValue(unsigned int data1Bit);
extern void PWM1SetZeroCMPValue(unsigned int data1Bit);
extern void PWM1SetStickyValue(unsigned int data1Bit);
extern void PWM1SetPWMScaleValue(unsigned int data4Bit);

extern unsigned int PWM2CheckCMP0IP();
extern void PWM2SetCMP0IPValue(unsigned int data1Bit);
extern unsigned int PWM2CheckCMP1IP();
extern void PWM2SetCMP1IPValue(unsigned int data1Bit);
extern unsigned int PWM2CheckCMP2IP();
extern void PWM2SetCMP2IPValue(unsigned int data1Bit);
extern unsigned int PWM2CheckCMP3IP();
extern void PWM2SetCMP3IPValue(unsigned int data1Bit);
extern void PWM2SetCMP01GANGValue(unsigned int data1Bit);
extern void PWM2SetCMP12GANGValue(unsigned int data1Bit);
extern void PWM2SetCMP23GANGValue(unsigned int data1Bit);
extern void PWM2SetCMP30GANGValue(unsigned int data1Bit);
extern void PWM2SetCMP0CompareCenterValue(unsigned int data1Bit);
extern void PWM2SetCMP1CompareCenterValue(unsigned int data1Bit);
extern void PWM2SetCMP2CompareCenterValue(unsigned int data1Bit);
extern void PWM2SetCMP3CompareCenterValue(unsigned int data1Bit);
extern void PWM2EnableAlways();
extern void PWM2EnableOneShot();
extern void PWM2Disable();
extern void PWM2SetDeglitchValue(unsigned int data1Bit);
extern void PWM2SetZeroCMPValue(unsigned int data1Bit);
extern void PWM2SetStickyValue(unsigned int data1Bit);
extern void PWM2SetPWMScaleValue(unsigned int data4Bit);

//////////////////////////////PWMCOUNT//////////////////////////////
extern void PWM0SetPWMCOUNTValue(unsigned int data23Bit);
extern void PWM1SetPWMCOUNTValue(unsigned int data31Bit);
extern void PWM2SetPWMCOUNTValue(unsigned int data31Bit);

//////////////////////////////PWMS//////////////////////////////
extern unsigned int PWM0ReadPWMSValue();
extern unsigned int PWM1ReadPWMSValue();
extern unsigned int PWM2ReadPWMSValue();

//////////////////////////////PWMCMP0//////////////////////////////
extern void PWM0SetPWMCMP0Value(unsigned int data8Bit);
extern void PWM1SetPWMCMP0Value(unsigned int data16Bit);
extern void PWM2SetPWMCMP0Value(unsigned int data16Bit);
//////////////////////////////PWMCMP1//////////////////////////////
extern void PWM0SetPWMCMP1Value(unsigned int data8Bit);
extern void PWM1SetPWMCMP1Value(unsigned int data16Bit);
extern void PWM2SetPWMCMP1Value(unsigned int data16Bit);
//////////////////////////////PWMCMP2//////////////////////////////
extern void PWM0SetPWMCMP2Value(unsigned int data8Bit);
extern void PWM1SetPWMCMP2Value(unsigned int data16Bit);
extern void PWM2SetPWMCMP2Value(unsigned int data16Bit);
//////////////////////////////PWMCMP3//////////////////////////////
extern void PWM0SetPWMCMP3Value(unsigned int data8Bit);
extern void PWM1SetPWMCMP3Value(unsigned int data16Bit);
extern void PWM2SetPWMCMP3Value(unsigned int data16Bit);


extern void SetPWM0Channel0PWMValue(unsigned int data8Bit)
{
    PWM0SetDeglitchValue(1);
    PWM0SetZeroCMPValue(1);
    PWM0EnableAlways();
    PWM0SetPWMCMP0Value(data8Bit);
}
extern void SetPWM0Channel1PWMValue(unsigned int data8Bit)
{
    PWM0SetDeglitchValue(1);
    PWM0SetZeroCMPValue(1);
    PWM0EnableAlways();
    PWM0SetPWMCMP1Value(data8Bit);
}
extern void SetPWM0Channel2PWMValue(unsigned int data8Bit)
{
    PWM0SetDeglitchValue(1);
    PWM0SetZeroCMPValue(1);
    PWM0EnableAlways();
    PWM0SetPWMCMP2Value(data8Bit);
}
extern void SetPWM0Channel3PWMValue(unsigned int data16Bit)
{
    PWM0SetDeglitchValue(1);
    PWM0SetZeroCMPValue(1);
    PWM0EnableAlways();
    PWM0SetPWMCMP3Value(data16Bit);
}
extern void SetPWM1Channel0PWMValue(unsigned int data16Bit)
{
    PWM1SetDeglitchValue(1);
    PWM1SetZeroCMPValue(1);
    PWM1EnableAlways();
    PWM1SetPWMCMP0Value(data16Bit);
}
extern void SetPWM1Channel1PWMValue(unsigned int data16Bit)
{
    PWM1SetDeglitchValue(1);
    PWM1SetZeroCMPValue(1);
    PWM1EnableAlways();
    PWM1SetPWMCMP1Value(data16Bit);
}
extern void SetPWM1Channel2PWMValue(unsigned int data16Bit)
{
    PWM1SetDeglitchValue(1);
    PWM1SetZeroCMPValue(1);
    PWM1EnableAlways();
    PWM1SetPWMCMP2Value(data16Bit);
}
extern void SetPWM1Channel3PWMValue(unsigned int data16Bit)
{
    PWM1SetDeglitchValue(1);
    PWM1SetZeroCMPValue(1);
    PWM1EnableAlways();
    PWM1SetPWMCMP3Value(data16Bit);
}

extern void SetPWM2Channel0PWMValue(unsigned int data16Bit)
{
    PWM2SetDeglitchValue(1);
    PWM2SetZeroCMPValue(1);
    PWM2EnableAlways();
    PWM2SetPWMCMP0Value(data16Bit);
}
extern void SetPWM2Channel1PWMValue(unsigned int data16Bit)
{
    PWM2SetDeglitchValue(1);
    PWM2SetZeroCMPValue(1);
    PWM2EnableAlways();
    PWM2SetPWMCMP1Value(data16Bit);
}
extern void SetPWM2Channel2PWMValue(unsigned int data16Bit)
{
    PWM2SetDeglitchValue(1);
    PWM2SetZeroCMPValue(1);
    PWM2EnableAlways();
    PWM2SetPWMCMP2Value(data16Bit);
}
extern void SetPWM2Channel3PWMValue(unsigned int data16Bit)
{
    PWM2SetDeglitchValue(1);
    PWM2SetZeroCMPValue(1);
    PWM2EnableAlways();
    PWM2SetPWMCMP3Value(data16Bit);
}