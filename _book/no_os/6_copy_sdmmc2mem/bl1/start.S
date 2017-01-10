/* start.S for usar */
.global _start
_start:
    bl clock_init
    bl uart_init   
    bl main
    ldr pc, =0xD0022800

halt:
    b halt
