; Assign three integers to the variables x, y, and z and pass on the function name of your choice. 
; The function task is to add three variables and assign the result to the 'result' variable.
; Make sure the function returns the result variable and deallocates the memory used by the function when it returns
section .text
        global _start

_start:
        push DWORD[x]                   ;push x (7) to stack
        push DWORD[y]                   ;push y (8) to stack
        push DWORD[z]                   ;push z (9) to stack
        call _foobar                    ;call function
        jmp exit                        ;after ret from function, exit

_foobar:                                ;purpose is to add 3 variables
        push ebp                        ;preserve ebp across calls
        mov ebp,esp                     ;point ebp to stack

        mov eax, DWORD[ebp+16]          ;move x to eax
        mov edx, DWORD[ebp+12]          ;move y to edx
        lea eax, DWORD[eax+edx]         ;add x and y, store in eax (15)
        mov edx, DWORD[ebp+8]           ;move z to edx
        lea eax, DWORD[eax+edx]         ;add z to x and y (24), store in eax
        mov [result],eax                ;store in uninitialized variable result

        leave                           ;remove local var from stack, reg esp points to ret address, ebp returns to initial value
        ret                             ;pop return address from stack, return control to _start        
exit:
        mov eax,1                       ;sys_exit
        int 0x80                        ;call kernel

section .data
        x dd 7                          ;initialize variable x to 7
        y dd 8                          ;initialize variable y to 8
        z dd 9                          ;initialize variable z to 9

segment .bss            
        result resb 1                   ;create uninitialized variable result
