%define STR "%3$c%3$csection .data%3$cstr:%3$c.string db %2$c%1$s%2$c%3$c%3$csection .text%3$cglobal start%3$cglobal _main%3$cextern _printf%3$c%3$cstart:%3$ccall _main%3$cret%3$c%3$c_main:%3$c; Com 2%3$cpush rbp%3$cmov rbp, rsp%3$csub rsp, 16%3$clea rdi, [rel str.string]%3$clea rsi, [rel str.string]%3$cmov rdx, 34%3$cmov rcx, 10%3$ccall _printf%3$ccall _end%3$c%3$c_end:%3$cleave%3$cret%3$c"
; %define GLOB_NO_MAIN global _main
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
; Com 2
push rbp
mov rbp, rsp
sub rsp, 16

; OPEN FILE
lea rdi, [rel strings.file]
mov rsi, 0x0202
mov rdx, 644o
mov rax, MACH_SYSCALL(5)
syscall
; push rax

; WRITE IN FILE
mov rdi, rax
lea rsi, [rel strings.prog]
lea rdx, [rel strings.prog]
mov rcx, 34
mov r8, 10
call _dprintf

; CLOSE FILE
pop rdi
mov rax, MACH_SYSCALL(6)
syscall

leave
mov rax, 0x0
ret
