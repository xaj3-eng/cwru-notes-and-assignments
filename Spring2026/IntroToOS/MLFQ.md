# MLFQ

Scheduling is ordered into processes of different priorities

Essentially:

- Level Q1: 1 (A low linux nice value)
- Level Q2: 2, 3, 4
- Level Q3:
- Level Q4:
- Level Q5: 5, 6, 7, 8 (Unimportant)

As long as there a process at a higher priority (lower level), you will never run;
The scheduler will do round robin on the highest level

Each process has an allotment at each level; when a process uses up its allotment,
it is bumped down to the next level. Important notes:

- Processes start at the top level so they can get immediate response
- The higher the priority, the shorter the timeslice, and shorter the allotments
- The allotment size is usually a multiple of timeslices

The OS can also boost processes up the priorities

- Windows likes to do random boosting

The OS is worried about processes gaming the scheduler

- If a process constantly stops and restarts, then it can get reset to
the top of the ladder

To combat this, some OS don't reset the same process back to the top
after stopping and restarting

> In the real world, most processes don't game the system (unless it is like
malware), and it's mostly accidental favoritism, not fairness
