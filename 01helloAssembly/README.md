# 🛠️ ARM64 Hello World (macOS)

This is a minimal ARM64 Assembly program that prints a message to the terminal using the macOS syscall interface.

## 🧠 Concept

We use:

- `write` syscall to print a string to stdout
- `exit` syscall to terminate the program

All integer values are written in **Hexadecimal** for low-level clarity.

---

## 📂 File: `helloWorld.s`

```asm
// helloWorld.s
// ARM64 Assembly on macOS (Mach-O Format)
// Prints "Hello from Assembly" to stdout and exits
// All the immediates (integers) are written in Hexadecimal

.global _start
.align 2

_start:
    // write(1, "Hello from Assembly\n", 20)
    mov     x0, 0x1                  // x0 = stdout (fd = 1)
    adr     x1, helloassembly        // x1 = pointer to message
    mov     x2, 0x14                 // x2 = length = 20 bytes
    mov     x16, 0x4                 // x16 = syscall number (write)
    svc     0x80                     // invoke syscall

    // exit(0)
    mov     x0, 0x0                  // x0 = exit code
    mov     x16, 0x1                 // x16 = syscall number (exit)
    svc     0x80                     // invoke syscall

helloassembly:
    .ascii  "Hello from Assembly\n"
```
