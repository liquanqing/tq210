/*************************************************************************
	> File Name: ddr.c
	> Author: 
	> Mail: 
	> Created Time: 2017年01月08日 星期日 19时35分08秒
 ************************************************************************/
#include "common.h"

typedef struct {
    u32 CONCONTROL;
    u32 MEMCONTROL;
    u32 MEMCONFIG0;
    u32 MEMCONFIG1;
    u32 DIRECTCMD;
    u32 PRECHCONFIG;
    u32 PHYCONTROL0;
    u32 PHYCONTROL1;
    u32 RESERVED0;
    u32 RESERVED1;
    u32 PWRDNCONFIG;
    u32 RESERVED2;
    u32 TIMINGAREF;
    u32 TIMINGROW;
    u32 TIMINGDATA;
    u32 TIMINGPOWER;
    u32 PHYSTATUS;
    u32 RESERVED3;
    u32 CHIP0STATUS;
    u32 CHIP1STATUS;
    u32 AREFSTATUS;
    u32 MRSTATUS;
    u32 PHYTEST0;
    u32 PHYTEST1;
    u32 QOSCONTROL0;
    u32 QOSCONFIG0;
    u32 QOSCONTROL1;
    u32 QOSCONFIG1;
    u32 QOSCONTROL2;
    u32 QOSCONFIG2;
    u32 QOSCONTROL3;
    u32 QOSCONFIG3;
    u32 QOSCONTROL4;
    u32 QOSCONFIG4;
    u32 QOSCONTROL5;
    u32 QOSCONFIG5;
    u32 QOSCONTROL6;
    u32 QOSCONFIG6;
    u32 QOSCONTROL7;
    u32 QOSCONFIG7;
    u32 QOSCONTROL8;
    u32 QOSCONFIG8;
    u32 QOSCONTROL9;
    u32 QOSCONFIG9;
    u32 QOSCONTROL10;
    u32 QOSCONFIG10;
    u32 QOSCONTROL11;
    u32 QOSCONFIG11;
    u32 QOSCONTROL12;
    u32 QOSCONFIG12;
    u32 QOSCONTROL13;
    u32 QOSCONFIG13;
    u32 QOSCONTROL14;
    u32 QOSCONFIG14;
    u32 QOSCONTROL15;
    u32 QOSCONFIG15;
}DMC_TypeDef;

#define DMC0_BASE       ((u32)0xF0000000)
#define DMC1_BASE       ((u32)0xF1400000)

#define DMC0            ((DMC_TypeDef *)DMC0_BASE)
#define DMC1            ((DMC_TypeDef *)DMC1_BASE)

/*
 * ddr initialize
 * param void
 * return none
 */
void ddr_init(void)
{
    /* DMC0 */
	DMC0->PHYCONTROL0 = 0x00101000;
	DMC0->PHYCONTROL0 = 0x00101002;			/* DLL on */
	DMC0->PHYCONTROL1 = 0x00000086;
	DMC0->PHYCONTROL0 = 0x00101003;			/* DLL start */

	while ((DMC0->PHYSTATUS & 0x7) != 0x7);	/* wait DLL locked */

	DMC0->CONCONTROL = 0x0FFF2350;			/* Auto Refresh Counter should be off */
	DMC0->MEMCONTROL = 0x00202430;			/* Dynamic power down should be off */
	DMC0->MEMCONFIG0 = 0x20E01323;

	DMC0->PRECHCONFIG = 0xFF000000;
	DMC0->PWRDNCONFIG = 0xFFFF00FF;

	DMC0->TIMINGAREF = 0x00000618;			/* 7.8us * 200MHz = 1560 = 0x618  */
	DMC0->TIMINGROW = 0x19233309;
	DMC0->TIMINGDATA = 0x23240204;
	DMC0->TIMINGPOWER = 0x09C80232;

	DMC0->DIRECTCMD = 0x07000000;			/* NOP */
	DMC0->DIRECTCMD = 0x01000000;			/* PALL */
	DMC0->DIRECTCMD = 0x00020000;			/* EMRS2 */
	DMC0->DIRECTCMD = 0x00030000;			/* EMRS3 */
	DMC0->DIRECTCMD = 0x00010400;			/* EMRS enable DLL */
	DMC0->DIRECTCMD = 0x00000542;			/* DLL reset */
	DMC0->DIRECTCMD = 0x01000000; 			/* PALL */
	DMC0->DIRECTCMD = 0x05000000;			/* auto refresh */
	DMC0->DIRECTCMD = 0x05000000;			/* auto refresh */
	DMC0->DIRECTCMD = 0x00000442;			/* DLL unreset */
	DMC0->DIRECTCMD = 0x00010780;			/* OCD default */
	DMC0->DIRECTCMD = 0x00010400;			/* OCD exit */

	DMC0->CONCONTROL = 0x0FF02030;			/* auto refresh on */
	DMC0->PWRDNCONFIG = 0xFFFF00FF;
	DMC0->MEMCONTROL = 0x00202400;

	/* D->C1 */
	DMC1->PHYCONTROL0 = 0x00101000;
	DMC1->PHYCONTROL0 = 0x00101002;
	DMC1->PHYCONTROL1 = 0x86;
	DMC1->PHYCONTROL0 = 0x00101003;

	while((DMC0->PHYSTATUS&0x7) != 0x7);

	DMC1->CONCONTROL = 0x0FFF2350;			/* Auto Refresh Counter should be off */
	DMC1->MEMCONTROL = 0x00202430;			/* Dynamic power down should be off */
	DMC1->MEMCONFIG0 = 0x40E01323;

	DMC1->PRECHCONFIG = 0xFF000000;
	DMC1->PWRDNCONFIG = 0xFFFF00FF;

	DMC1->TIMINGAREF = 0x00000618;			/* 7.8us * 200MHz = 1560 = 0x618  */
	DMC1->TIMINGROW = 0x19233309;
	DMC1->TIMINGDATA = 0x23240204;
	DMC1->TIMINGPOWER = 0x09C80232;

	DMC1->DIRECTCMD = 0x07000000;
	DMC1->DIRECTCMD = 0x01000000;
	DMC1->DIRECTCMD = 0x00020000;
	DMC1->DIRECTCMD = 0x00030000;
	DMC1->DIRECTCMD = 0x00010400;
	DMC1->DIRECTCMD = 0x00000542;
	DMC1->DIRECTCMD = 0x01000000;
	DMC1->DIRECTCMD = 0x05000000;
	DMC1->DIRECTCMD = 0x05000000;
	DMC1->DIRECTCMD = 0x00000442;
	DMC1->DIRECTCMD = 0x00010780;
	DMC1->DIRECTCMD = 0x00010400;

	DMC1->CONCONTROL = 0x0FF02030;
	DMC1->PWRDNCONFIG = 0xFFFF00FF;
	DMC1->MEMCONTROL = 0x00202400;    
}
