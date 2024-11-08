# Simple Bootloader
This project implements a bootloader in Assembly and C, which is responsible for loading the kernel of an operating system into memory and starting code execution in 32-bit protected mode.

## Project structure
```bash
|-- sbtl/
    |-- src/
        |-- disk.asm
        |-- global-descriptor-table.asm
        |-- kernel.c
        |-- kernel-entry.asm
        |-- master-boot-record.asm
        |-- switch-to-32bit.asm
    |-- Makefile
    |-- README.md
```

- **master-boot-record.asm:** Implements the bootloader that is loaded by the BIOS and makes the transition to the kernel.
- **kernel-entry.asm:** Kernel entry point, prepares the environment for C code execution.
- **kernel.c:** Simple kernel that displays a character in video memory.
- **global-descriptor-table.asm:** Defines the GDT required for the transition to protected mode.
- **disk.asm:** Contains auxiliary functions for reading disks.
- **switch-to-32bit.asm:** Transitions from real mode to protected mode.
- **Makefile:** Manages the compilation, linking and execution of the project.