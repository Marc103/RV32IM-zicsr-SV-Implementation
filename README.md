# RV32IMF-zicsr-SV-Implementation
## Update!
My initial goal was to make a traditional 5 stage pipeline processor. This is doable but after further reading, I've decided to up the ante to a a out-of-order execution processor. Due to complexity, most hardware
developers aiming to be put their designs on FPGAs avoid devloping OoO processors because it would take too much resources. Using parameterization, I want to make the complexity adjustable. Mainly, to be able to 
specify number reservation stations, functional units (of each type) and the size of ROB stations, size of CDB (common data bus) ..etc.. With bare minimum selection, we end up with effectively a pipelined 
processor. Having this level of customization also means that processors that will be used on a particular type of workload can be configured to have more functional units that benefit it (i.e. more
floating point units).

- I've also decided that work on the processor itself is plentiful enough, hence the memory system and interconnects will be supplied by third parties.
- In theory, turning the current design that I'm thinking about from scalar to super scalar might not be that hard, but I want to leave that up to a next project (or addition)
- Floating point operations will now be supported ('F' extension).

## Processor Featuring (New)
- Scalar (single issue) processor
- Out-of-Order execution (using Tomasulo's method)
- Configurable (via parameters)

## Hardware to Software Setup
- small portion of the CSRs selected to be available to enable a simple interrupt mechanism
- custom memory map (inspired by the LC-3 system) featuring a supervisor space and userspace will be programmed in a mix of assembly and C following the ilp32 ABI (RISC-V ABI), done in a bare metal fashion
- no standard library provided
- GCC will be used to compiled the code specifically as "riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32imf_zicsr -nostd -nostartfiles ..."

## High Level Diagram Layout
- coming soon...

# Necessary and Helpful Documentation 
- Computer Architecture A Quantitative Approach - John L. Hennessy | David A. Patterson
