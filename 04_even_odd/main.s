.text
.global _main
.p2align 2
_main:
                ldr     x3, =123456789        ; Load test number
                ands    xzr, x3, #1           ; Check LSB, set flags

                adrp    x4, eve@PAGE          ; Address of "Even"
                add     x4, x4, eve@PAGEOFF

                adrp    x5, odd@PAGE          ; Address of "Odd"
                add     x5, x5, odd@PAGEOFF

                mov     x6, #evel             ; Length of "Even\n"
                mov     x7, #oddl             ; Length of "Odd\n"

                csel    x1, x4, x5, eq        ; Select string
                csel    x2, x6, x7, eq        ; Select length

                mov     x0, #1                ; stdout
                mov     x16, #4               ; write syscall
                svc     0

                mov     x0, #0                ; exit code
                mov     x16, #1               ; exit syscall
                svc     0


.section __TEXT, __const
eve:            .ascii  "Even\n"
evel=           . - eve

odd:            .ascii  "Odd\n"
oddl=           . - odd
