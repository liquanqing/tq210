/*************************************************************************
	> File Name: lcd.c
	> Author: 
	> Mail: 
	> Created Time: 2017年01月12日 星期四 11时25分51秒
 ************************************************************************/

#include "common.h"

#define ABS(A)      ((A > 0) ? A : (-A))
#define MAX(A,B)    ((A >= B) ? A : B)
#define MIN(A,B)    ((A <= B) ? A : B)

#define GPD0CON             *((volatile int *)0xE02000A0)
#define GPD0DAT             *((volatile int *)0xE02000A4)

#define GPF0CON             *((volatile int *)0xE0200120)
#define GPF1CON             *((volatile int *)0xE0200140)
#define GPF2CON             *((volatile int *)0xE0200160)
#define GPF3CON             *((volatile int *)0xE0200180)

#define DISPLAY_CONTROL     *((volatile int *)0xE0107008)

#define VIDCON0             *((volatile int *)0xF8000000)
#define VIDCON1             *((volatile int *)0xF8000004)
#define VIDCON2             *((volatile int *)0xF8000008)
#define VIDCON3             *((volatile int *)0xF800000C)
#define VIDTCON0           *((volatile int *)0xF8000010)
#define VIDTCON1           *((volatile int *)0xF8000014)
#define VIDTCON2           *((volatile int *)0xF8000018)
#define VIDTCON3           *((volatile int *)0xF800001C)
#define WINCON0             *((volatile int *)0xF8000020)
#define WINCON1             *((volatile int *)0xF8000024)
#define WINCON2             *((volatile int *)0xF8000028)
#define WINCON3             *((volatile int *)0xF800002C)
#define WINCON4             *((volatile int *)0xF8000030)
#define SHADOWCON           *((volatile int *)0xF8000034)
#define VIDOSD0A            *((volatile int *)0xF8000040)
#define VIDOSD0B            *((volatile int *)0xF8000044)
#define VIDOSD0C            *((volatile int *)0xF8000048)
#define VIDOSD1A            *((volatile int *)0xF8000050)
#define VIDOSD1B            *((volatile int *)0xF8000054)
#define VIDOSD1C            *((volatile int *)0xF8000058)
#define VIDOSD1D            *((volatile int *)0xF800005C)
#define VIDOSD2A            *((volatile int *)0xF8000060)
#define VIDOSD2B            *((volatile int *)0xF8000064)
#define VIDOSD2C            *((volatile int *)0xF8000068)
#define VIDOSD2D            *((volatile int *)0xF800006C)
#define VIDOSD3A            *((volatile int *)0xF8000070)
#define VIDOSD3B            *((volatile int *)0xF8000074)
#define VIDOSD3C            *((volatile int *)0xF8000078)
#define VIDOSD4A            *((volatile int *)0xF8000080)
#define VIDOSD4B            *((volatile int *)0xF8000084)
#define VIDOSD4C            *((volatile int *)0xF8000088)
#define VIDW00ADD0B0        *((volatile int *)0xF80000A0)
#define VIDW00ADD0B1        *((volatile int *)0xF80000A4)
#define VIDW00ADD0B2        *((volatile int *)0xF80020A0)
#define VIDW01ADD0B0        *((volatile int *)0xF80000A8)
#define VIDW01ADD0B1        *((volatile int *)0xF80000AC)
#define VIDW01ADD0B2        *((volatile int *)0xF80020A8)
#define VIDW02ADD0B0        *((volatile int *)0xF80000B0)
#define VIDW02ADD0B1        *((volatile int *)0xF80000B4)
#define VIDW02ADD0B2        *((volatile int *)0xF80020B0)
#define VIDW03ADD0B0        *((volatile int *)0xF80000B8)
#define VIDW03ADD0B1        *((volatile int *)0xF80000BC)
#define VIDW03ADD0B2        *((volatile int *)0xF80020B8)
#define VIDW04ADD0B0        *((volatile int *)0xF80000C0)
#define VIDW04ADD0B1        *((volatile int *)0xF80000C4)
#define VIDW04ADD0B2        *((volatile int *)0xF80020C0)
#define VIDW00ADD1B0        *((volatile int *)0xF80000D0)
#define VIDW00ADD1B1        *((volatile int *)0xF80000D4)
#define VIDW00ADD1B2        *((volatile int *)0xF80020D0)
#define VIDW01ADD1B0        *((volatile int *)0xF80000D8)
#define VIDW01ADD1B1        *((volatile int *)0xF80000DC)
#define VIDW01ADD1B2        *((volatile int *)0xF80020D8)


