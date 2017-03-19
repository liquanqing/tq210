/*
 * Copyright (C) 2009 Samsung Electronics
 * Kyungmin Park <kyungmin.park@samsung.com>
 * Minkyu Kang <mk7.kang@samsung.com>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#include <config.h>
#include <asm/arch/cpu.h>
#include <asm/arch/power.h>

/*
 * Register usages:
 *
 * r5 has zero always
 */

	.globl lowlevel_init
lowlevel_init:
	mov	r9, lr

#ifdef CONFIG_SPL_BUILD
    bl clock_init
    bl beep_asm_init
    bl delay
    bl beep_asm_off
    bl ddr_init
#endif
1:
	mov	pc, r9

/*
     * beep_asm_init: 初始化蜂鸣器，并让其发声 
     */
    beep_asm_init: 
        ldr r0, = 0xE02000A0
        ldr r1, = 0x00000010
        str r1, [r0]

        ldr r0, = 0xE02000A4
            ldr r1, = 0x2
        str r1, [r0]

        mov pc, lr

    /*
     * delay: 延时
     */   
    delay:
        mov r0, #0x2000000

    delay_loop:
        sub r0, r0, #1
        cmp r0, #0
        bne delay_loop

        mov pc, lr

    /*
     * beep_asm_off: 关闭蜂鸣器
     */
    beep_asm_off:
        ldr r0, = 0xE02000A4
        ldr r1, = 0x0
        str r1, [r0]

        mov pc, lr
