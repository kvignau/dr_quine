; %define STR "section .data%3$cstr:%3$c.string db %2$c%1$s%2$c%3$c%3$csection .text%3$cglobal start%3$cglobal _main%3$cextern _printf%3$c%3$cstart:%3$ccall _main%3$cret%3$c%3$c_main:%3$c; Com 2%3$cpush rbp%3$cmov rbp, rsp%3$csub rsp, 16%3$clea rdi, [rel str.string]%3$clea rsi, [rel str.string]%3$cmov rdx, 34%3$cmov rcx, 10%3$ccall _printf%3$ccall _end%3$c%3$c_end:%3$cleave%3$cret%3$c"
%define STR "%4$cdefine STR %2$c%3$s%2$c%1$c%4$cdefine MACH_SYSCALL(nb) 0x2000000 | nb%1$c%4$cdefine NO_MAIN _main%1$c%1$csection .data%1$cstrings:%1$c.file db %2$cGrace_kid.s%2$c, 0%1$c.prog db STR, 0%1$c"
%define MACH_SYSCALL(nb) 0x2000000 | nb
%define NO_MAIN _main

section .data
strings:
.file db "Grace_kid.s", 0
.prog db STR, 0

section .text
global start
global NO_MAIN
extern _dprintf

start:
call NO_MAIN
ret

NO_MAIN:
; Com 1
push rbp
mov rbp, rsp
sub rsp, 16

; OPEN FILE
lea rdi, [rel strings.file]
mov rsi, 0x0202
mov rdx, 644o
mov rax, MACH_SYSCALL(5)
syscall
mov [rsp], rax

; WRITE IN FILE
mov rdi, rax
lea rsi, [rel strings.prog]
mov rdx, 10
mov rcx, 34
lea r8, [rel strings.prog]
mov r9, 37
call _dprintf

; CLOSE FILE
mov rdi, [rsp]
mov rax, MACH_SYSCALL(6)
syscall

leave
; mov rax, 0x0
ret
