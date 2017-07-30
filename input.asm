section .data
    text1 db "What is your name? "
    text2 db "Hello, "

section .bss
    name resb 16 ; reserves a 16 bytes var called name in RAM

section .text
    global _start

_start:
    call _printText1 ; logic of order has to be ok
    call _getName
    call _printText2
    call _printName

    ;#sys_exit
    mov rax, 60
    mov rdi, 0
    syscall

_getName:
    mov rax, 0 ; input
    mov rdi, 0 ; standard input
    mov rsi, name
    mov rdx, 16
    syscall
    ret

_printText1:
    mov rax, 1 ; output
    mov rdi, 1 ; standard output
    mov rsi, text1 ; variable
    mov rdx, 19 ; lenght of text1
    syscall ; ask kernel
    ret ; return to call

_printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, 7
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall
    ret