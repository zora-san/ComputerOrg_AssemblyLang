# Lab: Assembly language for ARM processors

## Tasks
Perform the following tasks:  
1. Research and find out how different assembly language is for ARM processors compared to Intel processors.
2. The following assembly code is written for an Intel 32-bit processor. Convert the code for the ARM processor, and execute it.
3. Based on your research, will you be able to quantify the efficiency of running an assembly code on Intel & ARM processors?

$var4 = (var1+var2)*var3$

```assembly
section .text
    global _start

_start:
    mov eax,[var1]
    add eax,[var2]
    mov dl,[var3]
    mul dl
    mov [var4],eax
    
    mov eax,1
    int 0x80

section .data
    var1 DD 5 ; var1 is assigned 5
    var2 DD 2 ; var2 is assigned 2
    var3 DD 3 ; var3 is assigned 3
    
segment .bss
    var4 resb 1
```


## What do you think I should submit?
1. Share the source code and write down the commands used to make the source code executable.
```assembly
.section .text
    .global _start

_start:
    ldr r1, =var1      @ load var1 into r1
    ldr r2, [r1]        @ load the value at memory location var1 into r2
    ldr r3, =var2      @ load var2 into r3
    ldr r4, [r3]        @ load the value at memory location var2 into r4
    add r5, r2, r4      @ add var1 and var2, result in r5
    
    ldrb r6, =var3     @ load var3 into r6 (using byte load)
    ldrb r7, [r6]       @ load the value at memory location var3 into r7 (using byte load)
    mul r5, r5, r7      @ multiply var1+var2 by var3
    
    ldr r8, =var4      @ load var4 into r8
    str r5, [r8]        @ store the result into memory location var4
    
    mov r7, #1          @ prepare to make an exit syscall
    swi 0x0             @ exit program

.section .data
var1:    .word 5       @ var1 is assigned 5
var2:    .word 2       @ var2 is assigned 2
var3:    .byte 3       @ var3 is assigned 3

.section .bss
var4:    .skip 4       @ reserve 4 bytes for var4
```

3. Create and share a video that explains the process of assembling, linking, running, and debugging the source code.
