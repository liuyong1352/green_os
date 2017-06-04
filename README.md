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



* linux13:显示按键的扫码和断码
* linux14.0.0 激活鼠标
* linux14.0.1 增加printd函数显示字符串 ， 展示鼠标中断数据
* linux14.0.2 增加printx函数显示一个字符的16进制 ， 增加数据的结构体 ， 解析数据存放到结构体中
* linux14.0.3 解析鼠标中断，转化成对应的结构体， 使鼠标动起来
* linux15.0.0 使用Int15中断 ，读取内存map ， 并展示map详细信息
* linux15.0.1 整理文件，增加mm.c ,使用make链接多个文件，实现简单的内存管理算法
* linux15.0.2 增加一次分配4k ， 测试分配算法正确性
NOTE:
[1] C 语言如果main方法前面有方法 ， 第一条指令不是main ，是按照ld 参数的顺序	
