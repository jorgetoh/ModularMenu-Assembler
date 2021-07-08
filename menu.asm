;
;	https://github.com/jorgetoh
;

	.module menu
	
	;GLOBAL VARIABLES (This library)
	.globl show_main_menu
	
	;GLOBAL VARIABLES (Library main.asm)
	.globl screen
	.globl keyboard
	.globl program_end

;Backup of the choosed option
option:	.byte 0

show_main_menu:
  clra
  ldx #main_menu_message
  jsr print_string
  bra option_main_menu
  
option_main_menu:
  ldx #main_menu_options
  jsr print_string
  
  clra
  lda keyboard
  sta option
  
  cmpa #'1
  beq opcion1
  
  cmpa #'2
  beq opcion2
  
  cmpa #'3
  beq opcion3
  
  cmpa #'4
  beq leave
  
  ldx #error_message
  jsr print_string
  bra option_main_menu
  
opcion1:
  ldx #opcion_1
  jsr print_string
  bra option_main_menu
  
opcion2:
  ldx #opcion_2
  jsr print_string
  bra option_main_menu
  
opcion3:
  ldx #opcion_3
  jsr print_string
  bra option_main_menu
 
leave:
  ldx #leave_message
  jsr print_string
  bra program_end


main_menu_message:
		.ascii "\33[2J\33[33m"
		.ascii " /$$      /$$ /$$$$$$$$ /$$   /$$ /$$   /$$        /$$$$$$  /$$     /$$ /$$$$$$ \n"
		.ascii "| $$$    /$$$| $$_____/| $$$ | $$| $$  | $$       /$$__  $$|  $$   /$$//$$__  $$\n"
		.ascii "| $$$$  /$$$$| $$      | $$$$| $$| $$  | $$      | $$  \__/ \  $$ /$$/| $$  \__/\n"
		.ascii "| $$ $$/$$ $$| $$$$$   | $$ $$ $$| $$  | $$      |  $$$$$$   \  $$$$/ |  $$$$$$ \n"
		.ascii "| $$  $$$| $$| $$__/   | $$  $$$$| $$  | $$       \____  $$   \  $$/   \____  $$\n"
		.ascii "| $$\  $ | $$| $$      | $$\  $$$| $$  | $$       /$$  \ $$    | $$    /$$  \ $$\n"
		.ascii "| $$ \/  | $$| $$$$$$$$| $$ \  $$|  $$$$$$/      |  $$$$$$/    | $$   |  $$$$$$/\n"
		.asciz "|__/     |__/|________/|__/  \__/ \______/        \______/     |__/    \______/ \n"
main_menu_options:
		.ascii "\nChoose one of the options below: \n"
		.ascii "      \33[32m\33[1m(1)\33[0m Option #1\n"
		.ascii "      \33[32m\33[1m(2)\33[0m Option #2\n"
		.ascii "      \33[32m\33[1m(3)\33[0m Option #3\n"
		.ascii "      \33[32m\33[1m(4)\33[0m Close the program\n"
		.asciz "Option choosed: "

error_message:	.asciz "\n\33[1m\33[31mERROR:\33[0m The chosen option is not valid."

opcion_1:	.ascii "\n\n\33[1m\33[32mOPCION #1 \33[0m| You have chosen the option 1, this option does nothing"
		.asciz "\n          | I will send you back to the option menu...\n"
opcion_2:	.ascii "\n\n\33[1m\33[32mOPCION #2 \33[0m| You have chosen the option 2, this option does nothing"
		.asciz "\n          | I will send you back to the option menu...\n"
opcion_3:	.ascii "\n\n\33[1m\33[32mOPCION #3 \33[0m| You have chosen the option 3, this option does nothing"
		.asciz "\n          | I will send you back to the option menu...\n"
		
leave_message:	.asciz "\nClosing the program...\n"
; Print message loaded on X
print_string:
  clra
  pshs a
ic_sgte:
  lda ,x+
  beq ic_return
  sta screen
  bra ic_sgte

ic_return:
  puls a
  rts
