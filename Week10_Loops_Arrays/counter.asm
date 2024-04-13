; 1. Generate a counter using an EBX register, debug, and explain your findings. 
; Use the code written in the counter (optimized version) example.

section .text
        global _start

_start:
        mov ecx,10      
 label:
        inc ebx
        loop label

        mov eax,1
        int 0x80