# Scheduling Disciplines

How the scheduler handles the process queue

> OS resource distribution isn't about fairness, its about the appropriate
unfairness: R. Loui, loui.html

## Types of Scheduling Disciplines

Modern ones are cache based, since you sometimes have to clear parts
of the cache to context switch

### FIFO

First-In-First-Out

Sometimes bad because of the convoy effect:

- Short jobs queued behind a long job

### Shortest Job First

SJF: The shortest job gets run first

### Shortest Remaining Job to Completion

Same to SJF, however if a shorter job comes in, it will kick off the current
job for the shorter job

Sometimes call "Preemptive SJF"

> Preemptive schedulers are schedulers that context switch before the current job
is completed

### Round Robin

Every process gets an equal time interval and they run in a loop, e.g.:

A for 5ms
B for 5ms
C for 5ms

**Granularity** is very important

- Smaller intervals are better for response time
- Bigger intervals are better for caching and context switching overhead

#### Side Note: Amortization

Amortization is the practice of whenever overhead is incurred, you "charge"
that CPU time evenly across the entire sequence of jobs instead of just
screwing one job over by using up its timeslice on overhead

## Scheduling Metrics

### Turnaround time

How long it takes from the moment it arrives in the ready queue to completion

- Measure the average

### Response time

How long it takes for the process to first be running
(How long a response takes)
