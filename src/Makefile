CC =gcc

default:
	make run
obj:mm.c mm.h 
	$(CC) -m32 -fno-stack-protector -fno-asynchronous-unwind-tables -s  -c  -o mm.o mm.c
	$(CC) -DDRAW_DESKTOP -m32 -fno-stack-protector -fno-asynchronous-unwind-tables -s  -c write_vga.c -o write_vga.o
ld:obj mm.o write_vga.o
	ld -m elf_i386 -r mm.o write_vga.o  -o cmain.o
tool:imgTool Makefile
	gcc imgTool.c -o imgTool
objconvAsm:ld cmain.o
	objconv -fnasm cmain.o
	python delUnusedSymbol.py 
asm:objconvAsm _cmain.asm greenos.asm kernel.asm  Makefile
	nasm greenos.asm -o boot 
	nasm kernel.asm -o kernel
img:asm boot kernel imgTool  Makefile
	dd if=/dev/zero of=zImg bs=512 count=2880
	./imgTool boot zImg 0 0 1
	./imgTool kernel zImg 1 0 1
run:img zImg
	#qemu-system-i386 -drive file=zImg,format=raw,index=0,media=disk
	qemu-system-i386  -m 512M -drive file=zImg,format=raw,index=0,if=floppy	
clean:
	rm -f boot kernel imgTool zImg  *.o *cmain.asm 
	
