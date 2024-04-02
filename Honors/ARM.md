# Lab: Assembly language for ARM processors

## Tasks
Perform the following tasks:  
1. Research and find out how different assembly language is for ARM processors compared to Intel processors.
2. The following assembly code is written for an Intel 32-bit processor. Convert the code for the ARM processor, and execute it.
3. Based on your research, will you be able to quantify the efficiency of running an assembly code on Intel & ARM processors?


**1. How different is assembly language for ARM processors compared to Intel processors?**

Assembly language for ARM processors differs significantly from that of Intel processors due to differences in instruction set architecture (ISA), register usage, addressing modes, and syntax.

1. **Instruction Set Architecture (ISA)**:
   - ARM processors use a RISC (Reduced Instruction Set Computing) architecture, while Intel processors use a CISC (Complex Instruction Set Computing) architecture.
   - RISC architectures, such as ARM, typically have simpler and more uniform instructions compared to CISC architectures like Intel.
   - ARM instructions are designed to perform specific tasks efficiently, resulting in a streamlined instruction set.
   
2. **Register Usage**:
   - ARM processors have a smaller number of general-purpose registers compared to Intel processors.
   - ARM assembly language often uses register names like R0, R1, etc., while Intel assembly language uses names like EAX, EBX, etc.
   - Register conventions and usage may differ between ARM and Intel assembly languages.

3. **Addressing Modes**:
   - ARM assembly language supports fewer addressing modes compared to Intel assembly language.
   - ARM assembly often uses load/store architecture, where operations are performed between registers rather than directly on memory.
   - Addressing modes in ARM assembly may be more restricted compared to Intel assembly.

4. **Syntax**:
   - ARM assembly language syntax differs from Intel assembly language syntax.
   - Instructions and directives in ARM assembly may have different names and formats compared to Intel assembly.
   - Comments and formatting conventions may also differ between ARM and Intel assembly languages.

To write assembly code for ARM processors, one must understand these differences and adhere to ARM's instruction set architecture and syntax conventions. Additionally, assembly code written for Intel processors cannot be directly ported to ARM processors without significant modifications due to these differences in architecture and instruction set.

**2. Convert the Intel 32-bit processor assembly code to ARM processor assembly code, and execute.**
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

**Share the source code and write down the commands used to make the source code executable.**
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
**3. Based on your research, will you be able to quantify the efficiency of running an assembly code on Intel & ARM processors?**

Quantifying the efficiency of running assembly code on Intel and ARM processors can be challenging due to several factors:

1. **Architecture Differences**:
   - Intel and ARM processors have different architectures, including instruction set architecture (ISA), register layout, and pipeline design.
   - The efficiency of running assembly code depends on how well the code utilizes the specific features and optimizations of each architecture.

2. **Performance Characteristics**:
   - Intel processors are often designed for high-performance computing tasks and may have higher clock speeds, larger cache sizes, and more advanced instruction sets.
   - ARM processors, on the other hand, are commonly used in mobile devices, IoT devices, and embedded systems, prioritizing power efficiency over raw performance.

3. **Optimization Strategies**:
   - Assembly code can be optimized differently for Intel and ARM processors to take advantage of their respective architectures.
   - Optimization techniques may include instruction selection, register allocation, loop unrolling, and memory access optimizations tailored to each processor architecture.

4. **Benchmarking and Profiling**:
   - Benchmarking tools can be used to measure the performance of assembly code on Intel and ARM processors under different workloads.
   - Profiling tools can provide insights into the bottlenecks and performance hotspots in the code execution.

In conclusion, while it is possible to evaluate the performance of assembly code on Intel and ARM processors using benchmarking and profiling techniques, the efficiency can vary significantly depending on the specific workload, optimization strategies, and architecture characteristics. Direct quantification of efficiency may not always be straightforward and may require careful analysis and experimentation.

**Create and share a video that explains the process of assembling, linking, running, and debugging the source code.**
