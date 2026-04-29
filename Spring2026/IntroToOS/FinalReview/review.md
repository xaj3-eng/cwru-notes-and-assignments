# Intro to OS — Final Exam Review

---

## 1. OS Basics & Environment

| Term | Definition |
|------|------------|
| **OS** | The control interface of a programmable device — the hardware/software bridge; the monitor/supervisor; software that controls resources and resource contention |
| **CLI** | Command line interface of an OS, usually a shell such as bash in a *nix system |
| **bare metal** | A system where the OS runs natively, not mediated by a significant emulator or virtualization layer |
| **virtual machine** | A system where the OS is *not* running on bare metal |
| **virtual desktop** | A kind of virtualization where desktop functions are provided as if native |
| **server** | A system where intended users are mediated by the internet, especially for web-serving static and dynamic data to clients |
| **ssh** | Secure shell — used to interact with the CLI of a *nix server |
| **live-boot** | Usually USB-into-Linux; the OS image (an ISO 9660 file) is read-only and occupies RAM, typically with no persistence layer |
| **appliance OS** | Lower-functionality OS than general-purpose, aimed at controlling a specific kind of system |
| **incrementalism** | Philosophy of design where the new is based heavily on prior work to avoid massive unforeseen failures |

### Key Linux Commands

```
ls [-a, -l, ...]    mv    rm    mkdir    cd    cp
kill -9 %1          killall a.out       kill -9 <pid>
ctrl-Z (SIGSTOP)    ctrl-C (SIGINT)     fg    bg
./a.out &           (starts as background process)
```

| Tool | Purpose |
|------|---------|
| `w` | Show who is logged on and what they are doing |
| `jobs` | Show non-terminated jobs launched from this shell/login |
| `ps` | Show processes (`ps -e` all, `ps -u <user>` for user) |
| `vi` / `vim` | The original *nix editor |
| `man` | Show the manual page for a command (not shell built-ins) |
| `cat` / `tac` / `shuf` | Show / reverse / randomize file; also `more`, `less`, `head`, `tail`, `tail -f` |
| `hexdump` | View a file in hexadecimal (useful for non-printable bytes) |
| `objdump` | Disassemble or inspect an executable binary to recover x86 instructions |
| `strace` / `ltrace` | Show system calls / library calls during live execution of a process |
| `sysctl` | Linux CLI for viewing/changing system (kernel) parameters as root |

> **tab-completion** — In most shells, Tab will suggest or default-complete a command or filename.

> **hidden files** — Files beginning with `.` are hidden from `ls` by default; `ls -a` reveals them (e.g., `.swp` swap files from vi).

> **file extensions** — Not required in *nix. Linux applies methods to objects; it does not define objects by their extension.

---

## 2. Hardware Components

### CPU & Cores

| Term | Definition |
|------|------------|
| **CPU** | A processing unit which may have multiple cores |
| **core** | A single processing device; may have hyperthreading |
| **cpu scaling** | Per-CPU clock rate dynamism for cooling/performance — can be SW or HW controlled; see also big.LITTLE heterogeneous architectures (non-SMP) |
| **registers** | ~8–16 general-purpose integer registers close to the CPU; actual CPU register files number in the hundreds but are not general purpose |

### Memory Hierarchy

| Level | Size | Notes |
|-------|------|-------|
| **Registers** | Few, ~8–16 | Closest to CPU, fastest |
| **L0 cache** | 128 bits | If present — essentially a register |
| **L1 cache** | 2–64 kB | Split: i-cache (instructions) + d-cache (data); 64-byte lines → ~1000 entries |
| **L2 cache** | 256–512 kB | May be shared by cores |
| **L3 cache** | 1–8 MB | More like fast DRAM |
| **DRAM** | 2–16 GB | Main memory |
| **zram** | — | Linux compressed DRAM, ~3:1 compression; costs CPU to use |
| **ramdisk** | — | Portion of RAM mounted like a disk |
| **Secondary storage** | Large | HDD, SSD, NAS, cloud, tape — nonvolatile |
| **nonvolatile RAM** | Rare | Persists after power loss; potential infosec liability |

> **Cache is the dominant performance factor** in modern systems. Cache hit rates around 98% are normal. The hardware (not the OS) mainly manages the cache, though the OS can indirectly influence prefetching.

> **Cache lines** are the unit of transfer — 64 bytes. Even if you only need 1 byte, the whole line is fetched.

### Cache Details

