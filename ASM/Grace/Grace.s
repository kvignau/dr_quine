%define STR "%4$cdefine STR %2$c%3$s%2$c%1$c%4$cdefine MACH_SYSCALL(nb) 0x2000000 | nb%1$c%4$cdefine NO_MAIN _main%1$c%1$csection .data%1$cstrings:%1$c.file db %2$cGrace_kid.s%2$c, 0%1$c.prog db STR, 0%1$c%1$csection .text%1$cglobal start%1$cglobal NO_MAIN%1$cextern _dprintf%1$c%1$cstart:%1$ccall NO_MAIN%1$cret%1$c%1$cNO_MAIN:%1$c; Com 1%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 16%1$c%1$clea rdi, [rel strings.file]%1$cmov rsi, 0x0202%1$cmov rdx, 644o%1$cmov rax, MACH_SYSCALL(5)%1$csyscall%1$cjc error%1$cmov [rsp], rax%1$c%1$cmov rdi, rax%1$clea rsi, [rel strings.prog]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel strings.prog]%1$cmov r9, 37%1$ccall _dprintf%1$cjc error%1$c%1$cmov rdi, [rsp]%1$cmov rax, MACH_SYSCALL(6)%1$csyscall%1$cjc error%1$cleave%1$cret%1$c%1$cerror:%1$cmov rax, 1%1$cleave%1$cret%1$c"
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

lea rdi, [rel strings.file]
mov rsi, 0x0202
mov rdx, 644o
mov rax, MACH_SYSCALL(5)
syscall
jc error
mov [rsp], rax

mov rdi, rax
lea rsi, [rel strings.prog]
mov rdx, 10
mov rcx, 34
lea r8, [rel strings.prog]
mov r9, 37
call _dprintf
jc error

mov rdi, [rsp]
mov rax, MACH_SYSCALL(6)
syscall
jc error
leave
ret

error:
mov rax, 1
leave
ret
