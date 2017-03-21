/*
 * Copyright (C) 2009 Samsung Electronics
 * Kyungmin Park <kyungmin.park@samsung.com>
 * Minkyu Kang <mk7.kang@samsung.com>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

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
    bl ddr_init

    ldr r0, =0xE0200000 /* GPA0_CON */
    ldr r1, =0x22222222
    str r1, [r0]

#endif
1:
	mov	pc, r9
