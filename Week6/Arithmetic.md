
# W6 Arithmetic.asm   

```assembly
section .text
        global _start

_start:
        ;  step 1: result = -var1 * 10
        mov eax, [var1]         ;  step 1: copy value of var1 to eax: 7
        imul eax, 10            ;  multiply 10 by value in eax: 70
        neg eax                 ;  make eax signed: -70
        mov [result], eax       ;  copy the value of eax to the value of result: -70

        ;  step 2: result = var1 + var2 + var3 + var4
        mov eax, [var1]         ;  step 2: copy the value of var1 to eax: 7     
        add eax, [var2]         ;  add the value of var2 to eax: 17
        add eax, [var3]         ;  add the value of var3 to eax: 26
        add eax, [var4]         ;  add the value of var4 to eax: 36
        mov [result], eax       ;  copy the value of ebx to the value of result: 36 

        ;  step 3: result = (-var1 * var2) + var3
        mov eax, [var1]         ;  step 3: copy the value of var1 to eax: 7
        imul eax, [var2]        ;  multiply value of var2 by value in eax: 70
        neg eax                 ;  make eax signed: -70
        add eax, [var3]         ;  add the value of var3 to value in eax: -61
        mov [result], eax       ;  copy the value of eax to the value of result: -61
  
        ;  step 4: result = (var1 * 2) / (var2 - 3)
        mov eax, [var1]         ;  step 4: copy the value of var 1 to eax: 7
        imul eax, 2             ;  multiply 2 by value in eax: 14
        mov ebx, [var2]         ;  copy the value of var2 in ebx: 10
        sub ebx, 3              ;  subtract 3 from the value in ebx: 7
        idiv ebx                ;  divide the value of eax by the value in ebx: 14/7 = 2
        mov [result], eax       ;  copy the value of eax into value of result 

        mov eax, 1              ;  sys_exit     
        int 0x80                ;  call kernel

section .bss
        result resb 4           ;  reserve 4 bytes for result

section .data           
var1 DD 7                       ;  initialize doubleword var1 to 7
var2 DD 10                      ;  initialize doubleword var2 to 10
var3 DD 9                       ;  initialize doubleword var3 to 9
var4 DD 10                      ;  initialize doubleword var4 to 10

```assembly
