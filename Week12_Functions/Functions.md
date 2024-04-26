# Week 12 Functions 

### Assign a number to a register or a variable, pass a number to the function and display the result, 'odd' or 'even'. The result should be displayed on the console. The function should check whether the number is an even or an odd number.

```assembly
section .text
        global _start

_start:
        push DWORD[var1]        ;push 98 to stack
        call _foobar            ;call function
        jmp exit                ;after function completes, exit

_foobar:
        push ebp                ;save ebp
        mov ebp,esp             ;top of stack stored in ebp

        mov eax,DWORD[ebp+8]    ;store 98 in eax
        call check              ;call another function to check if odd or even

        leave                   ;remove local var from stack, point esp to ret address, ebp returns to initial value
        ret                     ;pops ret address from stack, return control to _start

check:                          ;function to check if odd or even
        test eax,1              ;using test to check smallest bit
        jnz odd_                ;if 1, jump to odd_ procedure
        jz even_                ;if 0, jump to even_ procedure

odd_:                           ;function to store number in uninitialized var odd, and print odd to console                            
        mov [odd],eax           ;store number in uninitialized variable odd
        mov eax,4               ;sys_write
        mov ebx,1               ;std_out
        mov ecx,print_odd       ;memory address of string to ecx
        mov edx,len_odd         ;length (bytes) of string
        int 0x80                ;call kernel
        ret                     ;pops ret address from stack, return control to check function, specifically to the instruction after.
                                ;since there is no instruction after jz even_, control returns from check to its caller, _foobar

even_:                          ;function to store number in uninitialized var even, and print even to console
        mov [even],eax          ;store number in uninitialized variable even  
        mov eax,4               ;sys_write
        mov ebx,1               ;std_out
        mov ecx,print_even      ;memory address of to ecz
        mov edx,len_even        ;sets number of bytes to write
        int 0x80                ;call kernel
        ret                     ;pop return address, go to next instruction - control returns to _foobar 

exit:
        mov eax,1               ;sys_exit
        int 0x80                ;trigger system call

section .data
        var1 dd 98                                ;initialize variable 98 to push to stack
        print_odd db 'the number is odd', 0xa     ;string to print if odd
        len_odd equ $ - print_odd                 ;defines constant named len_odd, sets length to print_odd string
        print_even db 'the number is even', 0xa   ;string to print if even
        len_even equ $ - print_even               ;defines constant len_even, sets length to print_even

segment .bss
        odd resb 1              ;uninitialized variable odd
        even resb 1             ;uninitialized variable even
```
### What were your challenges in performing the lab (from design to the implementation phases)?
The challenges I experienced were relating to the usage of ret and leave, and where exactly I would be returning to. When calling leave, the local variables are removed from the stack, the register esp will point to the return address, and register ebp will return to its initial value. The ret instruction actually pops the return address off the stack and returns control from a function to the calling program.
