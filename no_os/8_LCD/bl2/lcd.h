/*************************************************************************
	> File Name: lcd.h
	> Author: 
	> Mail: 
	> Created Time: 2017年01月12日 星期四 17时12分37秒
 ************************************************************************/

#ifndef _LCD_H
#define _LCD_H

#include "common.h"

void lcd_init(void);
void lcd_backlight_ctrl(int is_on);
void lcd_enable(int is_on);
void draw_pix(int x0, int y0, u32 color);
void draw_line(int x0, int y0, int x1, int y1, u32 color);
void clear_lcd(void);

#endif