| Term | Definition |
|------|------------|
| **cache hit** | Reference found in cache (~98% hit rate with good locality) |
| **cache read miss** | Must fetch from slower storage; new data inserted into cache |
| **cache write miss** | Write directly to cache then write-back, or write-through to slower storage |
| **k-way associative cache** | Each reference has k possible lines where it could be placed/found |
| **fully-associative cache** | A reference could be in any of the n available cache lines |
| **cache bank** | Cache segregated into parts (via high-order bits) for more size; adds complexity |
| **LRU** | Least-recently used replacement policy |
| **pseudo-LRU** | Approximate LRU — often a clock or circular queue with a dynamic pointer |
| **temporal locality** | Same data referenced repeatedly within a short time window |
| **spatial locality** | Data close to recently referenced data is likely to be referenced soon |
| **cache affinity / cpu affinity** | Preference for a process to stay on the same CPU to exploit warm cache data |
| **cache flushing** | Removing data from cache without on-demand replacement (usually full flush on context switch for security) |
| **cache invalidation** | Like flushing but selective — a line or few, not necessarily the whole cache |
| **warm in cache** | Metaphor for a process having good cache hit behavior |
| **TLB shootdown** | Basically a full flush or selective invalidation of the TLB |
| **simultaneous cache lookup** | Can sometimes be performed across multiple cache levels in parallel |
| **spectre/meltdown** | CVE where cache state was leaked during speculative execution / branch misprediction in hardware |
| **cache coherence** | Hardware mechanism keeping per-core caches synchronized on writes using propagation |
| **transaction serialization** | Hardware memory model enforcement for correct read/write interleaving |
| **memory consistency model** | Memory operation discipline of hardware (and compiler), especially re: cache reorderings |
| **TSO** | Total Store Order — better than PSO, not as good as sequential consistency |

> **Spectre/Meltdown** are important CVEs. The key insight: speculative execution can bring data into cache that a process shouldn't have read. By measuring cache timing, an attacker can infer that data — a side-channel attack.

### Device & System

| Term | Definition |
|------|------------|
| **device driver** | Low-level software (C/C++) written by hardware vendors for generic OS interfaces; historically a major source of CVEs/CWEs |
| **MMU** | Hardware Memory Management Unit — originally for offset calculation, now includes TLB and other duties; sits off-CPU |
| **tps** | In `iostat`, transfers/sec (looks like transactions/sec — not a big deal) |

---

## 3. Processes & Threads

### Concepts

| Term | Definition |
|------|------------|
| **program** | Executable binary or compilable/interpretable ASCII text |
| **process** | Minimum schedulable entity in Linux; has a PID and PPID; lives in `/proc`; a program being executed in some state |
| **thread** | In Linux, a process belonging to a thread group (tgid) |
| **job** | A program launched at the CLI; a single-task batch job in older systems |
| **task** | A process, thread, or job — deliberately ambiguous |
| **daemon** | System process running in the background without a terminal |
| **systemd** | Typically PID 1 — parent of all system processes; may also be PID >1000 for user login sessions |
| **kernel process** | A process that starts and stays in kernel mode |

> **PID vs TGID vs PPID**: In Linux, every thread gets its own PID, but all threads in a process share a TGID (Thread Group ID). The PPID is the parent's PID — if the parent dies and the child is still running, it becomes an **orphan** and is reparented to systemd.

### Process States

| State | Meaning |
|-------|---------|
| `R` | Running or ready |
| `D` | Uninterruptible sleep (usually I/O) |
| `S` | Interruptible sleep (waiting) |
| `T` | Stopped (by signal or tracer) |
| `t` | Tracing stop |
| `Z` | Zombie — terminated but not yet reaped by parent |

> **Zombie processes** accumulate when a parent fails to call `wait()`. They occupy an entry in the process table but use no resources. A zombie storm can exhaust the PID namespace.

> **Orphan vs Zombie**: An orphan is a *living* child whose parent died; it gets reparented to systemd. A zombie is a *dead* child whose parent hasn't called `wait()` yet.

### Process Lifecycle

| Term | Definition |
|------|------------|
| **fork** | C lib function creating a child via kernel `clone()`; copies all memory maps; returns child PID to parent, 0 to child |
| **exec** | (e.g., `execve`) Replaces a running process's code with a different binary |
| **wait** | Suspends parent until child terminates/signals |
| **orphan** | Process whose parent terminated; reparented to systemd |
| **zombie** | Process that terminated but whose parent hasn't called `wait()` |
| **pthread_create** | POSIX thread creation — modern alternative to `fork` |

> **fork + exec** is the classic Unix pattern for spawning new programs: `fork()` duplicates the process, then the child calls `exec()` to replace itself with a new binary. The parent often calls `wait()` to reap the child.

### Signals

| Signal | Trigger | Effect |
|--------|---------|--------|
| **SIGTERM** | `kill <pid>` | Politely ask process to terminate |
| **SIGKILL** | `kill -9 <pid>` | Immediately terminate — cannot be caught/ignored |
| **SIGINT** | Ctrl-C | Interrupt signal from terminal |
| **SIGSTOP** | Ctrl-Z | Suspend process — cannot be caught/ignored |
| **SIGCONT** | `fg` / `bg` | Resume a stopped process (bg = no terminal input; fg = full terminal) |

