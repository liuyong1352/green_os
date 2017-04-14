#! /bin/sh

cd ../src
make 
echo "greenos.img is ready"
qemu-system-i386 -drive file=greenos.img,format=raw,index=0,media=disk
