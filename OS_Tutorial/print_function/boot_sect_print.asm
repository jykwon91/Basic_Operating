print:
	pusha ; push Push AX, CX, DX, BX, original SP, BP, SI, and DI onto stack

; keep this in mind:
; while (string[i] != 0) { print stirng[i]; i++ }

; the comparison for string end ( null byte )
start:
	; start at the first address and check if it is the end ( 0 )
	mov al, [bx] ; 'bx' is the base address for the string
	cmp al, 0 ; if 0, jump to done function
	je done

	; the part where we print with bios help
	; if not the end, or 0, print char
	mov ah, 0x0e
	int 0x10 ; 'al' already contains the char

	; increment pointer and do next loop
	add bx, 1
	jmp start

done:
	; Pop AX, CX, DX, BX, original SP, BP, SI, and DI from stack
	popa
	; return to original address
	ret

print_nl:
	pusha

	; "mov ah, 0x0e" is simply telling NASM to "Hey, please move the byte 0x0e to the register "ah".
	mov ah, 0x0e
	mov al, 0x0a ; newline char
	int 0x10
	mov al, 0x0d ; carriage return
	int 0x10

	popa
	ret
