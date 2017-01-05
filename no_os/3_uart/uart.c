/*************************************************************************
	> File Name: uart.c
	> Author: 
	> Mail: 
	> Created Time: 2017年01月05日 星期四 11时23分16秒
 ************************************************************************/

/*
 * register map
 */
#define ULCON0          *((volatile unsigned int *)0xE2900000) /* uart ch0 line control */
#define UCON0           *((volatile unsigned int *)0xE2900004) /* uart ch0 control */
#define UFCON0          *((volatile unsigned int *)0xE2900008) /* uart ch0 fifo control */
#define UMCON0          *((volatile unsigned int *)0xE290000C) /* uart ch0 modem control */
#define UTRSTAT0        *((volatile unsigned int *)0xE2900010) /* uart ch0 Tx/Rx status */
#define UERSTAT0        *((volatile unsigned int *)0xE2900014) /* uart ch0 Rx Err status */
#define UFSTAT0         *((volatile unsigned int *)0xE2900018) /* uart ch0 fifo status */
#define UMSTAT0         *((volatile unsigned int *)0xE290001C) /* uart ch0 modem status */
#define UTXH0           *((volatile unsigned int *)0xE2900020) /* uart ch0 transmit buffer */
#define URXH0           *((volatile unsigned int *)0xE2900024) /* uart ch0 receive buffer */
#define UBRDIV0         *((volatile unsigned int *)0xE2900028) /* uart ch0 baud rate div */
#define UDIVSLOT0       *((volatile unsigned int *)0xE290002C) /* uart ch0 div slot */
#define UINTP0          *((volatile unsigned int *)0xE2900030) /* uart ch0 int pend */
#define UINTSP0         *((volatile unsigned int *)0xE2900034) /* uart ch0 int source pend */
#define UINTM0          *((volatile unsigned int *)0xE2900038) /* uart ch0 int mask */

#define GPA0CON         *((volatile unsigned int *)0xE0200000) /* GPA0 control */


/*
 * !brief initialize uart work in 115200bps
 * !param none
 * !return none
 */
void uart_init(void)
{
    /*
     * config port GPA0_0 and GPA0_1 in uart modem
     * GPA00 uart rxd
     * GPA01 uart Txd
     */
    GPA0CON &= ~0xFF;
    GPA0CON |= 0x22;

    /*
     * 8-bit data
     * 1 stop bit per frame
     * no parity
     * normal mode operation
     */
    ULCON0 |= (0 << 6) | (0 << 3) | (0 << 2) | (0x03 << 0);

    /*
     * interrupt request or polling modem
     * Select PCLK cloc for baud rate
     */
    UCON0 |= (1 << 0) | (1 << 2); 

    /*
     * disable fifo
     */
    UFCON0 = 0;

    /*
     * baud rate calculate
     * clock = pclk = 66Mhz
     * DIV_VAL1) = (PCLK / (bps x 16)) - 1 = 34.8
     */
    UBRDIV0 = 34;

    /*
     * using UDIVSLOT0 to generate the baud rate more accurately
     * slot = 0.8 ,find map is (num of 1's in UDIVSLOTn)/16 = 0.8,so num of 1's in UDIVSLOT0 is 12
     * 12 in UDIVSLOTn is 0xDDDD
     */
    UDIVSLOT0 = 0xDDDD;
}

/*
 * uart send a byte
 * param byte
 * return none
 */
static void uart_send_byte(unsigned char byte)
{
    while(!(UTRSTAT0 & (1 << 1)));  //wait transmit buffer empty
    UTXH0 = byte;
}

/*
 * uart get a byte
 * param none
 * return byte
 */
static unsigned char uart_recv_byte(void)
{
    while(!(UTRSTAT0 & (1 << 0)));  //wait buffer has a received data
    return URXH0;
}

/*
 * putchar
 * param char
 * return none
 */
void putchar(char c)
{
    uart_send_byte(c);
}

/*
 * getchar
 * param none
 * return char
 */
char getchar(void)
{
    return uart_recv_byte();
}

/*
 * putstr
 * param char *pstr
 * return none
 */
void puts(char *pstr)
{
    while(*pstr) {
        putchar(*pstr++);
    }
}
