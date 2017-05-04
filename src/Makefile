
default:
	make asm
tool:imgTool Makefile
	gcc imgTool.c -o imgTool
asm:greenos.asm kernel.asm  Makefile
	nasm greenos.asm -o boot 
	nasm kernel.asm -o kernel
img:asm boot kernel imgTool  Makefile
	dd if=/dev/zero of=zImg bs=512 count=2880
	./imgTool boot zImg 0 0 1
	./imgTool kernel zImg 0 0 2
run:img zImg
	#qemu-system-i386 -drive file=zImg,format=raw,index=0,media=disk
	qemu-system-i386 -drive file=zImg,format=raw,index=0,if=floppy	
clean:
	rm -f boot kernel imgTool zImg  a.out *.o
	
