segment .data

segment .bss

segment .text

	global _start
_start:
	mov eax, 0xFADAFACE
	xor eax, eax
	
	;; gives a 0
	
	mov ebx, 0
	mov eax, 1
	int 0x80
