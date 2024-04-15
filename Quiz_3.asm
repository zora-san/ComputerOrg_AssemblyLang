Write an Assembly code that calculates a factorial of a pre-defined number.  
For example, set the variable to any number and then calculate the factorial of a set number.
Let's say the variable x = 5. The factorial of 5 would be 5x4x3x2x1 = 120. 
The factorial of 6 would be 6x5x4x3x2x1 = 720 

```assembly
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
```
