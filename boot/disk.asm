; load DH sectors to ES:BX from drive DL
disk_load:
	push dx			; store DX on stack so later we can recall
				; how many sectors were request to be read
				; even if it is altered in the meantime
;	mov ah, 0x02		; bios read sector function
;	mov al, dh		; read DH sectors
;	mov ch, 0x00		; select cylinder 0
;	mov dh, 0x00		; select head 0
;	mov cl, 0x02		; start reading from second sector ( i.e

	mov ah, 0x02		; ah <- int 0x13 function. 0x02 = 'read'
	mov al, dh		; al <- number of sectors to read (0x01 .. 0x80)
	mov cl, 0x02		; cl <- sector (0x01 .. 0x11)
				; 0x01 is our boot sector, 0x02 is the first 'available' sector
	mov ch, 0x00		; ch <- cylinder (0x0 .. 0x3FF, upper 2 bits in 'cl')
				; dl <- drive number. our caller sets it as a parameter and gets it from bios
				;(0 = floppy, 1=flopp2, 0x80 =hdd, 0x81 = hdd2)
	mov dh, 0x00		; dh <- head number (0x0 .. 0xF)

				; after the boot sector)
	int 0x13		; bios interrupt

	jc disk_error		; jump if error (i.e. carry flag set)

	pop dx		; restore dx from the stack
	cmp dh, al		; if al (sectors read) != dh (sectors exptected)
	jne disk_error 	; display error message
	ret

disk_error :
	mov bx, DISK_ERROR_MSG
	call print
	jmp $

; Variables
DISK_ERROR_MSG db "Disk read error!", 0
