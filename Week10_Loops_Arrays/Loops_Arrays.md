# Week 10: Loops and arrays

## Task

Perform the following tasks:

1. Generate a counter using an EBX register, debug, and explain your findings. Use the code written in the  [counter (optimized version) example](https://htmlpreview.github.io/?https://github.com/d-khan/assembly/blob/main/loops-arrays/Lecture.html).  
```assembly
section .text
        global _start

_start:
        mov ecx,10      
 label:
        inc ebx
        loop label

        mov eax,1
        int 0x80
```

2. Calculate the final number of the first 10 Fibonacci numbers starting from 0. The result should be equal to 55.
```assembly
section .text
        global _start

_start:
        mov ecx, 10     ; number of fibonacci numbers 
        mov eax, 0      ; assign 0, first fib number, to eax
        mov ebx, 1      ; assign 1, second fib number, to ebx
        mov [fib], eax  ; store 0 in fib variable
label:
        add eax, ebx    ; compute next fib number
        xchg eax, ebx   ; swap eax and ebx
        mov [fib], eax  ; store next fib number
        loop label      ; loop until ecx is 0 (decrement ecx)

        mov eax, 1
        int 0x80

segment .bss
        fib resb 4      ; reserve 4 bytes for fib variable
```

3. Define the array with length 4 and, type integer, find the largest element in the array. Use gdb to debug the code and verify that the code is working well and as per the requirement.
```assembly
section .text
        global _start

_start:
        mov ebx,array           ;load address of array into ebx
        mov eax,[ebx]           ;load first element of array into eax, current largest element
        mov ecx,3               ;counter for remaining elements (0-2, len of arr-1)
        jmp compare_loop        

compare_loop:
        add ebx,4               ;move to next element of array
        cmp eax,[ebx]           ;compare current element w/next element
        jge not_greater         ;jump if next element is not greater than current 
        mov eax,[ebx]           ;update largest element if next element is greater
        jmp update_largest

not_greater:
        loop compare_loop       ;repeat loop until all elements are compared

update_largest:
        mov [largest],eax       ;store largest element in mem location "largest"
        jmp exit
exit:
        mov eax,1
        int 0x80

section .data 
        array dd 32, 12, 98, 3

segment .bss
        largest resb 4
```
What were your challenges in performing the lab (from design to the implementation phases)?
My main challenge is navigating through different procedures. Similar to coding in any language, I make to have a some kind of return or jump in every procedure. This lab was helpful to understanding arrays and again reinforcing the fact that we cannot move from memory location to memory location, but only from one memory location to register, or register to register.

Now, I feel more comfortable using ecx + loop in conjunction as a counter! :)
