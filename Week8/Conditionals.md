# Week8 - Conditional Instructions

## 1. Generate a sequence of even or odd numbers up to 20.
```assembly

section .text
        global _start

_start:
        mov eax, [value]        ; set eax to 0
        jmp even                ; jump to even, which creates a sequence of even integers up to 20

even:
        cmp eax, 20             ; subtract the value of 20 from eax, raise zero flag if equal
        je exit                 ; jump if zero flag is set

        add eax, 2              ; if zero flag not set, add 2 to eax
        mov [value], eax        ; copy value of eax to variable value to watch in gdb
        jmp even                ; jump to beginning of even

exit:
        mov eax, 1
        int 0x80

section .data
        value db 0
```

## 2. Find the largest number among the five integer numbers. Use initialized variables, and the output goes to the largest un-initialized variable.
```assembly
section .text
        global _start

_start:
        mov eax, [num1]
        cmp eax, [num2]          ; compare the first operand with the second operand
        jg label1                ; jmp if greater num1 > num2
        mov eax, [num2]          ; if num1 not greater than num2, assign num2 to eax
        jmp label1               ; jump to label1

label1:
        cmp eax, [num3]          ; compare eax to num3
        jg label2                ; if eax greater than num3, jump label2
        mov eax, [num3]          ; if eax not greater than num3, assign num3 to eax
        jmp label2               ; jump to label2

label2:
        cmp eax, [num4]          ; compare eax to num4
        jg label3                ; if eax greater than num4, jump to label3
        mov eax, [num4]          ; if eax not greater than num4, assign num4 to eax
        jmp label3               ; jump to label3

label3:
        cmp eax, [num5]          ; compare eax to num5
        jg exit                  ; if eax greater than num5, jump to exit
        mov eax, [num5]          ; if eax not greater than num5, assign num5 to eax
        jmp exit                 ; jump to exit

exit:
        mov [largest], eax       ; store value of eax to variable largest
        mov eax,1
        int 0x80

section .data
        num1 dd 7
        num2 dd 8
        num3 dd 99
        num4 dd 11
        num5 dd 121
        
segment .bss
        largest resb 1           ; reserve byte for uninitialized variable largest 
```
## What were your challenges in performing the lab (from design to the implementation phases)? 
The greatest challenge when performing the lab was developing the logic for the second problem. I needed to make sure to move the first variable to eax. Then, I compare eax to the second variable. If the sign flag and zero flag is not set (first operand is greater), then we jump to label1. If the sign flag or zero flag is set, that means that the second operand is greater, and so we set that second variable to eax and jump to label1. We continue in this process to compare the following variables. I am looking forward to being able to loop and compare in this way.


