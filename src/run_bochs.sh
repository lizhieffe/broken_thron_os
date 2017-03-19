#!/bin/sh

mkdir -p out
nasm boot1.asm -o out/boot.bin
dd if=out/boot.bin of=out/a.img bs=512 count=1 conv=notrunc

bochs -f bochs/bochsrc
