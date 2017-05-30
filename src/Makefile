default:
	make run
tool:imgTool Makefile
	gcc imgTool.c -o imgTool
objconvAsm:write_vga.c
	gcc -DDRAW_DESKTOP -m32 -fno-stack-protector -fno-asynchronous-unwind-tables -s  -c write_vga.c -o write_vga.o
	objconv -fnasm write_vga.o
	python delUnusedSymbol.py 
asm:objconvAsm _write_vga.asm greenos.asm kernel.asm  Makefile
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
	rm -f boot kernel imgTool zImg  *.o write_vga.asm _write_vga.asm
	
