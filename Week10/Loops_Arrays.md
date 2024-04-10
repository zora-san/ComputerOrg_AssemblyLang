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
4. ```assembly
section .data
    array dd 10, 30, 20, 5     ; Array of integers with length 4

section .text
    global _start

_start:
    mov eax, [array]           ; Load the first element of the array into eax
    mov ebx, eax               ; Move the value of the first element to ebx (initial largest value)
    mov ecx, 3                 ; Counter for remaining elements (length of array - 1)

compare_loop:
    add eax, 4                 ; Move to the next element of the array
    cmp eax, [array + 16]      ; Compare the current element with the last element of the array
    jg update_largest          ; Jump if the current element is greater than the largest so far
    mov eax, [eax]             ; Move the value of the current element to eax
    loop compare_loop          ; Repeat the loop until all elements are compared

update_largest:
    mov [largest], bl          ; Store the largest element in a byte-sized memory location

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .bss
    largest resb 1              ; Reserve 1 byte for storing the largest element (byte size)
```

