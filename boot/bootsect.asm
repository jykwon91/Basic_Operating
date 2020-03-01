[org 0x7c00] ; address of start of boot sector
KERNEL_OFFSET equ 0x1000	; memory offset to load our kernel

	mov [BOOT_DRIVE], dl	; bios stores boot drive in dl
	mov bp, 0x9000
	mov sp, bp

	mov bx, MSG_REAL_MODE
	call print		; booting from 16 bit -real mode
	call print_nl		; 
	call load_kernel	; read the kernel from disk
	call switch_to_pm	; disable interrupts, load gdt, switch to protected mode
				; which we will not return

%include "boot/print.asm"
%include "boot/print_hex.asm"
%include "boot/disk.asm"
%include "boot/gdt.asm"
%include "boot/print_32.asm"
%include "boot/switch_pm.asm"

[bits 16]
load_kernel:
	mov bx, MSG_LOAD_KERNEL	; print message to say we are loading the kernel
	call print
	call print_nl

	mov bx, KERNEL_OFFSET	; read from disk and store in 0x1000
	mov dh, 15		; set up paramenters for disk_load routine so
	mov dl, [BOOT_DRIVE]	; the boot sector) from the boot disk (i.e. our 
	call disk_load		; kernel code) to address KERNEL_OFFSET
	ret

[bits 32]
BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	call print_string_pm

	call KERNEL_OFFSET	; now ump to address of our loaded kernel code,
				; assume the brace prosition

	jmp $	; hang

BOOT_DRIVE db 0;	; store it in memory because 'dl' may get overwritten
MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
MSG_PROT_MODE db "Landed in 32-bit Protected Mode", 0
MSG_LOAD_KERNEL db "Loading kernel into memory", 0

; padding
times 510 - ($-$$) db 0
dw 0xaa55

