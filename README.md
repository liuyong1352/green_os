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
* linux15.0.3 增加图层处理 ， 鼠标使用图层来绘制， 增加c语言堆栈大小 ，不然main中放局部变量数组很快就不够使用	
* linux15.0.4 使用图层绘制桌面
* linux15.0.5 使用图层加速v01 ， 使字体直接绘制在图层上 
* linux15.0.6 实现内核的sprintf ,仅格式整数 用16进制输出 ，按回车建可以看效果
* linux15.0.7 整理fifo graphic 从write_vga中移出来 ， 暂时有个鼠标移动的bug
* linux16.0.0 显示windows窗口 ， 增加一个计数器 ， 不过有闪烁 ， 以下我继续接着解决吧
* linux16.0.1 消除闪烁 ， 不过鼠标放上面还是有闪烁
* linux16.0.2 消除闪烁V2
* linux16.0.3 开启时钟中断，使用时钟中断实现简单计数器
* linux16.0.4 实现timeout
* linux16.0.5 是用多个timer ， 实现光标闪烁的功能
* linux16.0.6 speed up timer interupt 
