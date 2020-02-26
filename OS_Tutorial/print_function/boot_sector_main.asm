[org 0x7c00]	; tell assembler that our offset is bootsector code

; the main routine makes sure the parameters are ready and then calls the function
mov bx, HELLO
call print

call print_n1

mov bx, GOODBYE
call print

call print_n1

mov dx, 0x12fe
call print_hex

; hang
jmp $

; remember to include subroutines below the hang
%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"

; data
HELLO:
	db 'Hello, World', 0

GOODBYE:
	db 'Goodbye', 0

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55
