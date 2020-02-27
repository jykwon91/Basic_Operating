; a boot sector that boots a C kernel in 32-bit protected mode
[org 0x7c00]
KERNEL_OFFSET equ 0x1000	; this is the memory offset to which we will load our kernel

	mov [BOOT_DRIVE], dl	; bios stores our boot drive in dl, so it's
				; best to remember this for later

	mov bp, 0x9000		; set up the stack
	mov sp, bp

	mov bx, MSG_REAL_MODE	; announce that we are starting
	call print	; booting from 16-bit real mode

	call load_kernel	; load our kernel

	call switch_to_pm	; switch ot protected mode, from which
				; we will not return

	jmp $

; include our routines
%include "print.asm"
%include "disk_load.asm"
%include "gdt.asm"
%include "print_32.asm"
%include "switch.asm"

[bits 16]

; load kernel
load_kernel:
	mov bx, MSG_LOAD_KERNEL		; print a message to say we are loading the kernel
	call print

	mov bx, KERNEL_OFFSET		; set-up parameters for our disk_load routine so
	mov dh, 15			; that we load the first 15 sectors (excluding
	mov dl, [BOOT_DRIVE]		; the boot sector) from the boot disk (i.e our
	call disk_load			; kernel code) to address KERNEL_OFFSET

	ret

[bits 32]
; this is where we arrive after switching to and initializing protected mode

BEGIN_PM:
	mov ebx, MSG_PROT_MODE		; use our 32 bit print routine to
	call print_string_pm		; accounce we are in protected mode

	call KERNEL_OFFSET		; now jump to the address of our loaded
					; kernel code, assume the brace position,
					; and cross fingers.

	jmp $				; hang

; global variables
BOOT_DRIVE	db 0
MSG_REAL_MODE	db "Started in 16-bit real mode", 0
MSG_PROT_MODE	db "successfully landed in 32-bit protected mode", 0
MSG_LOAD_KERNEL	db "loading kernel into memory.", 0

; bootsector padding
times 510-($-$$) db 0
dw 0xaa55
