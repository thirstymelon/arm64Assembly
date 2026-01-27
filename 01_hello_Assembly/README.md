⸻

🛠️ ARM64 Hello World (macOS)

This is a minimal AArch64 (ARM64) assembly program for macOS that prints a message to the terminal using direct system calls, without any C libraries.

⸻

🧠 What This Program Teaches

This example introduces the absolute basics of low-level programming on Apple Silicon:
	•	How a program starts executing at the _start label
	•	How to call macOS kernel services using the syscall interface
	•	How registers are used to pass arguments
	•	How to place data (like strings) in memory

⸻

⚙️ How Output Works

To print text to the terminal, the program uses the write system call.

Register Usage for write

Register	Purpose
x0	File descriptor (1 = stdout)
x1	Address of the string in memory
x2	Length of the string in bytes
x16	Syscall number (4 for write on macOS)

The instruction svc transfers control to the kernel, which performs the operation.

⸻

🚪 How the Program Exits

After printing, the program must terminate using the exit system call.

Register	Purpose
x0	Exit status (0 = success)
x16	Syscall number (1 for exit)

This tells the operating system that the program finished successfully.

⸻

🧩 Memory and Data

The output string is stored directly in the program using the .ascii directive.
Assembly does not automatically add a null terminator (\0), so the string length must be provided manually to write.

⸻

🏗 Why This Example Matters

This “Hello World” is the foundation for everything that follows:
	•	Understanding register-based argument passing
	•	Learning system call conventions
	•	Seeing how programs run without a runtime or standard library

From here, you can move on to:
	•	Writing reusable functions
	•	Taking user input
	•	Processing strings and numbers

⸻

This program is the first step into true low-level systems programming on ARM64.
