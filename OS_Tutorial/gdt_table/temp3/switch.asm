[bits 16]
; switch to protected mode
switch_to_pm:

	cli	; we must switch of interrupts until we have
		; setup the protected mode interrupt vector
		; otherwise interrupts will run riot
	lgdt [gdt_descriptor]	; load our global descriptor table, which defines
				; the protected mode segments (e.g. for code and data)

	mov eax, cr0		; to make the switch to protected mode, we set
	or eax, 0x1		; the first bit of cr0, a control register
	mov cr0, eax

	jmp CODE_SEG:init_pm	; make a far jump (i.e. to a new segment) to our 32 bi
				; cdoe. this also forces the cpu to flush its cache of
				; pre-fetched and real-mode decoded instruction, which can
				; cause problems

[bits 32]
; initialize registers and the stack once in pm
init_pm:
	mov ax, DATA_SEG	; now in pm, our old segments are meaningless
	mov ds, ax		; so we point our segment registers to the
	mov ss, ax		; data selector we defined in our gdt
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000	; update our stack position so it is right
	mov esp, ebp		; at the top of the free space

	call BEGIN_PM		; finall, call some well known label