> **SIGKILL and SIGSTOP cannot be caught, blocked, or ignored** — this is a critical distinction from all other signals. A process has no chance to clean up when SIGKILL'd.

### Kernel & System Interface

| Term | Definition |
|------|------------|
| **kernel** | Ambiguous: the space, the mode, the classification of process or system interface |
| **kernel space** | Space used by the kernel, inaccessible to user programs (typically high 1 GB in 32-bit) |
| **kernel mode** | Often hardware-assisted CPU mode where privileged/kernel tasks can execute |
| **kernel call** | Low-level routine running in kernel mode |
| **system call** | Typically a call that switches from user mode to kernel mode |
| **system process** | Typically a process associated with proper system functioning |
| **trapping to OS** | Switching from user mode to kernel mode to change state in a privileged way |
| **microkernel** | Architectural paradigm where as little as possible runs in the kernel — slower, but more secure and correct |
| **monolithic kernel** | Opposite of microkernel — many system functions execute in kernel mode |

> **System call flow example** (from `truncate`): user calls `truncate()` → C library → `sys_truncate()` → `do_truncate()` → `vfs_truncate()` → `inode_operations->truncate()` → `truncate_pagecache()` → `truncate_inode_pages()`. Each layer peels off abstraction.

### Process Context

| Term | Definition |
|------|------------|
| **process control block (PCB)** | Information stored on context switch: PC, registers, files, etc. — most of what's in `/proc/pid` |
| **context switch (CS)** | When a process is moved on or off a core |
| **migration** | When a process is moved to a *different* core |
| **voluntary CS** | Process relinquishes CPU due to I/O or similar stall |
| **involuntary CS (intr)** | Process removed due to time slice expiry or higher-priority arrival |
| **time slice** | Current allotment on the core for a running process (aka time quantum) |
| **cooperative multitasking** | All context switches are voluntary |
| **noncooperative multitasking** | CS may be involuntary — preempted tasks |

### System Monitor: `top`

| Field | Meaning |
|-------|---------|
| `PR` | Static priority (120 shown as 20; negative = high priority; rt = different policy) |
| `NI` | Nice value |
| `VIRT` | Virtual address space charged to process (often lazy-allocated overcharge) |
| `RES` | Physical resident DRAM used by process |
| `SHR` | Shared memory |
| `CODE` | Size of executable in RAM |
| `nTH` | Number of threads in thread group |
| `P` | ID of last core this process ran on |
| `TGID` | Thread group ID |
| `nDRT` | Dirty pages needing write-back to disk |
| `nMaj/vMaj` | Major page faults (required disk access) |
| `nMin/vMin` | Minor page faults (served from disk cache — no disk I/O) |
| `sum_exec_runtime` | Total CPU time in ms (in `/proc/pid/sched`) — cf. `TIME` column |

### Multiprocessing Terminology

| Term | Definition |
|------|------------|
| **parallel processing** | Using two or more cores simultaneously — wall clock speedup |
| **concurrent processing** | Using at least one core to simulate parallel processing via timeslicing |
| **multiprocessing** | Mostly multi-core computing |
| **multitasking** | Concurrent or parallel processing (not single-job batch) |
| **multiuser** | System processing tasks for multiple users (different UIDs) |

---

## 4. Scheduling

### Schedulers & States

| Term | Definition |
|------|------------|
| **long-term scheduler** | Admits jobs into the short-term scheduler |
| **short-term scheduler** | Decides which process runs next on each core |
| **dispatcher** | Ambiguous — usually the long-term scheduler |
| **ready state** | Process in the ready queue, waiting for a core |
| **running state** | Process currently executing on a core with an expiring time quantum |
| **waiting state** | Process not running, waiting for an event (typically I/O completion) |
| **sleeping state** | Process possibly waiting, possibly put to sleep |
| **suspended state** | Process interrupted by user, waiting in background |
| **backgrounded process** | Running in background; can output to terminal but cannot receive input |
| **load** | 1-min, 5-min, 15-min avg of processes in running/ready state; load of 4+ per core is medium |

### Scheduling Policies

| Policy | Description |
|--------|-------------|
| **FIFO / FCFS / RR** | Basic fair queueing: first come first served / round-robin, rejoining queue at back after service |
| **SCHED_OTHER** | Normal user-level policy (PR=20/120) — round-robin with dynamic priority from nice values |
| **SCHED_BATCH** | Less interactive alternative to SCHED_OTHER |
| **SCHED_IDLE** | Lowest-importance scheduling |
| **SCHED_RR / SCHED_DEADLINE** | Real-time scheduling policies with priority over SCHED_OTHER |
| **real-time (rt)** | OS/system type where deadlines must be met (soft or hard); also scheduling policies for high-priority processes |
| **SJF / SRJF / SBF** | Theoretical policies for studying responsiveness and priority tradeoffs |

