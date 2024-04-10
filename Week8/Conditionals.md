# W8 - Conditional Instructions

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
        mov ecx, 5            ; counter for remaining comparisons (6 numbers, so 5 comparisons)
        mov ebx, num1         ; load address of num1 into ebx
        mov eax, [ebx]        ; load the first number into eax (num1)

compare_loop:
        add ebx, 4            ; move to the next number
        cmp eax, [ebx]        ; compare the current largest number with the next number
        jge skip_update       ; jump if the current largest number is greater than or equal to the next number
        mov eax, [ebx]        ; update the largest number if the next number is larger

skip_update:
        loop compare_loop     ; repeat the loop until all numbers are compared

        mov [largest], eax    ; store largest num in memory location "largest"

        mov eax, 1
        int 0x80

section .data
        num1 dd 30
        num2 dd 20
        num3 dd 10
        num4 dd 40
        num5 dd 25
        num6 dd 15

section .bss
        largest resb 1         ; reserve 4 bytes for storing the largest number
```
## What were your challenges in performing the lab (from design to the implementation phases)? 
The greatest challenge when performing the lab was developing the logic for the second problem. I needed to make sure to move the first variable to eax. Then, I compare eax to the second variable. If the sign flag and zero flag is not set (first operand is greater), then we jump to label1. If the sign flag or zero flag is set, that means that the second operand is greater, and so we set that second variable to eax and jump to label1. We continue in this process to compare the following variables. I am looking forward to being able to loop and compare in this way.


