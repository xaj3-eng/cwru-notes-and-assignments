# Context Switching

- When processes are moved off of the CPU, they are put at the end of a task queue.
- Processes state are stored on the PCB (Process Control Block)
- When processes yield, they move themself to the end of the queue

## Cooperative vs. Non-cooperative/Preemptive Scheduling

Cooperative CPU scheduling waits for tasks/programs to yield before moving
other tasks onto the CPU.

Non-cooperative scheduling gives each task a time limit, and moves them
to the end of the queue involuntarily.

- Voluntary yields are called voluntary switches
- Involuntary switches are when the scheduler kicks a process of the CPU

Migrations are when a process moves from 1 CPU core to another
