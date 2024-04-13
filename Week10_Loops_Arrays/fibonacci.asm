; 2. Calculate the final number of the first 10 Fibonacci numbers starting from 0. 
; The result should be equal to 55.

section .text
        global _start

_start:
        mov ecx, 10     ; number of fibonacci numbers 
        mov eax, 0      ; assign 0, first fib number, to eax
        mov ebx, 1      ; assign 1, second fib number, to ebx
        mov [fib], eax  ; store 0 in fib variable
        jmp label       ; jump to label
        
label:
        add eax, ebx    ; compute next fib number
        xchg eax, ebx   ; swap eax and ebx
        mov [fib], eax  ; store next fib number
        loop label      ; loop until ecx is 0 (decrement ecx)

        mov eax, 1
        int 0x80

segment .bss
        fib resb 4      ; reserve 4 bytes for fib variable