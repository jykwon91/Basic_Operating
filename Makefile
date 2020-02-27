# Automatically generate lists of sources using wildcards
C_SOURCES = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)

#TODO : make sources dep on all header files

# convert the *.c filenames to *.o to give a list of object files to build
OBJ = ${C_SOURCES: .c = .o}

# Default build target
all: os-image

# this is the actual disk image that the computer loads
# which is the combination of our compiled bootsector and kernel
os-image: boot/boot_sector.bin kernel.bin
	cat $^ > os-image

#this builds the binary of our kernel from two object files:
#	- the kernel_entry, which jumps to main() in our kernel
#	- the compiled c kernel
kernel.bin: kernel/kernel_entry.o ${OBJ}
	ld -o $@ -Ttext 0x1000 $^ --oformat binary

# generic rule for compiling c code to an object file
# for simplicity, c files depend on all header files
%.o : %.c ${HEADERS}
	gcc -ffreestanding -c $< -o $@

# assemble the kernel_entry
%.o : %.asm
	nasm $< -f elf64 -o $@

%.bin : %.asm
	nasm $< -f bin -I '../../16bit/' -o $@

clean:
	rm -fr *.bin *.dis *.o os-image
	rm -fr kernel/*.o boot/*.bin drivers/*.o