/*
 * lcd message
 */
#define VBPD            23
#define VFPD            22
#define VSPW            2
#define HEIGHT          480

#define HBPD            46
#define HFPD            210
#define HSPW            2
#define WIDTH           800

#define BPP             24

#define FRAME_BUFF_ADDR 0x28000000


/*
 * !brief lcd init
 * !param none
 * !return none
 */
void lcd_init(void)
{
    /* gpio configuration */
    GPD0CON = (GPD0CON & ~0x0F) | (0x01 << 0); //back light
    GPF0CON = 0x22222222;
    GPF1CON = 0x22222222;
    GPF2CON = 0x22222222;
    GPF3CON = (GPF3CON & 0xFFFF0000) | 0x00002222;

    DISPLAY_CONTROL = 2;

    VIDCON0 = (5 << 6) |
              (1 << 4) |
              (0 << 2);

    VIDCON1 = (0 << 7) |
              (1 << 6) |
              (1 << 5) |
              (0 << 4);

    VIDCON2 = (0 << 16) |
              (0 << 19);

    VIDTCON0 = (VBPD << 16) |
                (VFPD << 8) |
                (VSPW << 0);

    VIDTCON1 = (HBPD << 16) |
                (HFPD << 8) |
                (HSPW << 0);
    VIDTCON2 = ((HEIGHT - 1) << 11) |
                ((WIDTH -1) << 0);
    VIDTCON3 = (1 << 31);

    WINCON0 = (1 << 15) |
                (0x0B << 2);

    VIDOSD0A = (0 << 11) | 0;

    VIDOSD0B = ((WIDTH - 1) << 11) |
                ((HEIGHT - 1) << 0);

    VIDOSD0C = HEIGHT * WIDTH;

    VIDW00ADD0B0 = FRAME_BUFF_ADDR;
    VIDW00ADD1B0 = FRAME_BUFF_ADDR + (WIDTH * HEIGHT * 4);

    SHADOWCON = 0x01;
}

/*
 * lcd enable
 * on off
 */
void lcd_enable(int is_on)
{
    if (is_on) {
        VIDCON0 |= 0x3;
        WINCON0 |= 0x1;
    } else {
        WINCON0 &= ~1;
        if (VIDCON0 & (1 << 1)) {
            VIDCON0 &= ~1;
        }
    }
}

/*
 * lcd back light control
 * on off
 * return none
 */
void lcd_backlight_ctrl(int is_on)
{
    if (is_on) {
        GPD0DAT |= 0x01;
    } else {
        GPD0DAT &= ~0x01;
    }
}

/*
 * draw pixel
 * position of x and y
 * color
 * return none
 */
void draw_pix(int x, int y, u32 color)
{
    u32 *p = (u32 *)FRAME_BUFF_ADDR;
    *(p + y * (WIDTH) + x) = color;
}

/*
 * clear_lcd
 * param none
 * return none
 */
void clear_lcd(void)
{
    int x, y;

    for (y = 0; y < HEIGHT; y++) {
        for (x = 0; x < WIDTH; x++) {
            draw_pix(x, y, 0);
        }
    }
}


