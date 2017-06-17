CC =gcc
CFLAGS =-m32 -fno-stack-protector -fno-asynchronous-unwind-tables -s  -I include
OBJS =write_vga.o fifo.o sheet.o timer.o memory.o delay.o graphic.o vsprintf.o keyboard.o 
default:
	make run
%.o:*/%.c
	$(CC) $(CFLAGS) -c $< -o $@

ld:$(OBJS)
	ld -m elf_i386 -r $(OBJS)  -o cmain.o
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
	qemu-system-i386 -vga std -display sdl  -m 512M -drive file=zImg,format=raw,index=0,if=floppy	
clean:
	rm -f boot kernel imgTool zImg  *.o *cmain.asm 
	
