# Lab: Assembly language for ARM processors

## Tasks
Perform the following tasks:  
1. Research and find out how different assembly language is for ARM processors compared to Intel processors.
2. The following assembly code is written for an Intel 32-bit processor. Convert the code for the ARM processor, and execute it.
3. Based on your research, will you be able to quantify the efficiency of running an assembly code on Intel & ARM processors?
Assembly language for ARM processors differs from that of Intel processors in several ways, including instruction set architecture, register usage, addressing modes, and syntax. Here are some key differences:

**Instruction Set Architecture (ISA):**
- ARM processors use a RISC (Reduced Instruction Set Computing) architecture, while Intel processors use a CISC (Complex Instruction Set Computing) architecture.
- ARM instructions are typically simpler and more uniform compared to Intel instructions.

**Register Usage:**
- ARM processors have a smaller number of general-purpose registers compared to Intel processors.
- ARM assembly language often uses register names like R0, R1, etc., while Intel assembly language uses names like EAX, EBX, etc.

**Addressing Modes:**
- ARM assembly language supports fewer addressing modes compared to Intel assembly language.
- ARM assembly often uses load/store architecture, where operations are performed between registers rather than directly on memory.

**Syntax:**
- ARM assembly language syntax differs from Intel assembly language syntax. For example, instructions and directives may have different names and formats.

To convert assembly code from Intel to ARM and execute it, you would need to rewrite the code using ARM assembly language syntax and adhere to ARM's instruction set architecture. Once the code is written, you can assemble and execute it on an ARM-based platform, such as a Raspberry Pi or an ARM development board.

Regarding quantifying the efficiency of running assembly code on Intel and ARM processors, it's challenging to make a direct comparison due to the differences in architecture, performance characteristics, and optimization strategies employed by each processor. The efficiency of running assembly code depends on various factors, including the specific instructions used, the optimization level of the compiler/assembler, the memory hierarchy, and the workload characteristics.

In general, both Intel and ARM processors can execute assembly code efficiently when properly optimized. However, the performance characteristics and optimization techniques may differ between the two architectures. Benchmarking and profiling are common techniques used to evaluate the performance of assembly code on different processors.


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
