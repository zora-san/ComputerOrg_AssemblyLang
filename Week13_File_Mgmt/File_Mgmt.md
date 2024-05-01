
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
        mov ebx,filename
        mov ecx,0711o
        int 0x80

        mov eax,5               ;sys_open
        mov ebx,filename
        mov ecx,1               ;write only
        mov edx,0777o
        int 0x80

        mov [fd_out],eax

        mov eax,4               ;sys_write
        mov ebx,[fd_out]
        mov ecx,contents
        mov edx,len
        int 0x80

        mov eax,19              ;sys_lseek
        mov ebx,[fd_out]
        mov ecx,0
        mov edx,2
        int 0x80

        mov eax,4
        mov ebx,[fd_out]
        mov ecx,contents1
        mov edx,len1
        int 0x80        

        mov eax,6               ;sys_close
        mov ebx,[fd_out]
        int 0x80

        mov eax,1
        int 0x80

segment .bss
        fd_out resb 1
```
```txt
To be, or not to be, that is the question.

A fool thinks himself to be wise, but a wise man knows himself to be a fool

Better three hours too soon than a minute too late.

No legacy is so rich as honesty.
```
## What were your challenges in performing the lab (from design to the implementation phases)?
The challenges that I had were related to remembering to save the file descriptor, and generally remembering the numbers as it relates to the system command.
