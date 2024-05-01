
## Week 13 File Management

```assembly
section .data
        filename db 'quotes.txt', 0h
        contents db 'To be, or not to be, that is the question.',10,10,'A fool thinks himself to be wise, but a wise man knows himself to be a fool', 0h
        len equ $ - contents
        contents1 db 'Better three hours too soon than a minute too late.',10,10,'No legacy is so rich as honesty.',0h
        len1 equ $ - contents1

section .text
        global _start

_start:
        mov eax,8               ;sys_creat
        mov ebx,filename        ;filename
        mov ecx,0711o           ;permissions
        int 0x80

        mov eax,5               ;sys_open
        mov ebx,filename        ;filename   
        mov ecx,1               ;write only
        mov edx,0777o           ;permissions
        int 0x80

        mov [fd_out],eax        ;save file descriptor

        mov eax,4               ;sys_write
        mov ebx,[fd_out]        ;file descriptor
        mov ecx,contents        ;contents to write  
        mov edx,len             ;length of contents
        int 0x80

        mov eax,19              ;sys_lseek
        mov ebx,[fd_out]        ;file descriptor
        xor ecx,ecx             ;offset is 0
        mov edx,2               ;seek_end
        int 0x80

        mov eax,4               ;sys_write
        mov ebx,[fd_out]        ;file descriptor 
        mov ecx,contents1       ;contents to write
        mov edx,len1            ;length of contents
        int 0x80

        mov eax,6               ;sys_close
        mov ebx,[fd_out]        ;file descriptor
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
