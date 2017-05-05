
default:
	make asm
tool:imgTool Makefile
	gcc imgTool.c -o imgTool
drawRect:
	gcc -DDRAW_RECT -m32 -fno-asynchronous-unwind-tables -s  -c write_vga.c -o write_vga.o
	make objconvAsm
drawStripe:
	gcc -DDRAW_STRIPE -m32 -fno-asynchronous-unwind-tables -s  -c write_vga.c -o write_vga.o
	make objconvAsm
drawDesktop:
	gcc -DDRAW_DESKTOP -m32 -fno-asynchronous-unwind-tables -s  -c write_vga.c -o write_vga.o
	make objconvAsm
objconvAsm:write_vga.c
	objconv -fnasm write_vga.o
	python delUnusedSymbol.py 
asm:_write_vga.asm greenos.asm kernel.asm  Makefile
	nasm greenos.asm -o boot 
	nasm kernel.asm -o kernel
img:asm boot kernel imgTool  Makefile
	dd if=/dev/zero of=zImg bs=512 count=2880
	./imgTool boot zImg 0 0 1
	./imgTool kernel zImg 0 0 2
run_drawStripe:
	make drawStripe
	make run
run_drawRect:
	make drawRect
	make run
run_drawDesktop:
	make drawDesktop
	make run
run:img zImg
	#qemu-system-i386 -drive file=zImg,format=raw,index=0,media=disk
	qemu-system-i386 -drive file=zImg,format=raw,index=0,if=floppy	
clean:
	rm -f boot kernel imgTool zImg  *.o write_vga.asm _write_vga.asm
	
