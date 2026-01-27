⸻

🧠 ARM64 Assembly: Using Functions on Apple Silicon (macOS)

This example introduces functions in AArch64 assembly on macOS and shows how a program can be structured into reusable blocks of code while still using direct system calls (no C runtime or libraries).

The program prints a message and then exits cleanly.

⸻

🧩 What This Example Teaches
	•	How execution begins at the _start label
	•	How to organize assembly code into separate functions
	•	How to transfer control using branch instructions
	•	How functions can wrap system calls like write and exit
	•	How data (strings) is stored in memory and referenced from code

⸻

🔀 Program Structure

The program is divided into three logical parts:

Part	Purpose
_start	Entry point of the program
print	Function that prints a message
exit	Function that terminates the program

Instead of placing all instructions in one block, responsibilities are separated into labeled sections that behave like functions.

⸻

▶️ How Function Calls Work Here

The program uses branch instructions (b) to jump to labeled code blocks.

Although this is a simplified form of a function call (it does not use bl/ret yet), it demonstrates how execution flow can be redirected to reusable routines.

This lays the foundation for learning proper function calls using:
	•	bl (branch with link) — calls a function
	•	ret — returns from a function

⸻

🖨 How the print Function Works

The print section prepares arguments for the macOS write syscall:

Register	Purpose
x0	File descriptor (1 = stdout)
x1	Address of the string in memory
x2	Length of the string
x16	Syscall number for write

The svc instruction then switches to kernel mode so the operating system can perform the output.

⸻

🚪 How the exit Function Works

The exit section performs the exit syscall, which tells the operating system the program has finished.

Register	Purpose
x0	Exit status (0 = success)
x16	Syscall number for exit


⸻

🧠 Why This Example Is Important

This program moves beyond a single linear block of instructions and introduces code organization — a key step toward writing larger assembly programs.

Understanding this structure makes it easier to:
	•	Build reusable syscall wrappers
	•	Write multi-step programs
	•	Implement real functions with stack frames and return values

⸻

This example bridges the gap between basic syscalls and structured low-level programming in ARM64 assembly.
