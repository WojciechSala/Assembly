section .data
	text1 db "Insert PIN: "
	text2 db "PIN is correct"
	text3 db "PIN is incorrect"
	
section .bss
	pinInput resb 32 ; reserves 8 bytes for 4 digit pin number
	
section .text
	global _start
	
_start:
	call _printText1
	call _getPinNumber
	; mov rsi, 0x000
	
	cmp dword[rsi], '1234'
	je _printText2
	
	call _printText3
	call _exit
	
_printText1:
	mov rax, 1
	mov rdi, 1
	mov rsi, text1
	mov rdx, 12
	syscall
	ret
	
_printText2:
	mov rax, 1
	mov rdi, 1
	mov rsi, text2
	mov rdx, 14
	syscall
	call _exit
	
_printText3:
	mov rax, 1
	mov rdi, 1
	mov rsi, text3
	mov rdx, 16
	syscall
	ret
	
_getPinNumber:
	mov rax, 0
	mov rdi, 0
	mov rsi, pinInput
	mov rdx, 8
	syscall
	ret
	
_exit:
	mov rax, 60
	mov rdi, 0
	syscall