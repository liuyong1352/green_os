img:helloos.asm Makefile
	nasm helloos.asm -o greenos.img
run:greenos.img
	qemu-system-i386 -drive file=greenos.img,format=raw,index=0,media=disk
