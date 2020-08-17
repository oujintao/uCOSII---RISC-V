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

void writeRegfile(int regNum,unsigned int data)
{
    switch(regNum)
    {
    case 0:
        return;
    case 1:
        __asm__ __volatile__("add x1,a1,x0\n\t");
        return;
    case 2:
        __asm__ __volatile__("add x2,a1,x0\n\t");
        return;
    case 3:
        __asm__ __volatile__("add x3,a1,x0\n\t");
        return;
    case 4:
        __asm__ __volatile__("add x4,a1,x0\n\t");
        return;
    case 5:
        __asm__ __volatile__("add x5,a1,x0\n\t");
        return;
    case 6:
        __asm__ __volatile__("add x6,a1,x0\n\t");
        return;
    case 7:
        __asm__ __volatile__("add x7,a1,x0\n\t");
        return;
    case 8:
        __asm__ __volatile__("add x8,a1,x0\n\t");
        return;
    case 9:
        __asm__ __volatile__("add x9,a1,x0\n\t");
        return;
    case 10:
        __asm__ __volatile__("add x10,a1,x0\n\t");
        return;
    case 11:
        __asm__ __volatile__("add x11,a1,x0\n\t");
        return;
    case 12:
        __asm__ __volatile__("add x12,a1,x0\n\t");
        return;
    case 13:
        __asm__ __volatile__("add x13,a1,x0\n\t");
        return;
    case 14:
        __asm__ __volatile__("add x14,a1,x0\n\t");
        return;
    case 15:
        __asm__ __volatile__("add x15,a1,x0\n\t");
        return;
    case 16:
        __asm__ __volatile__("add x16,a1,x0\n\t");
        return;
    case 17:
        __asm__ __volatile__("add x17,a1,x0\n\t");
        return;
    case 18:
        __asm__ __volatile__("add x18,a1,x0\n\t");
        return;
    case 19:
        __asm__ __volatile__("add x19,a1,x0\n\t");
        return;
    case 20:
        __asm__ __volatile__("add x20,a1,x0\n\t");
        return;
    case 21:
        __asm__ __volatile__("add x21,a1,x0\n\t");
        return;
    case 22:
        __asm__ __volatile__("add x22,a1,x0\n\t");
        return;
    case 23:
        __asm__ __volatile__("add x23,a1,x0\n\t");
        return;
    case 24:
        __asm__ __volatile__("add x24,a1,x0\n\t");
        return;
    case 25:
        __asm__ __volatile__("add x25,a1,x0\n\t");
        return;
    case 26:
        __asm__ __volatile__("add x26,a1,x0\n\t");
        return;
    case 27:
        __asm__ __volatile__("add x27,a1,x0\n\t");
        return;
    case 28:
        __asm__ __volatile__("add x28,a1,x0\n\t");
        return;
    case 29:
        __asm__ __volatile__("add x29,a1,x0\n\t");
        return;
    case 30:
        __asm__ __volatile__("add x30,a1,x0\n\t");
        return;
    case 31:
        __asm__ __volatile__("add x31,a1,x0\n\t");
        return;
    default:
        return;
    }
}

extern unsigned int regFileTemp;
#define WriteTest(regNum) __asm__ __volatile__(".weak regFileTemp\n\t" \
                                         "addi sp,sp,-4\n\t"     \
                                         "sw t0,0(sp)\n\t"       \
                                         "la t0,regFileTemp\n\t" \
                                         "lw x"#regNum",0(t0)\n\t"       \
                                         "lw t0,0(sp)\n\t"       \
                                         "addi sp,sp,4\n\t");
