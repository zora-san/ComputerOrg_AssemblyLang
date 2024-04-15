section .text
        global _start

_start:
        mov ecx,5               ;counter
        mov eax,[factorial]     
        jmp multiply
        jmp exit

multiply:
        imul eax,ecx
        dec ecx
        jnz multiply
        jmp exit

exit:
        mov [result],eax
        mov eax,1
        int 0x80

section .data
        factorial dd 6

segment .bss
        result resb 1
