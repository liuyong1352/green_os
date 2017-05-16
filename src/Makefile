default:
	make run 
img:greenos.asm Makefile
	nasm greenos.asm -o zImg
run:img
	qemu-system-i386 -drive file=zImg,format=raw,index=0,if=floppy
clean:
	rm -f zImg	
