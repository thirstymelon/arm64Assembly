.text
.global _main
.p2align 2

_main:
                mov     x0,     #1

                adrp    x1,     ques@PAGE
                add     x1, x1, ques @PAGEOFF
                mov     x2,     #quesLen
                bl      write                          ; print prompt

                mov     x0,     #0

                adrp    x1,     buffer@PAGE
                add     x1, x1, buffer@PAGEOFF
                mov     x2,     #64
                bl      read                           ; read user input

                mov     x19,    x0                     ; save bytes read (length)

                mov     x0,     #1
                adrp    x1,     msg@PAGE
                add     x1, x1, msg@PAGEOFF
                mov     x2,     #msgLen
                bl      write                          ; print "You entered: "

                adrp    x1,     buffer@PAGE
                add     x1, x1, buffer@PAGEOFF
                mov     x2,     x19
                mov     x0,     #1
                bl      write                          ; echo input

                b       exit


write:                                                  ; write(fd=x0, buf=x1, len=x2)
                movz    x16, 0x2000, lsl #16
                movk    x16, 4
                svc     0
                ret


read:                                                   ; read(fd=x0, buf=x1, len=x2)
                movz    x16, 0x2000, lsl #16
                movk    x16, 3
                svc     0
                ret


exit:
                mov     x0,     #0
                movz    x16,    0x2000,     lsl #16
                movk    x16,    0x0001
                svc     0


.section __TEXT, __const
ques:           .ascii  "Enter something: "
quesLen=        . - ques

msg:            .ascii  "You entered: "
msgLen=         . - msg


.bss
buffer:         .skip   64
