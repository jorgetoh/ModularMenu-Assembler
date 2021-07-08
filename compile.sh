#!/bin/bash

#
# Script for compiling the menu system: ./compile.sh
# The script should be located on the same folder as the .asm files.
#

#
# You have to modify the commands below if you add new modules to the program.
#

#Main program
as6809 -o main.asm
as6809 -l main.asm
#Main menu
as6809 -o menu.asm
as6809 -l menu.asm
#Submenu n1
#as6809 -o submenu1.asm
#as6809 -l submenu1.asm


aslink  -s -m -w -u _CODE=0x100 main.s19 main.rel menu.rel #submenu1.rel

ensambla main menu #submenu1
