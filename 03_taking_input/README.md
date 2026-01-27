⸻

🧾 ARM64 Assembly: Taking User Input (macOS)

This program demonstrates how to perform interactive input and output in pure AArch64 assembly using macOS system calls (no C runtime or libraries).

⸻

🧠 Concepts Covered
	•	Using the write syscall to print text
	•	Using the read syscall to take user input
	•	Creating reusable syscall wrapper functions
	•	Storing constant strings in the read-only section (__TEXT,__const)
	•	Using .bss to allocate a writable input buffer
	•	Passing syscall arguments through registers (ARM64 calling convention)

⸻

🛠 Syscalls Used

Syscall	Number	Purpose
write	4	Output text to terminal
read	3	Read input from keyboard
exit	1	Terminate program

macOS ARM64 Syscall Convention

x0–x2  → syscall arguments
x16    → 0x2000000 + syscall_number
svc 0  → invoke kernel
x0     ← return value


⸻

▶️ Program Flow
	1.	Display a prompt asking for input
	2.	Read user input into a buffer
	3.	Print "You entered: "
	4.	Echo the user’s input back to the terminal

⸻

🧪 Build & Run

as -o main.o main.s
clang main.o -o main
./main


⸻
