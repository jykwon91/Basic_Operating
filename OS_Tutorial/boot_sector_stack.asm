; a simple boot sector program that demonstrates the stack

mov ah, 0x0e		; int 10/ah = 0eh 0> scrolling teletype BIOS routine

mov bp, 0x8000 		; set the base of the stack a little above where BIOS loads our boot sector so it won't overwrite us
mov sp, bp

push 'A'		; push some characters on the stack for later
push 'B'		; retreival. note, these are pushed on as
push 'C'		; 16-bit values, so the most significant byte
			; will be added by our assembler as 0x00
mov al, [0x7ffa]	; to prove our stack grows downwards from bp,
			; fetch the char at 0x8000 - 0x2 (i.e. 16-bits)
int 0x10		; print(al)

pop bx		; note we can only pop 16 -bits, so pop to bx
mov al, bl		; then copy bl (i.e. 8-bit char) to al
int 0x10		; print(al)

pop bx 		; pop the next value
mov al, bl
int 0x10		;print(al)

mov al, [0x7ffe]	; to prove our stack grows downwards from bp,
			; fetch the char at 0x8000 - 0x2 (i.e. 16-bits)
int 0x10		; print(al)

jmp $			; jump forever

; padding and magic bios number

times 510-($-$$) db 0
dw 0xaa55