> **SCHED_OTHER nice values**: Nice ranges from +19 (least priority, PR=139) to -20 (most priority, PR=100). Only root can set negative nice values. A nice value of 0 gives PR=120.

> **Policy vs. Mechanism**: Policy is *what* you want (e.g., "high-priority jobs first"). Mechanism is *how* you do it (e.g., a min-heap on vruntime). The OS should allow you to swap policies without changing mechanisms.

### Advanced Schedulers

| Term | Definition |
|------|------------|
| **original Linux scheduler** | Round-robin where higher-priority jobs run first and get longer timeslices; 139-level multi-queue; no starvation |
| **MLFQ** | Multi-Level Feedback Queue — processes start high-priority (short timeslices), then fall as they use their allotments |
| **aging** | Promoting old low-priority processes to higher priority to prevent starvation |
| **preemption** | Premature removal of a process from a resource because a higher-priority process arrived |
| **priority boosting** | OS-initiated temporary priority increase (vs. nice, which is user-initiated) |
| **phase change in program** | When a process enters a phase with different resource needs |
| **Ousterhout's Law** | Avoid voodoo constants |
| **proportional share scheduler** | Equal (or appropriate) division of latency into timeslices |
| **lottery scheduler** | Markov simulation of proportional share, approximates via sampling asymptotics |
| **ticket mechanism** | Virtual economy to determine resource division |
| **stride scheduler** | Deterministic version of lottery scheduler using fixed-size steps |

> **MLFQ** is a key exam topic. The core idea: new jobs start at the highest priority level with short timeslices. If they use their full timeslice without blocking, they move *down* a level. I/O-bound processes naturally stay high. **Aging** prevents starvation of long-running low-priority jobs.

### CFS — Completely Fair Scheduler

