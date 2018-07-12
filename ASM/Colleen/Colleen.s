; Com 1

section .data
str:
.string db "; Com 1%3$c%3$csection .data%3$cstr:%3$c.string db %2$c%1$s%2$c, 0%3$c%3$csection .text%3$cglobal start%3$cglobal _main%3$cextern _printf%3$c%3$cstart:%3$ccall _main%3$cret%3$c%3$c_main:%3$c; Com 2%3$cpush rbp%3$cmov rbp, rsp%3$csub rsp, 16%3$clea rdi, [rel str.string]%3$clea rsi, [rel str.string]%3$cmov rdx, 34%3$cmov rcx, 10%3$ccall _printf%3$ccall _end%3$c%3$c_end:%3$cleave%3$cret%3$c", 0

section .text
global start
global _main
extern _printf

start:
call _main
ret

_main:
; Com 2
push rbp
mov rbp, rsp
sub rsp, 16
lea rdi, [rel str.string]
lea rsi, [rel str.string]
mov rdx, 34
mov rcx, 10
call _printf
call _end

_end:
leave
ret
