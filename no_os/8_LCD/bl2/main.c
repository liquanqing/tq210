/*************************************************************************
	> File Name: main.c
	> Author: 
	> Mail: 
	> Created Time: 2017年01月04日 星期三 15时17分26秒
 ************************************************************************/
#include "common.h"
#include "clock.h"
#include "uart.h"
#include "lcd.h"

#define GPC0CON     *((volatile unsigned int *)0xE0200060)
#define GPC0DAT     *((volatile unsigned int *)0xE0200064)

void delay(u32 i)
{
    volatile unsigned int t = 0xFFFF;
    while(i--) { for(; t > 0; t--);
    }
}


int main(void)
{
    int toggle = 0;
    GPC0CON &= ~(0xFF << 12);
    GPC0CON |= (0x11 << 12);
    GPC0DAT &= ~(0x3 << 3);


    puts("\n#####   Running in BL2    #####");
    puts("\n####    Running at DDR    #####");
    print_clockinfo();    

    lcd_init();
    lcd_enable(1);
    lcd_backlight_ctrl(1);
    draw_line(100, 100, 200, 200, 0xFF0000);

    while(1) {
        if (toggle) {
            toggle = 0;
            GPC0DAT |= 1 << 3;
            GPC0DAT &= ~(1<<4);
        } else {
            toggle = 1;
            GPC0DAT |= 1 << 4;
            GPC0DAT &= ~(1<<3);
        }

        delay(0xFFFF);
    }
    return 0;
}
