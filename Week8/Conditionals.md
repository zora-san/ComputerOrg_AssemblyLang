# Week8 - Conditional Instructions

```assembly
section .text
        global _start

_start:
        mov eax,[num1]
        cmp eax,[num2]          ; compare the first operand with the second operand
        jg label1               ; jmp if greater num1 > num2
        mov eax,[num2]          ; if num1 not greater than num2, assign num2 to eax
        jmp label1              ; jump to label1

label1:
        cmp eax,[num3]          ; compare eax to num3
        jg label2               ; if eax greater than num3, jump label2
        mov eax,[num3]          ; if eax not greater than num3, assign num3 to eax
        jmp label2              ; jump to label2

label2:
        cmp eax,[num4]          ; compare eax to num4
        jg label3               ; if eax greater than num4, jump to label3
        mov eax,[num4]          ; if eax not greater than num4, assign num4 to eax
        jmp label3              ; jump to label3

label3:
        cmp eax,[num5]          ; compare eax to num5
        jg exit                 ; if eax greater than num5, jump to exit
        mov eax, [num5]         ; if eax not greater than num5, assign num5 to eax
        jmp exit                ; jump to exit

exit:
        mov [largest],eax
        mov eax,1
        int 0x80

section .data
        num1 dd 7
        num2 dd 8
        num3 dd 99
        num4 dd 11
        num5 dd 121
        
segment .bss
        largest resb 2
```
