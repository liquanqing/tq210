/* start.S for usar */
.global _start
_start:
    //bl uart_init   
    bl main

halt:
    b halt