| Term | Definition |
|------|------------|
| **CFS** | Completely Fair Scheduler — uses vruntimes to select who runs next (unrelated to FCFS) |
| **vruntime** | Actual CPU time weighted nonlinearly by PR; the CFS key — lower vruntime → runs next |
| **sched_latency** | CFS target period to service all tasks in a round-robin fashion (though CFS doesn't use RR for selection) |
| **min_granularity** | CFS minimum time on CPU before checking for preemption by a lower-vruntime task |
| **red-black tree** | O(n log n) data structure used by CFS for O(log n) or O(1) selection of the lowest vruntime task |

> **CFS key insight**: Instead of managing fixed timeslices per priority queue, CFS tracks *how much CPU time each process has received* (vruntime). The process with the lowest vruntime always runs next. Higher-priority processes accumulate vruntime more slowly, so they get more CPU time.

### Scheduling Metrics

| Term | Definition |
|------|------------|
| **throughput** | Number of jobs completed per unit time (e.g., 140 tasks/sec) |
| **bandwidth** | Upper limit of throughput, especially in flows like networking |
| **response time** | Time for system to respond to a user event — mostly time in queue before first CPU timeslice |
| **turnaround time** | Time from job creation/admission to completion/termination |
| **fairness** | Jobs should not be starved |
| **starvation** | Time a process spends in the ready queue without being selected — notable when excessive |
| **Jain's fairness measure** | Normalized squared-sum approach to measure equitable distribution of allocations |
| **Loui's fairness suggestion** | Measure fairness as appropriate asymmetry — starvation by peers/lower-priority is unfair; by higher-priority is acceptable |
| **overhead** | Time spent by the system on policy/mechanism that is not directly useful work |
| **system time** | CPU time charged to the system (vs. user time) |
| **burst** | CPU, I/O, or memory burst — the main capacity planning concern for performance |
| **cpu-bound** | Process that tends to exhaust its timeslice before blocking on I/O |
| **i/o-bound** | Process that tends to block on I/O before finishing its timeslice |

### Kernel Scheduler Processes

| Term | Definition |
|------|------------|
| **kworker** | Kernel worker thread per CPU — encodes CPU affinity, ID, niceness, and workqueue name |
| **migration** | Per-CPU kernel process handling moving tasks between cores |
| **watchdog** | Per-CPU kernel process monitoring system health (CPU temp, etc.) — can trigger reboot; RT scheduled |
| **k...d** | A kernel daemon |

---

## 5. Memory Management

### Address Spaces

| Term | Definition |
|------|------------|
| **memory map** | Listing of virtual address areas/segments from the process's point of view; know 32-bit (bf prefix) vs 64-bit (ff prefix) |
| **vAddr** | Virtual address for program relocation or virtualization — the numbers in a process memory map |
| **ASLR** | Address Space Layout Randomization — randomizes offsets for security |
| **ASID** | Address Space ID — basically PID, but some ASIDs may be PID-less |

> **32-bit vs 64-bit address spaces**: In a 32-bit system, kernel space occupies the top 1 GB (addresses starting with `bf...`), leaving ~3 GB for user space. In 64-bit systems, the address space is enormous (addresses starting with `ff...` for kernel), so most of it is unused.

### Memory Segments (Process Layout)

| Segment | Contents |
|---------|----------|
| **code / text** | Read-execute (`r-x`) binary; may also include constants, initialized data, BSS |
| **heap** | Dynamic allocation via `malloc`; shared across sibling threads (essentially shared memory for the thread group) |
| **stack** | Call stack — user and system functions and actual parameters |
| **thread-specific stack** | Stack area for each thread, visible in the shared address space |
| **thread-local storage** | Adjacent to thread stack — global variables localized per thread to make non-MT-safe code safer |
| **.so** | Shared object library segment, typically between heap and stack |

> **Heap is NOT a heap data structure.** It is the dynamic memory pool managed by `malloc`/`free`. The name is historical and misleading.

### Virtual Memory & Paging

| Term | Definition |
|------|------------|
| **page** | Fixed-size (usually 4 kB) block of contiguous virtual addresses; huge pages are 2 MB or 4 MB |
| **frame** | Quantum of actual DRAM, usually 4 kB |
| **segment** | Virtual address range, contiguous from the process's perspective; in Linux, a multiple of page size |
| **PFN** | Physical Frame Number |
| **page table** | OS data structure for vAddr→PFN translations when TLB misses; typically per-process |
| **PTE** | Page Table Entry — one entry per region, not per page; larger pages → fewer PTEs |
| **PTBR** | Page Table Base Register — allows quick indexing by adding offsets to base |
| **PTLR** | Page Table Length Register — correctness checking for offset indexing |
| **valid bit** | In a PTE, indicates whether the page is in memory; dirty bit indicates write-back needed |
| **HPT** | Hierarchical Page Table — pointers to subtables; most subtables empty (sparse), so they're omitted; height k → k references per translation |
| **IPT** | Inverted Page Table — software hash for page table translation |
| **TLB** | Translation Lookaside Buffer — cached vAddr→PFN translations; may have its own levels and banks |
| **CAM hardware** | Content-Addressable Memory — fast associative array used in TLBs |
| **TLB miss** | Reference requires OS to walk HPT/IPT in software to find translation |
| **TLB tag** | Basically the ASID |
| **bitmap** | Compressed data structure for boolean arrays — 8:1 compression with direct addressing |
| **memory hole** | Where segments are non-adjacent — evidence of external fragmentation |
| **internal fragmentation** | Wasted memory due to minimum page/frame/block size |
| **external fragmentation** | Small non-coalesceable memory holes because they are non-adjacent |

> **TLB miss walkthrough**: On a TLB miss, the MMU (or OS) must walk the hierarchical page table. For a 3-level HPT, that's 3 memory accesses just to get the physical address, then the actual memory access — 4x slowdown worst case. This is why TLB hit rate matters enormously.

> **HPT (Hierarchical Page Table)** is how Linux (and most modern OSes) manage sparse address spaces. A flat page table for a 64-bit process would require petabytes. By using a tree of page tables (typically 4 levels in x86-64), you only allocate subtables that are actually used.

### Heap Allocation

| Term | Definition |
|------|------------|
| **malloc** | C lib function; calls `brk` or `mmap` to create heap space |
| **eager vs lazy** | Immediate vs delayed action; `malloc` typically lazy — addresses not mapped until first write |
| **heap allocation strategy** | Policy for finding space: best fit, worst fit, first fit, next fit, etc.; real allocators use hybrid bins |
| **free list** | Conceptual list of contiguous free bytes for heap allocation strategy traversal |
| **coalescing** | Joining adjacent free ranges to create a larger combined range |
| **unsorted list** | Recently freed blocks not yet placed in sorted bins — for immediate reuse at same size |
| **fast bin** | Recently released contiguous memory not yet coalesced — like a user-level slab |
| **append / prepend** | Whether freed blocks go to front or back of free list |
| **slabs** | Kernel pools of fixed-size objects for avoiding internal fragmentation on pages/frames |
| **slab object** | Fixed-size object in a slab; count per slab determined in advance |
| **buddy allocation** | Compromise between coalescing time and internal fragmentation using contiguous pages in powers of 2 |

> **Copy-on-Write (CoW)** relates to `fork()` laziness: after `fork()`, parent and child share the same physical pages. Only when one writes to a page does the OS copy it — "copy on write." This makes `fork()` fast even for large processes.

### Swapping & Virtual Memory (Disk-Backed)

| Term | Definition |
|------|------------|
| **swap space** | Part of disk acting as an extension of DRAM |
| **swap file** | One way to implement swap (especially Windows); see also swap partition (Linux) |
| **page in / page out** | Transferring pages between DRAM and swap space |
| **memory pressure** | Rate of memory consumption; see also high/low watermarks |
| **swappiness** | Linux kernel parameter (0–100) for tendency to swap before DRAM is 100% full |
| **page fault** | When a PTE doesn't find a page in memory — may be in swap, needs creation, or disk-backed mapping |
| **disk cache** | DRAM copy of disk data (non-dirty frames) — counted as "available" memory |
| **swap cache** | Pages swapped out to disk but still in DRAM — being cleaned up |
| **buffer** | Used for buffering writes, especially streaming I/O |
| **mlocked** | Memory locked in DRAM — cannot be swapped out |
| **kswapd** | Kernel daemon responsible for swapping out pages |
| **page replacement algorithm** | Strategy for choosing a victim page when paging in with insufficient free DRAM |
| **vm.page-cluster** | Power of 2 for max contiguous pages prefetched when swapping in |
| **virtual memory** | Ambiguous — in this context, using swap on disk (NOT the vAddr concept) |
| **access pattern** | Pattern of data references by a process in a phase |
| **cache conscious layout** | Improving spatial locality so prefetching cache lines is more effective |

### Protection & Security in Memory

| Term | Definition |
|------|------------|
| **protection** | Memory protection preventing one user from reading another's memory, or misusing memory |
| **rwx** | Read, write, execute privileges; also `s` (shared) and `p` (private) in memory maps |
| **root** | Privileged user in Linux |
| **stack smashing** | Overwriting the stack beyond its bounds — classic buffer overflow attack vector |
| **segmentation fault** | OS response to invalid memory access |
| **buffer overflow** | Vulnerability where limited string space is exceeded (e.g., in `strcpy` without bounds check) |
| **peek and poke** | Inducing behaviors when addresses are known and programs load at predictable locations |

> **Buffer overflow** is still one of the most exploited vulnerability classes. The classic attack: overflow a local `char[]` buffer on the stack to overwrite the saved return address, redirecting execution. ASLR and stack canaries are primary mitigations.

---

## 6. Concurrency & Synchronization

### Concepts

| Term | Definition |
|------|------------|
| **data race** | Nondeterminism from timing of thread execution accessing shared data — specifically involving writes |
| **thread safety** | Ensuring parallel accesses by two or more threads maintain correct state |
| **mutex** | Mutual exclusion — one user at a time for a resource |
| **spinlock** | Lock where threads spin (busy-wait) on CPU until the lock is freed |
| **semaphore** | Counter-based lock — allows up to N concurrent users; blocks at the limit |
| **atomic operation** | Multi-step operation that cannot be interrupted once started — usually hardware-guaranteed |
| **barrier** | Software declaration that memory or processes must be synchronized at a point |
| **advisory lock** | Lock requiring voluntary compliance from threads (Linux) |
| **mandatory lock** | OS-enforced lock (Windows) |
| **lock granularity** | Size of data locked — finer granularity → more parallelism, more overhead |

> **Spinlock vs Mutex**: Spinlocks waste CPU cycles waiting; good for very short critical sections where the wait is expected to be brief. Mutexes put the thread to sleep; better for longer waits. On a single-core machine, spinlocks can deadlock (the holder can never run to release the lock).

> **Semaphores** are more general than mutexes. A binary semaphore (value 0 or 1) is equivalent to a mutex. A counting semaphore (value N) allows N concurrent accesses — useful for a pool of resources.

### Hardware Primitives

| Term | Definition |
|------|------------|
| **test and set** | Atomic hardware operation — reads a value and sets it in one uninterruptible step |
| **compare and swap** | Atomic operation — compares a memory location to an expected value; only writes if they match |
| **spin wait (busy wait)** | Using CPU to poll for lock availability; can be paused to shorten wasted timeslices |
| **hinting** | Programmer hints to OS that it is spin-waiting, allowing early timeslice expiry or pause |

### Software Algorithms

| Term | Definition |
|------|------------|
| **Peterson's Algorithm** | Turn-yielding, provably correct mutex in software using 3 values — requires sequential consistency |
| **Lamport's Bakery Algorithm** | Like Peterson's but uses a ticket numbering idea — scales to N threads |
| **Futex** | Fast userspace mutex — doesn't need the kernel when the lock is free (fastpath) |
| **Dahm lock** | Two-phase: spins first, then sleeps and waits for notification |
| **MCS lock** | Threads spin on their own local variable; each notifies the next in line |

> **Futex** (Fast Userspace muTEX) is what `pthread_mutex_lock` uses under the hood. The key optimization: if the lock is uncontested, acquiring/releasing it never enters the kernel. Only on contention does it make a syscall. This makes uncontested locks essentially free.

### Priority & Scheduling with Locks

| Term | Definition |
|------|------------|
| **priority inversion** | A low-priority process holds a lock needed by a high-priority process — the high-priority process is effectively blocked by a low-priority one |
| **priority inheritance** | When priority inversion occurs, the lock holder temporarily inherits the priority of the highest-priority waiter |
| **random boosting** | Microsoft's approach — randomly boost priority of processes holding locks with waiters |

> **Priority inversion** famously almost killed the Mars Pathfinder mission in 1997. A low-priority task held a mutex needed by a high-priority task; a medium-priority task kept preempting the low-priority task, indefinitely blocking the high-priority one. Fixed with priority inheritance.

### Deadlock

| Term | Definition |
|------|------------|
| **deadlock** | Circular wait of any length where no thread in the circle can make progress |
| **Coffman conditions** | All four must hold for deadlock: **mutex**, **holding** (holding a resource while requesting another), **no preemption** (resources can't be forcibly taken), **circular wait** |
| **livelock** | Processes not technically deadlocked but not making progress — cycling through states |
| **Bankers Algorithm** | Before granting a resource, verify the recipient can complete and release it; in k-dimensions, simulate all allocation orders |
| **Dining Philosophers' Problem** | Classic deadlock illustration: N threads and N pairwise shared resources |
| **ordered pickup** | Solution to Dining Philosophers: always acquire resources in a fixed global order to break circular wait |

> **Breaking deadlock**: You only need to prevent *one* of the four Coffman conditions. Ordered lock acquisition breaks **circular wait** — the most practical approach. The Banker's Algorithm prevents deadlock but requires knowing resource needs in advance, which is rarely practical.

### Concurrent Data Structures

| Term | Definition |
|------|------------|
| **approximate counter** | Delayed global accuracy with local counts per core — enables parallelism without constant global synchronization |
| **lock overhead** | Synchronization penalty that prevents linear speedup with parallel processing |
| **hand over hand locking** | Lock individual nodes in a linked list rather than the whole list |
| **concurrent queue** | Head and tail have separate locks — allows concurrent enqueue and dequeue |
| **concurrent hash table** | Lock each collision chain independently — allows concurrent access to different buckets |
| **Knuth's Law** | Premature optimization is the root of all evil |

---

## 7. File Systems & Storage

| Term | Definition |
|------|------------|
| **secondary storage** | HDD, SSD, NAS, cloud, tape — nonvolatile |
| **journaling** | Metadata written separately (often first) before data — ensures filesystem consistency after failure/power loss |
| **inode** | In Linux, stores file metadata; possibly includes a checksum |
| **RAID** | Redundant Array of Independent Disks: RAID 0 = striping (performance), RAID 1 = mirroring (redundancy), parity for error detection/correction |
| **CRC** | Cyclic Redundancy Check — checksum storing the remainder mod k of a numeric representation of data |
| **TMR** | Triple Modular Redundancy — voting method surviving 1 failure |
| **n-MR** | Generalization of TMR to odd N — survives ⌊n/2⌋ failures |
| **ZFS** | Zettabyte File System — writes new data first, then atomically switches the pointer; no in-place modification |
| **bit rot** | Gradual data corruption on disk; combated by checksumming and disk scrubbing |
| **protection** | Also: filesystem protection via rwx permissions |

> **Journaling** is why Linux `fsck` after a crash is fast. Instead of scanning the whole filesystem, it replays the journal (a log of metadata operations) to restore consistency. Ext4, XFS, and Btrfs all use journaling.

> **ZFS's copy-on-write** means data is never modified in place. New data goes to a new block; the pointer updates atomically. This makes ZFS naturally consistent — no need for a journal — and enables snapshots nearly for free.

---

## 8. Security

| Term | Definition |
|------|------------|
| **authentication** | Allowing access based on knowing (password), having (token), or being (biometric); also: behavior, location, SSO |
| **MFA** | Multi-Factor Authentication |
| **hashed passwords** | Passwords stored as hash values, not plaintext |
| **brute force** | Breaking a password by exhaustive enumeration |
| **rainbow table** | Pre-computed hash→password table for fast cracking of stolen hashed password files |
| **salt** | Unique random value appended to each password before hashing — defeats rainbow tables |
| **pepper** | Value added to passwords stored separately from the hash — defeats theft of even salted hashes |
| **password exposure** | Places/times where a password must be revealed — leak opportunities |
| **perimeter authentication** | Once inside the perimeter, no further auth required — contrast with continuous/layered auth |
| **attack surface** | All places where a system is vulnerable to adversarial action |
| **security by obscurity** | Hiding access paths — once discovered, provides no further protection |
| **principle of least privilege** | Users and processes should have no more privileges than necessary |
| **MTD** | Moving Target Defense — changing locations/names/paths to maintain access for authorized users while invalidating discovered paths |
| **SDN** | Software Defined Network — one implementation of MTD for servers |
| **RBAC** | Role-Based Access Control |
| **ABAC** | Attribute-Based Access Control |
| **HistBAC** | History-Based Access Control |
| **PathBAC** | Path-Based Access Control |

> **Salt vs Pepper**: Salt is stored alongside the hash (in the same database) and is unique per user — it defeats precomputed rainbow tables. Pepper is stored *separately* (e.g., in a config file or HSM) and is typically shared across all users — it defeats attackers who steal only the database. Both together provide strong defense.

> **Principle of Least Privilege** is one of the most fundamental security principles. Violations are responsible for a huge fraction of real-world breaches — a compromised process with unnecessary root access can do far more damage than a sandboxed one.

---

## 9. Virtualization

| Term | Definition |
|------|------------|
| **virtual machine** | Machine not on bare metal; requires emulation on a bare-metal machine (BMM); provides isolation and scalability |
| **hypervisor** | Software running a guest OS as a VM; Type 1: no host OS (bare metal); Type 2: runs on top of a host OS |
| **Xen** | Popular Type 1 hypervisor |
| **KVM** | Popular Type 2 hypervisor (Linux kernel-based) |
| **paravirtualization** | Guest OS communicates directly with host OS or BMM drivers (via hypercalls) for I/O performance — bypasses full emulation |
| **container** | Packaging of software with minimal dependencies (not true isolation/emulation); less secure than a VM |

> **Type 1 vs Type 2 hypervisors**: Type 1 (bare metal) hypervisors like Xen and VMware ESXi run directly on hardware — they *are* the OS. Type 2 (hosted) hypervisors like KVM and VirtualBox run as applications on top of a regular OS. Type 1 generally has better performance and security; Type 2 is more convenient for development.

> **Containers vs VMs**: Containers (Docker, etc.) share the host kernel — they're just isolated processes with their own filesystem and namespace. VMs run a complete separate kernel. VMs provide stronger isolation; containers have less overhead but a larger shared attack surface.

---

## 10. C Programming Essentials

| Term | Definition |
|------|------------|
| **cc / gcc** | C compiler — produces `a.out` by default (x permission, run with `./a.out`) |
| **main** | Entry point of a C program, after declarations, includes, and functions/prototypes |
| **char** | Typical 1-byte data type in C; strings are NULL-terminated contiguous chars with a head pointer |
| **int** | Typical 4-byte integer in C; see also signed/unsigned, long, long long, short |
| **`%c %d %s %x %p`** | `printf` format specifiers: char, int, string, hex, pointer |
| **srand** | Seeds the pseudo-random number generator in C |
| **sleep** | C lib call → `nanosleep()` syscall → `do_nanosleep()` → `schedule_hrtimeout()` |
| **static** | Not dynamic, not writable; note: `static` pointers in C refer to data, not just address type |
| **malloc / free** | Dynamic memory allocation/deallocation on the heap |

> **NULL-terminated strings** are a perennial source of bugs. `strcpy` doesn't check bounds. `strncpy` is safer but can leave the buffer unterminated. These are the root cause of most buffer overflow vulnerabilities.

---

## Quick Reference: Process States Diagram

```
          admit
NEW ─────────────► READY ◄──────────────────────┐
                     │                           │
              dispatch│                   preempt│ (involuntary CS)
                     ▼                           │
                  RUNNING ───────────────────────┘
                     │
          I/O request│ (voluntary CS)
                     ▼
                  WAITING ───────► READY
                  (blocked)    (I/O complete)

RUNNING ──► ZOMBIE (exit, parent hasn't wait()'d)
RUNNING ──► ORPHAN (parent exits first → reparented to systemd)
```

---

## Quick Reference: Scheduling Cheat Sheet

| Policy | Preemptive | Starvation? | Notes |
|--------|-----------|-------------|-------|
| FCFS / FIFO | No | No | Simple, convoy effect |
| RR | Yes | No | Equal timeslices |
| SJF / SRJF | No / Yes | Yes (long jobs) | Optimal avg turnaround, impractical |
| MLFQ | Yes | Possible (mitigated by aging) | Favors I/O-bound |
| CFS | Yes | No | Linux default; vruntime-based |
| SCHED_RR (RT) | Yes | Possible | Real-time; preempts SCHED_OTHER |

---

*Key files to know: `/proc/pid/`, `/proc/buddyinfo`, `/proc/pid/sched`, `/proc/pid/maps`*

*Key commands: `top -H`, `ps -e`, `ps -u <user>`, `strace`, `ltrace`, `sysctl`, `iostat`*
