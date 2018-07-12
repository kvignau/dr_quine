%define MACH_SYSCALL(nb) 0x2000000 | nb

section .data
strings:
.file db "Sully_%d.s", 0
.prog db "%%define MACH_SYSCALL(nb) 0x2000000 | nb%1$c%1$csection .data%1$cstrings:%1$c.file db %2$cSully_%%d.s%2$c, 0%1$c.prog db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cglobal start%1$cglobal _main%1$cextern _dprintf%1$cextern _sprintf%1$c%1$cstart:%1$ccall _main%1$cret%1$c%1$c_main:%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 16%1$cmov r15, %4$d%1$cjmp while%1$c%1$cwhile:%1$clea rdi, [rel rsp]%1$clea rsi, [rel strings.file]%1$cmov rdx, r15%1$ccall _sprintf%1$c%1$cmov rdi, rsp%1$cmov rsi, 0x0202%1$cmov rdx, 644o%1$cmov rax, MACH_SYSCALL(5)%1$csyscall%1$cjc error%1$cmov [rsp], rax%1$c%1$cmov rdi, rax%1$clea rsi, [rel strings.prog]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel strings.prog]%1$cmov r9, r15%1$ccall _dprintf%1$cjc error%1$c%1$cmov rdi, [rsp]%1$cmov rax, MACH_SYSCALL(6)%1$csyscall%1$cjc error%1$cjmp end%1$c%1$cend:%1$csub r15, 0x1%1$ccmp r15, 0x0%1$cjge while%1$cleave%1$cret%1$c%1$cerror:%1$cmov rax, 1%1$cleave%1$cret%1$c", 0

section .text
global start
global _main
extern _dprintf
extern _sprintf

start:
call _main
ret

_main:
push rbp
mov rbp, rsp
sub rsp, 16
mov r15, 5
jmp while

while:
lea rdi, [rel rsp]
lea rsi, [rel strings.file]
mov rdx, r15
call _sprintf

mov rdi, rsp
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
mov r9, r15
call _dprintf
jc error

mov rdi, [rsp]
mov rax, MACH_SYSCALL(6)
syscall
jc error
jmp end

end:
sub r15, 0x1
cmp r15, 0x0
jge while
leave
ret

error:
mov rax, 1
leave
ret
