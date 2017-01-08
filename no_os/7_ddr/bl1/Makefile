OBJ = bl1
LDFLAGS = -lgcc -L/opt/EmbedSky/4.4.6/lib/gcc/arm-embedsky-linux-gnueabi/4.4.6/
$(OBJ).bin: start.o clock.o uart.o ddr.o copy.o main.o
	arm-linux-ld -Ttext 0xD0020010 -o $(OBJ).elf $^ $(LDFLAGS)
	arm-linux-objcopy -O binary $(OBJ).elf $@
	arm-linux-objdump -D $(OBJ).elf > $(OBJ).dis

%.o : %.c
	arm-linux-gcc -c $< -o $@ -fno-builtin

%.o : %.S
	arm-linux-gcc -c $< -o $@

.PHONY:clean

clean:
	rm -rf *.o *.dis *.elf *.bin
