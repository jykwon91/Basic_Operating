; a simple boot sector program that demonstrates addressing
mov ah, 0x0e ; int 10/ah = 0eh 0> scrolling teletype BIOS routine

; first attempt
; fails because it tries to print the memory address (i.e. the pointer)
; and not the actual contents
mov al, "1"
int 0x10
mov al, the_secret
int 0x10		; does this print x?

;second sttempt
; it tries to print the memory address of 'the_secret' which is the correct approach
; but BIOS places our bootsector binary at address 0x7c00
; we need to add that padding before hand
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10		;does this print x?

; third attempt
; add the bios starting offset 0x7c00 to the memory address of the X
; and then derference the contents of that pointer
; we need the help of a different register 'bx' because mov al, [ax] is illegal
; a register can't be used as a source and destination for the same command
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10		; does this print an x?

; fourth attemp
; we try a shortcut wince we know that the X is stored at byte 0x2d in our binary
; that's the smart but inefective, we don't want to be recounting label offesets
; every time we change the code
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10		; does this print an x?

jmp $			; jump foever

the_secret:
	; ASCII code 0x58 ('X') is stored just before the zero-padding
; on this code that is at byte 0x2d 
	db "X"

; padding and magic bios number
times 510-($-$$) db 0
dw 0xaa55
