# W5B - Variables

```assembly

section .text
        global _start

_start:
        mov eax, [var1]
        add eax, [var2]
        mov [result], eax

        mov eax, 1
        int 0x80

section .bss
        result resb 4

section .data
var1 DD 10
var2 DD 15
