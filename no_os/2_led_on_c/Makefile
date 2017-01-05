led_on_c.bin : start.o main.o
	arm-linux-ld -Ttext 0xD0020010 -o led_on_c.elf $^
	arm-linux-objcopy -O binary led_on_c.elf $@
	arm-linux-objdump -D led_on_c.elf > led_on_c.dis

start.o : start.S
	arm-linux-gcc -c $< -o $@

main.o : main.c
	arm-linux-gcc -c $< -o $@

.PHONY: clean

clean :
	rm -rf *.o *.dis *.bin *.elf
