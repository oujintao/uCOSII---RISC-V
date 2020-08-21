#pragma once
#ifndef RISCV_WRITEREGFILE
#define RISCV_WRITEREGFILE

#define RISCV_REG_ra 1
#define RISCV_REG_sp 2
#define RISCV_REG_gp 3
#define RISCV_REG_tp 4
#define RISCV_REG_t0 5
#define RISCV_REG_t1 6
#define RISCV_REG_t2 7
#define RISCV_REG_s0 8
#define RISCV_REG_fp 8
#define RISCV_REG_s1 9
#define RISCV_REG_a0 10
#define RISCV_REG_a1 11
#define RISCV_REG_a2 12
#define RISCV_REG_a3 13
#define RISCV_REG_a4 14
#define RISCV_REG_a5 15
#define RISCV_REG_a6 16
#define RISCV_REG_a7 17
#define RISCV_REG_s2 18
#define RISCV_REG_s3 19
#define RISCV_REG_s4 20
#define RISCV_REG_s5 21
#define RISCV_REG_s6 22
#define RISCV_REG_s7 23
#define RISCV_REG_s8 24
#define RISCV_REG_s9 25
#define RISCV_REG_s10 26
#define RISCV_REG_s11 27
#define RISCV_REG_t3 28
#define RISCV_REG_t4 29
#define RISCV_REG_t5 30
#define RISCV_REG_t6 31

//规定一个地址 0x80000010是用来保存要存放的32位数，用于WriteReg中，数据的缓冲站
extern unsigned int *regFileTemp = 0x80000010;

//这是用来赋值给寄存器的，这是一个危险动作，不是单独使用的
#define WriteReg_Part2(regNum) __asm__ __volatile__("li x" #regNum ",0x80000010\n\t" \
                                                    "lw x" #regNum ",0(x" #regNum ")\n\t")

#define WriteReg(regNum, data) \
    *regFileTemp = data;     \
    WriteReg_Part2(regNum)

#endif