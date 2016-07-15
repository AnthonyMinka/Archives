.intel_syntax

section .data
	msg db	'Hello, World!', 0xa
	len equ $ - msg


section .text
	global _start

_start:

	mov rdx, len
	mov rsi, msg
	mov rdi, 1
	mov eax, 4
	int 0x80
	
	mov ebx, 0
	mov rdi, 1
	int 0x80
