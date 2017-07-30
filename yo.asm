section .data
    text db 'Yo assembly', 10 ; defines string as a text var

section .text
    global _start

_start:
    mov rax, 1 ; 1 is a ID, tells the programm what to do with the rest | 0-read, 1-write, 2-open, 3-close
    mov rdi, 1 ; standard | 0-input, 1-output, 2-error
    mov rsi, text ; puts value of text var into rsi
    mov rdx, 14 ; lenght of text var value
    syscall ; ask kernel

    mov rax, 60 ; part of sys_exit it's constant
    mov rdi, 0 ; means no error needed, part of sys_exit
    syscall ; ask kernel
