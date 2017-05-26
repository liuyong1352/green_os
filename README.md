# green_os -- draw desktop 

get source code 

install git and clone 

git install https://github.com/liuyong1352/green_os.git


##Ubantu

执行
1. cd green_os/src
2. make 


以下是得到c语言对应的汇编代码


1. compile write_vga.c 
gcc -m32 -fno-asynchronous-unwind-tables -s  -c write_vga.c -o write_vga.o

2. 反汇编，并删除其中不需要的代码 参考write_vga.asm
objconv -fnasm  write_vga.o


linux13:显示按键的扫码和断码
linux14.0.0 激活鼠标
linux14.0.1 增加printd函数显示字符串 ， 展示鼠标中断数据
linux14.0.2 增加printx函数显示一个字符的16进制 ， 增加数据的结构体 ， 解析数据存放到结构体中



