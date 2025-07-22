// All the immediates(integers) are written in HexaDecimal

.global _start       // Define entry point
.align 2             // Align code on a 4-byte boundary (2^2 = 4)

_start:
        
        // Calling the Functions
        b print      // Branch to the print function
        b exit       // Branch to the exit function


// This is a function
print:
        mov x0, 0x1          // File descriptor 1 = stdout
        adr x1, text         // Load address of the string into x1
        mov x2, 0x25         // Number of bytes to write (37 bytes)
        mov x16, 0x4         // macOS syscall number for write
        svc 0x80             // Trigger syscall


// This is a function
exit:
        mov x0, 0x0          // Return code 0
        mov x16, 0x1         // macOS syscall number for exit
        svc 0x80             // Trigger syscall


text:
        .ascii "Functions...Functions...Functions...\n"
