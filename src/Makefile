CC =gcc
CFLAGS =-m32 -fno-stack-protector -fno-asynchronous-unwind-tables -s  -c -I include
default:
	make run
obj:memory.c write_vga.c sheet.c lib/delay.c graphic.c vsprintf.c
	$(CC) $(CFLAGS)  -o memory.o memory.c 
	$(CC) $(CFLAGS)  sheet.c -o sheet.o
	$(CC) $(CFLAGS)  fifo.c -o fifo.o
	$(CC) $(CFLAGS)  graphic.c -o graphic.o
	$(CC) $(CFLAGS)  vsprintf.c -o vsprintf.o
	$(CC) $(CFLAGS)  lib/delay.c -o delay.o
	$(CC) $(CFLAGS) -DDRAW_DESKTOP  write_vga.c -o write_vga.o
ld:obj memory.o write_vga.o sheet.o
	ld -m elf_i386 -r  write_vga.o fifo.o sheet.o  memory.o delay.o graphic.o vsprintf.o  -o cmain.o
tool:imgTool.c
	$(CC) imgTool.c -o imgTool
objconvAsm:ld cmain.o
	objconv -fnasm cmain.o
	python delUnusedSymbol.py 
asm:objconvAsm _cmain.asm greenos.asm kernel.asm  Makefile
	nasm greenos.asm -o boot 
	nasm kernel.asm -o kernel
img:asm boot kernel tool  Makefile
	dd if=/dev/zero of=zImg bs=512 count=2880
	./imgTool boot zImg 0 0 1
	./imgTool kernel zImg 1 0 1
run:img zImg
	qemu-system-i386  -m 512M -drive file=zImg,format=raw,index=0,if=floppy	
clean:
	rm -f boot kernel imgTool zImg  *.o *cmain.asm 
	
