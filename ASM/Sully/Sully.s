%define MACH_SYSCALL(nb) 0x2000000 | nb

section .data
strings:
.source db "Sully_%d.s", 0
.bin db "Sully_%d", 0
.obj db "Sully_%d.o", 0
.access db "FT_OK", 0
.prog db "%%define MACH_SYSCALL(nb) 0x2000000 | nb%1$c%1$csection .data%1$cstrings:%1$c.source db %2$cSully_%%d.s%2$c, 0%1$c.bin db %2$cSully_%%d%2$c, 0%1$c.obj db %2$cSully_%%d.o%2$c, 0%1$c.access db %2$cFT_OK%2$c, 0%1$c.prog db %2$c%3$s%2$c, 0%1$c.nasm db %2$cnasm -f macho64 %%s%2$c, 0%1$c.gcc db %2$cgcc -Wall -Werror -Wall %%s -o %%s%2$c, 0%1$c.exe db %2$c./%%s%2$c, 0%1$c%1$csection .text%1$cglobal start%1$cglobal _main%1$cextern _dprintf%1$cextern _sprintf%1$cextern _system%1$c%1$cstart:%1$ccall _main%1$cret%1$c%1$c_main:%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 32%1$cmov r15, %4$d%1$c%1$ccmp r15, 0x0%1$cjle end%1$c%1$clea rdi, [rel rsp] ; .c%1$clea rsi, [rel strings.source]%1$cmov rdx, r15%1$ccall _sprintf%1$c%1$clea rdi, [rel rsp]%1$clea rsi, [rel strings.access]%1$cmov rax, MACH_SYSCALL(33)%1$csyscall%1$cjc continue%1$cjmp decrement%1$c%1$cdecrement:%1$csub r15, 1%1$clea rdi, [rel rsp]%1$clea rsi, [rel strings.source]%1$cmov rdx, r15%1$ccall _sprintf%1$c%1$ccontinue:%1$csub rsp, 32%1$clea rdi, [rel rsp] ; bin%1$clea rsi, [rel strings.bin]%1$cmov rdx, r15%1$ccall _sprintf%1$c%1$csub rsp, 32%1$clea rdi, [rel rsp] ; .o%1$clea rsi, [rel strings.obj]%1$cmov rdx, r15%1$ccall _sprintf%1$c%1$cadd rsp, 64 ; FIRST VAR%1$c%1$c; NASM%1$clea rdx, [rel rsp]%1$csub rsp, 96%1$clea rdi, [rel rsp] ;4eme var%1$clea rsi, [rel strings.nasm]%1$ccall _sprintf%1$c%1$c; EXE%1$cadd rsp, 64%1$clea rdx, [rel rsp]%1$csub rsp, 96%1$clea rdi, [rel rsp] ;5eme var%1$clea rsi, [rel strings.exe]%1$ccall _sprintf%1$c%1$c; GCC%1$cadd rsp, 64%1$clea rdx, [rel rsp]%1$cadd rsp, 32%1$clea rcx, [rel rsp]%1$csub rsp, 160%1$clea rdi, [rel rsp] ;5eme var%1$clea rsi, [rel strings.gcc]%1$ccall _sprintf%1$c%1$cadd rsp, 192 ; FIRST VAR%1$cmov rdi, rsp%1$cmov rsi, 0x0202%1$cmov rdx, 644o%1$cmov rax, MACH_SYSCALL(5)%1$csyscall%1$cjc error%1$cmov [rsp], rax%1$c%1$csub rsp, 192 ; LAST VAR%1$c%1$cmov rdi, rax%1$clea rsi, [rel strings.prog]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel strings.prog]%1$cmov r9, r15%1$ccall _dprintf%1$cjc error%1$c%1$cadd rsp, 96%1$clea rdi, [rel rsp]%1$csub rsp, 96%1$ccall _system%1$c%1$clea rdi, [rel rsp]%1$ccall _system%1$c%1$cadd rsp, 64%1$clea rdi, [rel rsp]%1$csub rsp, 64%1$ccall _system%1$c%1$cend:%1$cleave%1$cret%1$c%1$cerror:%1$cmov rax, 1%1$cleave%1$cret%1$c", 0
.nasm db "nasm -f macho64 %s", 0
.gcc db "gcc -Wall -Werror -Wall %s -o %s", 0
.exe db "./%s", 0

section .text
global start
global _main
extern _dprintf
extern _sprintf
extern _system

start:
call _main
ret

_main:
push rbp
mov rbp, rsp
sub rsp, 32
mov r15, 5

cmp r15, 0x0
jle end

lea rdi, [rel rsp] ; .c
lea rsi, [rel strings.source]
mov rdx, r15
call _sprintf

lea rdi, [rel rsp]
lea rsi, [rel strings.access]
mov rax, MACH_SYSCALL(33)
syscall
jc continue
jmp decrement

decrement:
sub r15, 1
lea rdi, [rel rsp]
lea rsi, [rel strings.source]
mov rdx, r15
call _sprintf

continue:
sub rsp, 32
lea rdi, [rel rsp] ; bin
lea rsi, [rel strings.bin]
mov rdx, r15
call _sprintf

sub rsp, 32
lea rdi, [rel rsp] ; .o
lea rsi, [rel strings.obj]
mov rdx, r15
call _sprintf

add rsp, 64 ; FIRST VAR

; NASM
lea rdx, [rel rsp]
sub rsp, 96
lea rdi, [rel rsp] ;4eme var
lea rsi, [rel strings.nasm]
call _sprintf

; EXE
add rsp, 64
lea rdx, [rel rsp]
sub rsp, 96
lea rdi, [rel rsp] ;5eme var
lea rsi, [rel strings.exe]
call _sprintf

; GCC
add rsp, 64
lea rdx, [rel rsp]
add rsp, 32
lea rcx, [rel rsp]
sub rsp, 160
lea rdi, [rel rsp] ;5eme var
lea rsi, [rel strings.gcc]
call _sprintf

add rsp, 192 ; FIRST VAR
mov rdi, rsp
mov rsi, 0x0202
mov rdx, 644o
mov rax, MACH_SYSCALL(5)
syscall
jc error
mov [rsp], rax

sub rsp, 192 ; LAST VAR

mov rdi, rax
lea rsi, [rel strings.prog]
mov rdx, 10
mov rcx, 34
lea r8, [rel strings.prog]
mov r9, r15
call _dprintf
jc error

add rsp, 96
lea rdi, [rel rsp]
sub rsp, 96
call _system

lea rdi, [rel rsp]
call _system

add rsp, 64
lea rdi, [rel rsp]
sub rsp, 64
call _system

end:
leave
ret

error:
mov rax, 1
leave
ret
