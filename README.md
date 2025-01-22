# RV32IM-zicsr-SV-Implementation
## Processor Featuring
- traditional 5 stage pipeline
- n-way set associative unified cache
- semi-transparent write buffer
- interrupt controller
- memory mapped IO
- AXI interface

## Hardware to Software Setup
- small portion of the CSRs selected to be available to enable a simple interrupt mechanism
- custom memory map (inspired by the LC-3 system) featuring a supervisor space and userspace will be programmed in a mix of assembly and C following the ilp32 ABI (RISC-V ABI), done in a bare metal fashion
- no standard library provided
- GCC will be used to compiled the code specifically as "riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32im_zicsr -nostd -nostartfiles ..."

## High Level Diagram Layout
![High Level Diagram Layout](https://github.com/user-attachments/assets/fa986aa5-dc84-485e-8922-890c80ef21ae)

# Necessary and Helpful Documentation 
