default:
	make asm
tool:imgTool Makefile
	gcc imgTool.c -o imgTool
testImg:tool
	touch hello.txt 
	echo "hello green os !" >> hello.txt
	./imgTool hello.txt zImg 0 0 2
asm:greenos.asm   Makefile
	nasm greenos.asm -o boot
img:asm boot imgTool  Makefile
	dd if=/dev/zero of=zImg bs=512 count=2880
	./imgTool boot zImg 0 0 1
	touch hello.txt 
	echo "hello green os !" >> hello.txt
	./imgTool hello.txt zImg 1 0 1
run:img zImg
	#qemu-system-i386 -drive file=zImg,format=raw,index=0,media=disk
	qemu-system-i386 -drive file=zImg,format=raw,index=0,if=floppy	
clean:
	rm -f boot imgTool zImg hello.txt a.out
	
