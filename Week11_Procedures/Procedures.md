# Week 11 Procedures

Generate English uppercase characters from A to Z. After every character, there must be a line feed. Use procedures and loops to optimize the code. Do not use gdb debugger. The executable file will run directly on the terminal. See the output below.

```assembly
section .text
        global _start

_start:
        mov eax,65              ;store 65 (ascii 'A' to eax)
        push eax                ;65 is saved in the stack
        mov [result],eax        ;store eax to uninitialized variable res
        jmp output              ;if less than 91, jump to output to print

alpha:
        pop eax                 ;65 is removed from stack and saved in eax 
        inc eax                 ;eax is 66
        push eax                ;push eax to stack
        mov [result],eax        ;store eax in result
        cmp eax,91              ;cmp eax to 91
        jl output       
        call exit
  
output:
        mov ecx,result          ;move address of result to ecx          
        mov edx,1               ;output length
        mov ebx,1               ;stdout
        mov eax,4               ;system call (sys_write)
        int 0x80                ;call kernel

        mov ecx,line            ;print newline
        mov ebx,1
        mov edx,1
        mov eax,4
        int 0x80                ;interrupt kernel

        jmp alpha               ;jmp to get next letter
exit:
        mov eax,1
        int 0x80

segment .bss
        result resb 1           ;allocate memory for  uninitialized variable result

section .data
        line dd 10              ;variable line used to print newline
```

## What were your challenges in performing the lab (from design to the implementation phases)?
The challenges I dealt with were deciding when to use call versus using a conditions instruction. I realized I couldn't call output at the top and return at the end of output, otherwise I would not be able to do the conditional comparision to ASCII value 91 later on.
