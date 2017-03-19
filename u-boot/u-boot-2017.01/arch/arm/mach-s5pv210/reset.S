/*
 * Copyright (c) 2009 Samsung Electronics.
 * Minkyu Kang <mk7.kang@samsung.com>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#include <asm/arch/cpu.h>
#include <linux/linkage.h>

#define S5PC100_SWRESET			0xE0200000
#define S5PC110_SWRESET			0xE0102000

ENTRY(reset_cpu)
	ldr	r1, =S5PC110_SWRESET
	mov	r2, #1
	str	r2, [r1]
_loop_forever:
	b	_loop_forever
ENDPROC(reset_cpu)
