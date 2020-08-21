#include ".\HiFive1RevB\PLIC\PLIC.H"

extern void MExternIntISR()
{
    unsigned int i;
    unsigned int currentSourceNum = 0;
    int currentSourcePriority = -1;

    for (i = 1; i < 52; i++)
    {
        if(CheckSourcePending(i))
        {
            if(currentSourcePriority < ReadSourceXPriorityValue(i))
            {
                currentSourceNum = i;
                currentSourcePriority = ReadSourceXPriorityValue(i);
            }
        }
    }
    if(currentSourceNum != 0)
    {
        if (sourceXISRFuncSet[currentSourceNum] != 0)
        {
            sourceXISRFuncSet[currentSourceNum]();
        }
        ClearSourcePending(currentSourceNum);
    }
}