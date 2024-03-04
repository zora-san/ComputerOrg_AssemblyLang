# W5B - Variables

```assembly

section .text
        global _start

_start:
        mov eax, [var1]
        mov ebx, [var2]
        add eax, ebx
        mov [result], eax

        mov eax, 1
        int 0x80

section .bss
        result resb 1

section .data
var1 dd 10
var2 dd 15
