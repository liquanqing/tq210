LDFLAGS = -lgcc -L/opt/EmbedSky/4.4.6/lib/gcc/arm-embedsky-linux-gnueabi/4.4.6/
clock.bin: start.o clock.o uart.o main.o
	arm-linux-ld -Ttext 0xD0020010 -o clock.elf $^ $(LDFLAGS)
	arm-linux-objcopy -O binary clock.elf $@
	arm-linux-objdump -D clock.elf > clock.dis

%.o : %.c
	arm-linux-gcc -c $< -o $@ -fno-builtin

%.o : %.S
	arm-linux-gcc -c $< -o $@

.PHONY:clean

clean:
	rm -rf *.o *.dis *.elf *.bin
