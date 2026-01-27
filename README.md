⸻

⚙️ arm64Assembly

A structured collection of ARM64 (AArch64) Assembly examples, notes, and mini-projects built specifically for Apple Silicon Macs (M1/M2/M3).

This repository focuses on learning low-level programming on macOS — starting from the basics and gradually moving toward more advanced system-level concepts.

⸻

📌 About This Repository

This project is designed as a step-by-step learning path for ARM64 assembly on macOS.

It is ideal for:
	•	Absolute beginners
	•	🧑‍🎓 Students learning systems and low-level programming
	•	🔄 Developers transitioning from x86/x64 to ARM64
	•	🧠 Curious programmers who want to understand how software interacts with the OS at a low level

Each folder represents a concept milestone, building on the previous one.

⸻

🧭 Learning Roadmap

Folder	Topic	Description
01_hello_Assembly	Hello World	Basic program structure and syscalls
02_functions	Functions	Code organization and branching into reusable routines
03_taking_input	Syscall I/O	Reading input and writing output using macOS syscalls

More topics coming soon:
	•	String processing
	•	Number parsing (atoi / itoa)
	•	Memory and stack usage
	•	Building small terminal tools in pure assembly

⸻

💻 Target Platform

Component	Details
Architecture	ARM64 (AArch64)
Operating System	macOS on Apple Silicon
Assembler	as (LLVM toolchain)
Linker	ld / clang
Debugger	lldb
Editor	Any (VS Code recommended)


⸻

🧠 Philosophy

This repo avoids heavy abstractions and focuses on:
	•	Direct system call usage
	•	Understanding register-level programming
	•	Learning how programs run without high-level runtimes

The goal is not just to write assembly — but to understand how software really works underneath.

⸻

📜 License

This project is licensed under the MIT License — feel free to use, modify, and learn from it.

⸻
