.global _start
.align 2

_start:
                mov     x0,     0x1                 ; write: fd = stdout

                adr     x1,     msg                 ; pointer to message
                mov     x2,     0x14                ; message length
                movz    x16,    0x2000, lsl #16     ; macOS syscall base
                movk    x16,    0x4                 ; syscall: write
                svc     0

                mov     x0,     0x0                 ; exit status = 0
                movz    x16,    0x2000, lsl #16     ; macOS syscall base
                movk    x16,    0x1                 ; syscall: exit
                svc     0

msg:            .ascii  "Hello from Assembly\n"     ; output string
