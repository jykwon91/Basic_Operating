; receiving the data in 'dx'
; for the examples we'll assume that we're called with dx=0x1234
print_hex:
	pusha

	mov cx, 0 ; our index variable

; strategy: get the last char of 'dx' then convert to ASCII
; numeric ascii values: '0' (ascii 0x40) to '9' (0x39), to just add 0x30 to byte n
; for alphabetic characters A-F: 'A' (ascii 0x41) to 'F' (0x46) we'll add 0x40
; then, move the ascii byte to the correct position on the resulting string
hex_loop:
	cmp cx, 4 ; loop 4 times
	je end

	; 1. convert last char of 'dx' to ascii
	mov ax, dx ; we will 'ax' as our working register
	and ax, 0x000f ; 0x1234 -> 0x0004 by masking first three to zeros
	add al, 0x30 ; add 0x30 to N to convert it to ascii "N"
	cmp al, 0x39 ; if > 9, add extra 8 to represent 'A' to 'F'
	jle step2
	add al, 7 ; 'A' is ascii 65 instead of 58, so 65-58=7

step2:
	; 2. get the correct position of the string to place our ascii char
	; bx <- base address + string length - index of char
	mov bx, HEX_OUT + 5 ; base + length
	sub bx, cx ; our index variable
	mov [bx], al ; copy the ascii char on 'al' to the position pointed by 'bx'
	ror dx, 4 ; 0x1234 -> 0x4123 -> 0x3412 -> 0x2341 -> 0x1234

	; increment index and loop
	add cx, 1
	jmp hex_loop

end:
	; prepare the parameter and call the function
	; remember that print receive parameters in 'bx'
	mov bx, HEX_OUT
	call print

	popa
	ret

HEX_OUT:
	db '0x0000', 0 ; reserve memory for our new string
