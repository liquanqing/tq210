/*************************************************************************
	> File Name: uart.h
	> Author: 
	> Mail: 
	> Created Time: 2017年01月05日 星期四 23时21分26秒
 ************************************************************************/

#ifndef _UART_H
#define _UART_H

void uart_init(void);
void putchar(int c);
int getchar(void);
void puts(char *s);
int printf(const char *fmt, ...);

#endif
