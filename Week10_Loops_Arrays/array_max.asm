; 3. Define the array with length 4 and, type integer, find the largest element in the array. 
; Use gdb to debug the code and verify that the code is working well and as per the requirement.

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