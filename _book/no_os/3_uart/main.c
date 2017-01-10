/*************************************************************************
	> File Name: main.c
	> Author: 
	> Mail: 
	> Created Time: 2017年01月05日 星期四 13时49分42秒
 ************************************************************************/
#define GPC0CON     *((volatile unsigned int *)0xE0200060)
#define GPC0DAT     *((volatile unsigned int *)0xE0200064)


int main(void)
{
    char c;

    GPC0CON &= ~(0xFF << 12);
    GPC0CON |= 0x11 << 12;
    GPC0DAT &= ~(0x03 << 12);

    puts("test UART in TQ210\r\n");
    puts("1.LED1 Toogle\r\n");
    puts("2.LED2 Toogle\r\n");
    puts("Please select 1 or 2 to toogle the led\r\n");

    while(1) {
        c = getchar();
        putchar(c);
        putchar('\r');
        putchar('\n');

        if ('1' == c) {
            GPC0DAT ^= 1 << 3;
        } else if ('2' == c) {
            GPC0DAT ^= 1 << 4;
        }
    }
    return 0;
}
