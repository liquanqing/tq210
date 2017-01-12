/* start.S for usar */
.global _start
_start:
    bl clock_init
    bl uart_init   
    bl ddr_init
    bl main
    ldr sp, =0x60000000
    ldr pc, =0x20000000

halt:
    b halt
