# default make target
all: os-image

os-image: boot_sector.bin kernel.bin
	cat $^ > os-image

# $^ is subsitituted with with all of the target's dependency files
# build the kernel binary
kernel.bin: kernel_entry.o kernel.o
	ld -o kernel.bin -Ttext 0x1000 $^ --oformat binary

# Build the kernel object file
# $< is the first dependency and $@ is the target file
kernel.o : kernel.c
	gcc -ffreestanding -c $< -o $@

# Build the kernel entry object file
# same as the above rule
kernel_entry.o : kernel_entry.asm
	nasm $< -f elf64 -o $@

clean:
	rm *.bin *.o

# disassemble our kernel - might be useful for debugging
kernel.dis : kernel.bin
	ndisasm -b 32 $< > $@
