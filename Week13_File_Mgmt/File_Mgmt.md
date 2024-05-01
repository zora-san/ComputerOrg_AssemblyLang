
## Week 13 File Management

```assembly
section .data
        filename db 'quotes.txt', 0h
        contents db 'To be, or not to be, that is the question.',0xa,0xa,'A fool thinks himself to be wise, but a wise man knows himself to be a fool'
        len equ $ - contents
        contents1 db 0xa,0xa,'Better three hours too soon than a minute too late.',0xa,0xa,'No legacy is so rich as honesty.',0xa
        len1 equ $ - contents1

section .text
        global _start

_start:
        mov eax,8               ;sys_creat
        mov ebx,filename        ;filename
        mov ecx,0711o           ;rwxr-x--x
        int 0x80                ;syscall

        mov eax,5               ;sys_open
        mov ebx,filename        ;filename
        mov ecx,1               ;write only
        mov edx,0777o           ;rwxrwxrwx
        int 0x80                ;syscall

        mov [fd_out],eax        ;save file descriptor

        mov eax,4               ;sys_write
        mov ebx,[fd_out]        ;file descriptor
        mov ecx,contents        ;buffer
        mov edx,len             ;length of buffer
        int 0x80                ;syscall

        mov eax,19              ;sys_lseek
        mov ebx,[fd_out]        ;file descriptor
        mov ecx,0               ;offset 
        mov edx,2               ;SEEK_END
        int 0x80                ;syscall

        mov eax,4               ;sys_write
        mov ebx,[fd_out]        ;file descriptor
        mov ecx,contents1       ;buffer
        mov edx,len1            ;length of buffer
        int 0x80                ;syscall

        mov eax,6               ;sys_close
        mov ebx,[fd_out]        ;file descriptor
        int 0x80                ;syscall

        mov eax,1               ;sys_exit
        int 0x80                ;syscall

segment .bss
        fd_out resb 1           ;file descriptor  
```
```txt
To be, or not to be, that is the question.

A fool thinks himself to be wise, but a wise man knows himself to be a fool

Better three hours too soon than a minute too late.

No legacy is so rich as honesty.
```
## What were your challenges in performing the lab (from design to the implementation phases)?
The challenges that I had were related to remembering to store the file descriptor returned by sys_open system call into the memory location labeled by fd_out, and generally memorizing the sys command numbers.
