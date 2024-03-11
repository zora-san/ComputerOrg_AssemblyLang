# W7 Logical Instructions
```assembly
SYS_WRITE equ 4
STDOUT equ 1
SYS_EXIT equ 1
PROC equ 0x80

section .text
        global _start

_start:
        mov eax, [result]
        xor eax, eax
        test eax, eax 

        jz is_zero              ; jump if zero flag is set 
                                ; if the zero flag is not set, print "Not zero" and exit the program
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, msg_nz
        mov edx, len2
        int PROC        

        jmp exit

is_zero:                        ; if zero flag is set, print "Number is zero" and exit the program

        mov eax, SYS_WRITE      
        mov ebx, STDOUT         
        mov ecx, msg_zero 
        mov edx, len1 
        int PROC

        jmp exit

exit:
        mov eax, SYS_EXIT  
        int PROC      

section .data
        result DD 789

        msg_zero DB 'Number is zero', 0x0a 
        len1 equ $ - msg_zero             

        msg_nz DB 'Not zero', 0x0a
        len2 equ $ - msg_nz
```

## What were your challenges in performing the lab (from design to the implementation phases)? 
The challenges I encountered included making sure I had no duplicate code. 
I also needed to make sure I was using int 0x80 to call the kernel after printing, to invoke the requested operation.

