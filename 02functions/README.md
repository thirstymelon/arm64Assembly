# 🧠 ARM64 Assembly: Using Functions on Apple Silicon (macOS)

This example demonstrates how to define and call **functions** in ARM64 Assembly on Apple Silicon macOS using **macOS system calls** directly (without using C or external libraries). The program prints a string and then exits cleanly.

---

## 📄 Full Source Code

```assembly
// All the immediates (integers) are written in Hexadecimal

.global _start       // Declare the global entry point for the linker
.align 2             // Ensure 4-byte alignment (2^2 = 4 bytes)

_start:
        // Calling the Functions
        b print      // Branch to the 'print' function
        b exit       // Branch to the 'exit' function

// This is a function
print:
        mov x0, 0x1          // File descriptor 1 (stdout)
        adr x1, text         // Load address of the string into x1
        mov x2, 0x25         // Number of bytes to write (0x25 = 37)
        mov x16, 0x4         // macOS syscall number for write
        svc 0x80             // Trigger syscall

// This is a function
exit:
        mov x0, 0x0          // Return code (0 = success)
        mov x16, 0x1         // macOS syscall number for exit
        svc 0x80             // Trigger syscall

text:
        .ascii "Functions...Functions...Functions...\n"
```

---

## 🧠 Explanation (Line-by-Line)

### Global Declarations

- `.global _start`  
  Declares `_start` as the entry point so that the linker knows where to begin execution.

- `.align 2`  
  Aligns the following code to a 4-byte boundary (2^2 = 4), which is the minimum requirement for ARM64 instructions.

---

### `_start` (Main Function)

```assembly
_start:
        b print      // Branch (jump) to the 'print' label (function)
        b exit       // After print completes, branch to 'exit'
```

- `b print`: Calls the `print` function using a direct branch (non-linking).
- `b exit`: Calls the `exit` function. Note: This instruction is immediately after `b print` and not conditionally executed, so `exit` will execute after `print` returns.

---

### `print` Function (Writing to stdout)

```assembly
print:
        mov x0, 0x1          // File descriptor (1 = stdout)
        adr x1, text         // Load memory address of string into x1
        mov x2, 0x25         // Number of bytes to write (37)
        mov x16, 0x4         // Syscall number for write (macOS)
        svc 0x80             // Make the syscall
```

This function directly prints the message stored at `text` to the terminal.

---

### `exit` Function (Graceful Termination)

```assembly
exit:
        mov x0, 0x0          // Exit status (0 = success)
        mov x16, 0x1         // Syscall number for exit (macOS)
        svc 0x80             // Make the syscall
```

Terminates the program with an exit code of 0.

---

### `text` (Message)

```assembly
text:
        .ascii "Functions...Functions...Functions...\n"
```

Stores the string to be printed. `.ascii` does not include a null terminator (`\0`) — it's not needed for system calls like `write`.

---

## 🚀 How to Run on macOS

1. Save the code to a file, e.g. `functions.s`
2. Assemble and link:

```bash
as -o functions.o functions.s
ld -o functions functions.o -lSystem
```

3. Run:

```bash
./functions
```

---

## 📚 License

This project is licensed under the [MIT License](LICENSE).
