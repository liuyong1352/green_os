defualt:
	nasm -f elf32 -o sys_print.o  sys_print.asm
	gcc -m32 -c -o hello.o hello.c
	ld -m elf_i386 -o hello sys_print.o hello.o

asm:
	gcc -m32 -fno-asynchronous-unwind-tables -s  -c -o hello.o hello.c
	objconv -fnasm hello.o -o hello.asm
	nasm -f elf32 sys_print02.asm  -o sys_print.o
	gcc -m32 sys_print.o -o sys_print
clean:
	rm *.o hello hello.asm sys_print 
