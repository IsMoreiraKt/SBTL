all: run                                                             

kernel.bin: src/kernel-entry.o src/kernel.o
	ld -m elf_i386 -o $@ -Ttext 0x1000 -e _start $^ --oformat binary

src/kernel-entry.o: src/kernel-entry.asm
	nasm $< -f elf -o $@

src/kernel.o: src/kernel.c
	gcc -m32 -ffreestanding -fno-pie -c $< -o $@

mbr.bin: src/master-boot-record.asm
	nasm -I src/ $< -f bin -o $@

os-image.bin: mbr.bin kernel.bin
	cat $^ > $@

run: os-image.bin
	qemu-system-i386 -drive format=raw,file=$<

clean:
	$(RM) *.bin *.o *.dis