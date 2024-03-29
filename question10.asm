section .data           ;for declaring initialised data
    A db 0              ;assigns value 0 to variable type DB (8-bits), named A
    B db 0              ;assigns value 0 to variable type DB (8-bits), named B

section .text
    global _start       ;labels _start as the starting point at runtime

_start:                 ;main routine, the entry point, known by linker due to above declaration
    mov eax, A          ;move A to eax register
    mov ebx, B          ;move B to ebx register
    mov ecx, 1          ;use ecx as i, the counter, increase this value to increase loop times

    cmp ecx, 0          ;compare if counter is equal to 0
    jg forLoop          ;call loop sub-routine if counter is not 0

    jmp _exit           ;exit program if previous condition is not met

forLoop:                ;to complete program functionality
    add eax, ecx        ;increase stored value in eax (A), by i

    add edx, ecx        ;add counter value twice to edx
    add edx, ecx
    add ebx, edx        ;add multiplied value to B

    dec ecx             ;decrement counter by 1, before returning

_exit:                  ;exit routine, called at the end of _start
    mov eax, 1
    mov ebx, 0
    int 0x80
