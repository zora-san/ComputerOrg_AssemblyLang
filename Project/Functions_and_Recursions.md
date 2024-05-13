# Project 2

Analyze the performance of function and recursion

## run.sh

```bash
 #!/bin/bash
nasm -f elf ./$1.asm
ld -m elf_i386 ./$1.o -o ./$1 
./$1

{ time ./recursion; } >/dev/null 2>> counter_rec.txt
{ time ./function; } >/dev/null 2>> counter_fun.txt
```
## Output to display

- There should be two text files for this task. counter_fun.txt and counter_rec.txt
- Each file should have a time command output and a counter.
  
## counter_fun.txt
```
real    0m0.001s
user    0m0.001s
sys     0m0.000s
```
## counter_rec.txt
```
real    0m0.011s
user    0m0.007s
sys     0m0.004s
```
## function.asm 

Write a function (count) to perform the following task.

- Generate a counter (let's say 20,000) using the function. The function should have one integer argument (in this example, 20,000).
- Calculate the execution time of your code by using the [time command](https://en.wikipedia.org/wiki/Time_(Unix)) and redirect the output to the counter_fun.txt file.
- Append the counter in an already created text file (counter_fun.txt).

```assembly
; function.asm 

section .text
        global _start             

_start:
        mov ecx,0
        jmp increase

increase:
        inc ecx
        cmp ecx,690999
        jne increase

        jmp exit
exit:
        mov eax,1
        int 0x80
```

## recursion.asm

Use recursion to generate the same counter which you did above. [Check what is recursion](https://en.wikipedia.org/wiki/Recursion_(computer_science)) 

- Use the same function (count), but you will repeatedly call the same function (recursion) to generate the counter.
- Calculate the execution time of your code by using the [time command](https://en.wikipedia.org/wiki/Time_(Unix)) and redirect the output to the counter_rec.txt file.
- Append the counter in an already created text file (counter_rec.txt).

```assembly
; recursion.asm

section .text
        global _start

_start:
        push 0          ; push 0 to stack
        call recursive  ; call recursive function
        mov eax,ebx     ; move ebx to eax
        mov eax,1       ; exit syscall
        int 0x80        ; call kernel

recursive:
        push ebp        ; push ebp to stack
        mov ebp,esp     ; move esp to ebp

        mov eax,[ebp+8] ; move ebp+8 to eax
        cmp eax,690999   ; compare eax to large counter
        jge end         ; if eax >= large counter jump to end
        inc eax         ; increment eax
        push eax        ; push eax to the stack to save
        call recursive  ; call recursive function
        mov eax,[ebp+8] ; move ebp+8 to eax to restore the value to eax

        leave           ; leave the function and restore stack
        ret             ; return from the function

end:
        mov esp,ebp     ; move ebp to esp
        pop ebp         ; pop ebp from stack
        ret             ; return from the function
```

# Compare both the time and discuss which code (function or recursion) runs efficiently and why.
The difference in speed between the recursive and the function versions of the programs is due to the nature of recursion itself. Recursion involves a function calling itself, which means that for each recursive call, a new stack frame is created to store the function's local variables and return address. This process of creating and destroying stack frames takes time.

ON the other hand, the counter function version of my program uses a loop to perform the same operation. Loops do not involve function calls, so no new stack frames are created. This makes loops faster than recursion in most cases.

Generally speaking, recursion can provide a more elegant and simpler solution for certain problems, but it often comes with a performance cost compared to iterative solutions.
