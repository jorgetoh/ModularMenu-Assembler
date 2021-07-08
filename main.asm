;
;	https://github.com/jorgetoh
;

	.module main

 end		.equ 0xFF01
 keyboard	.equ 0xFF02
 screen	.equ 0xFF00
 
pilaS		.equ 0xF000
pilaU		.equ 0x8000
 
 	;GLOBAL VARIABLES (This library)
	.globl screen
	.globl keyboard
	.globl program_end
	
	;GLOBAL VARIABLES (Library menu.asm)
	.globl show_main_menu


;
program_start:
  lds #pilaS
  ldu #pilaU
  
  jsr show_main_menu
  


program_end:
  clra
  sta end

  .area FIJA(ABS)
  
  .org 0xFFFE
  .word program_start
