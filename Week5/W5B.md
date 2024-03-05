# W5b - Variables 

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
```

What were your challenges in performing the lab (from design to the implementation phases)?

The challenges that I experienced working with the lab related to allocating storage space for initialized data. Originally I believed that I could initialize var1 with DB and assign the value 10 to it. It turns out that I could not - copying the value of var1 into the eax register was problematic and returned a large random value when compiled with GDB. This is because the eax/ebx registers are both 32 bit respectively. DB is used to declare a byte-sized variable which is only 8 bits. Once I changed DB to DD, var1 is declared as a doubleword-sized variable of size 32 bits to successfully match the size of the eax and ebx registers.

This taught me the importance of memory allocation, something that is extremely important in assembly. Of course, we know that assembly, unlike high-level languages, doesn't possess automatic memory management so we must correctly and manually allocate memory for the data we use. We do this with static allocation and dynamic allocation. Learning about properly managing memory helps make me become a more effective programmer.
