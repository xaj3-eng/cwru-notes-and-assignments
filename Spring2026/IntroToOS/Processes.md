# Processes

Know acronyms, they may be tested

## What is a process

- A program being executed
  - Generally running or trying to run
- What does "run" mean?
  - CPU fetches instruction at program counter **(PC)**
  - Decodes the instruction
  - Executes the instruction (add, subtract, fetch from/store in memory)
- Running is a cycle of Fetch, Decode, Execute, (store), repeat

## Process Control Blocks

Apparently we need to know what this is, but it isn't actually used

1. Process Control Block is the metadata of a process
  a. Holds information about a process
    1. Pointer
    1. Process State
    1. Process Number
    1. Process Counter
    1. Registers
    1. Memory Limit
    1. List of Open Files
    1. etc.
  b. Necessary for the OS to track and manage processes
1. Process states (There are more than 3 states, but only 3 categories of state)
  a. Ready: The process wants to run (but doesn't)
  b. Running: The process is running on a CPU core
  c. Waiting: The process chooses not to run

## Process Memory Map

Process Memory Map is /proc/{PID}/maps on Linux

It kind of allocates how all the memory should be used

- Kernel Space: OS only! Untouchable
- Stack: information necessary for function calls (It's a stack)
- Heap: dynamic memory allocation (It's not a heap the data structure)
  - The stack and the heap grow to occupy the same space, together they
  occupy a fixed amount of space I think. (They will pretty much
  never run out of space unless your program tries to use infinite space)
- BSS: **Block started by symbol** (uninitialized data)
  - a.k.a. uninitialized data segment
  - Read & Write perms
  - Gets initialized by the executable, to become the stack and the heap
- Data: global and static variables (initialized data)
  - Read & Write perms (Unless read-only)
  - Read by the executable
  - (In an interpreted language, the code is probably here)
- Text: code segments, executable instructions for the program
  - Read & Exec perms
  - Read by the executable
  - (If you run an interpreted language, the interpreter is here)
- (ASLR or **Address Space Layout Randomization**: It stores where
each above component is stored, in a random way such that its
not predictable to hackers)
  - The memory components above are not right next to each other,
  there is a random amount of space between the components
  - The BSS, Data, and Text have no space in between though

Every component of memory is allocated for every unique process
except for the kernel space, which is shared.

## Process vs. Program

A program is the thing that can become a process

A process runs until context is switched, e.g.:

- Program blocked or preempted
  - i/o until read to run again
  - Some other's turn
  - Etc.

A process is the thing being run that changes state.
The program turns into a process when you run it
