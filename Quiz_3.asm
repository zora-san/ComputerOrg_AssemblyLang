;Write an Assembly code that calculates a factorial of a pre-defined number.  
;For example, set the variable to any number and then calculate the factorial of a set number.
;Let's say the variable x = 5. The factorial of 5 would be 5x4x3x2x1 = 120. 
;The factorial of 6 would be 6x5x4x3x2x1 = 720 

section .text
        global _start

_start:
        mov ecx,5               ;counter
        mov eax,[factorial]     ;store 6 in eax
        jmp multiply            ;jmp to multiply procedure

multiply:                        
        imul eax,ecx            ;multiply ecx with 6, store in eax 
        dec ecx                 ;decrease ecx
        jnz multiply            ;loop back if not zero
        jmp exit                ;when zero, exit

exit:
        mov [result],eax        ;store value in uninitialized variable result
        mov eax,1               ;sys_exit
        int 0x80                ;call kernel

section .data                
        factorial dd 6          ;create variable for factorial number

segment .bss
        result resb 1           ;uninitialized variable to store final value
