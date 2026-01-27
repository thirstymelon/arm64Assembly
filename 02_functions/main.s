.global _start
.align 2

_start:
                b       print                           ; call print routine
                b       exit                            ; terminate program


print:
                mov     x0, 0x1                         ; stdout
                adr     x1, text                        ; message address
                mov     x2, 0x25                        ; message length
                movz    x16, 0x2000, lsl #16            ; macOS syscall base
                movk    x16, 0x4                        ; syscall: write
                svc     0


exit:
                mov     x0, 0x0                         ; exit status
                movz    x16, 0x2000, lsl #16            ; macOS syscall base
                movk    x16, 0x1                        ; syscall: exit
                svc     0


text:           .ascii  "Functions...Functions...Functions...\n"  ; output string
