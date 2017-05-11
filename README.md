# green_os -- draw desktop 

get source code 

install git and clone 

git install https://github.com/liuyong1352/green_os.git

本次完成字体的生成 ， 字体的显示
本次修改了 读取扇区数量 ， 增加了字体文件 ， 还蛮大

##Ubantu
制作字体文件
1. cd green_os/src/MakeFont
2. make 


执行
1. cd green_os/src
2. make 


以下是得到c语言对应的汇编代码


1. compile write_vga.c 
gcc -m32 -fno-asynchronous-unwind-tables -s  -c write_vga.c -o write_vga.o

2. 反汇编，并删除其中不需要的代码 参考write_vga.asm
objconv -fnasm  write_vga.o






