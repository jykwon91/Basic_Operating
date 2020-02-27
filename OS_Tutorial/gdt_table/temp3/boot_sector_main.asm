; a boot sector that enters 32-bit protected mode
[org 0x7c00]

	mov bp, 0x9000		; set the stack
	mov sp, bp

	mov bx, MSG_REAL_MODE
	call print
	
	call switch_to_pm	; note that we never return from here

	jmp $

%include "boot_sect_print.asm"
%include "gdt.asm"
%include "switch.asm"
%include "print_32.asm"

[bits 32]

; this is where we arrivce after switching to and initializing protected mode
BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	call print_string_pm	; use our 32 bit print routine

	jmp $		; hang

; global variables
MSG_REAL_MODE db "Starting in 16 bit real mode",0
MSG_PROT_MODE db "successfully landed in 32-bit protected mode", 0

; bootsector padding
times 510-($-$$) db 0
dw 0xaa55
