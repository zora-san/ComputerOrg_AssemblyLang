# W5B - Variables 

```assembly

section .text                
        global _start        ;  This will be the entry point of the program

_start:                      ;  Entry point
        mov eax, [var1]      ;  Copy the value of var1 into the eax register
        mov ebx, [var2]      ;  Copy the value of var2 into the ebx register
        add eax, ebx         ;  Add the value of ebx to eax, store in eax
        mov [result], eax    ;  Copy the value of eax register into memory location of result

        mov eax, 1           ;  sys_exit 
        int 0x80             ;  call kernel

section .bss                 ;  Section for uninitialized data
        result resb 1        ;  Reserve 1 byte for result

section .data                ;  Start of the section for initialized data
var1 DD 10                   ;  Declare var1 as doubleword, initialize to 10 
var2 DD 15                   ;  Declare var2 as doubleword, initialize to 15
