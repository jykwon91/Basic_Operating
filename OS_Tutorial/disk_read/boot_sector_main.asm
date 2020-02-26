; read some sectors from the boot disk using disk_Read function
[org 0x7c00]

	mov [BOOT_DRIVE], dl	; bios stores our boot drive in dl, so it's
				; best to remember this for later
	mov bp, 0x8000		; here we set our stack safely out of the
	mov sp, bp		; way, at 0x8000

	mov bx, 0x9000		; load 5 sectors to 0x0000(ES):0x9000(BX)
	mov dh, 5		; from the boot disk
	mov dl, [BOOT_DRIVE]
	call disk_load

	mov dx, [0x9000]	; print out the first loaded word, which
	call print_hex		; we expect to be 0xdada, stored at address 0x9000

	mov dx, [0x9000 + 512]	; also, print the first word from the
	call print_hex		; 2nd loaded sector: should be 0xface

	jmp $

%include "../print_function/boot_sect_print.asm"
%include "../print_function/boot_sect_print_hex.asm"
%include "boot_sector_disk.asm"

; global variables
BOOT_DRIVE: db 0

; boot sector padding
times 510-($-$$) db 0
dw 0xaa55

; we know that bios will load only the first 512-byte sector from the disk
; so if we purposely add a few more sectors to our code by repeating some 
; familiar numbers, we can prove to ourselves that we actually loaded those
; additional two sectors from the disk we booted from
times 256 dw 0xdada
times 256 dw 0xface
