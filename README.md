# green_os -- draw desktop 

get source code 

install git and clone 

git install https://github.com/liuyong1352/green_os.git


##Ubantu
1. cd green_os/src

2. make run


以下是得到c语言对应的汇编代码


1. compile write_vga.c 
gcc -m32 -fno-asynchronous-unwind-tables -s  -c write_vga.c -o write_vga.o

2. 反汇编，并删除其中不需要的代码 参考write_vga.asm
objconv -fnasm  write_vga.o






