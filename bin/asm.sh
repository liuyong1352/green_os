#! /bin/sh

cd src
nasm helloos.asm -o greenos.img
mv greenos.img ../bin/
