#!/usr/bin/zsh
#

nasm -f elf64 -g $1.asm
gcc $1.o -o $1 -no-pie

