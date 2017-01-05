/* led_on.S */
.global _start
_start:
    ldr r0, =0xE0200060 /* GPC0CON */
    ldr r1, =0x00001000 /* GPC0CON[3] = 0001 for output */
    str r1, [r0]

    ldr r0, =0xE0200064 /* GPC0DAT */
    ldr r1, =0x00000008 /* GPC03 set high */
    str r1, [r0]
    
halt:
    b halt          /*loop*/
