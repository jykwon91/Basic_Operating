; a boot sector that prints a stirng using a function

[org 0x7c00]	; tell the assembler where this code will be loaded

	mov bx, HELLO_MSG	; use bx as a parameter to our function, so
	call print_string	; we cab specifiy the address of a string

	mov bx, GOODBYE_MSG
	call print_string

	jmp $		; hang

%include "print_string.asm"

; Data
HELLO_MSG:
	db 'Hello, World!', 0  ; <-- the zero on the end tells our routine
				; when to stop printing characters
GOODBYE_MSG:
	db 'Goodbye!', 0

; padding and magic number
time 510-($-$$) db 0
dw 0xaa55