void draw_line(int x0, int y0, int x1, int y1, u32 color)
{
    int t, distance;
    int x_err = 0, y_err = 0;
    int x_inc, y_inc;
    int row = x0, column = y0;
    int x_delta = x1 - x0;
    int y_delta = y1 - y0;

    if ((x0 == x1) && (y0 == y1)) {
        draw_pix(x0, y0, color);
    } else if (x0 == x1) {
        if (y0 > y1) {
            for (t = y0; t >= y1; t++) {
                draw_pix(x0, t, color);
            }
        } else {
            for (t = y0; t <= y1; t++) {
                draw_pix(x0, t, color);
            }
        }
    } else if (y0 == y1) {
        if (x0 > x1) {
            for (t = x0; t >= x1; t++) {
                draw_pix(t, y0, color);
            }
        } else {
            for (t = x0; t <= x1; t++) {
                draw_pix(t, y0, color);
            }
        }
    } else {
        if (x_delta > 0) {
            x_inc = 1;
        } else if (x_delta == 0) {
            x_inc = 0;
        } else {
            x_inc = -1;
            x_delta = -x_delta;
        }

        if (y_delta > 0) {
            y_inc = 1;
        } else if (y_delta == 0) {
            y_inc = 0;
        } else {
            y_inc = -1;
            y_delta = -y_delta;
        }

        distance = MAX(x_delta, y_delta);

        for (t = 0; t <= distance; t++) {
            draw_pix(row, column, color);

            x_err += x_delta + 1;
            y_err += y_delta + 1;

            if (x_err > distance) {
                x_err -= distance;
                row += x_inc;
            }

            if (y_err > distance) {
                y_err -= distance;
                column += y_inc;
            }
        }

    }
}

/*
 * draw rect
 * param position x0,y0
 * param width HEIGHT
 * param color
 * return none
 */
void draw_rect(int x0, int y0, int width, int height, u32 color)
{
    int x1 = x0 + width;
    int y1 = y0 + height;
    draw_line(x0, y0, x0, y1, color);
    draw_line(x1, y0, x1, y1, color);
    draw_line(x0, y0, x1, y0, color);
    draw_line(x0, y1, x1, y1, color);
}

/*
 * draw circle
 * param position
 * param rad
 * param color
 */
void draw_circle(int x0, int y0, int r, u32 color)
{
    int x = 0, y = r;
    int delta = 1 - r;

    while (y >= x) {
        draw_pix(x + x0, y + y0, color);
        draw_pix(y + x0, x + y0, color);
        draw_pix(-x + x0, y + y0, color);
        draw_pix(-y + x0, x + y0, color);

        draw_pix(-x + x0, -y + y0, color);
        draw_pix(-y + x0, -x + y0, color);
        draw_pix(x + x0, -y + y0, color);
        draw_pix(y + x0, -x + y0, color);

        if (delta < 0) {
            delta = delta + 4 * x + 6;
        } else {
            delta = delta + 4 * (x - y) + 10;
            y --;
        }

        x ++;
    }
}

/*
 * draw round rect 
 * param position
 * param width height
 * param rad
 * param color
 */
void draw_round_rect(int x0, int y0, int width, int height, int rad, u32 color)
{
    int x = 0, y = rad;
    int delta = 1 - rad;

    draw_line(x0 + rad, y0, x0 + width - rad, y0, color);
    draw_line(x0 + rad, y0 + height, x0 + width - rad, y0 + height, color);

    draw_line(x0, y0 + rad, x0, y0 + height - rad, color);
    draw_line(x0 + width, y0 + rad, x0 + width, y0 + height - rad, color);

    while (y >= x) {
        draw_pix(x + x0 + width - rad, y + y0 + height - rad, color);
        draw_pix(y + x0 + width - rad, x + y0 + height - rad, color);

        draw_pix(-x + x0 + rad, y + y0 + height - rad, color);
        draw_pix(-y + x0 + rad, x + y0 + height - rad, color);

        draw_pix(-x + x0 + rad, -y + y0 + rad, color);
        draw_pix(-y + x0 + rad, -x + y0 + rad, color);

        draw_pix(x + x0 + width - rad, -y + y0 + rad, color);
        draw_pix(y + x0 + width - rad, -x + y0 + rad, color);

        if (delta < 0) {
            delta = delta + 4 * x + 6;
        } else {
            delta = delta + 4 * (x - y) + 10;
            y --;
        }

        x ++;
    }
}
