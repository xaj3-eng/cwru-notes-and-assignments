# Lottery and Stride Scheduling

## Lottery Scheduling

Every process has a certain number of tickets. Essentially, every time
that you want to schedule a process, you pick a random ticket.

- Higher priority processes have more tickets and
are thus picked more

> This almost turns the OS into an economy with tickets
as a currency.

## Stride Scheduling

Every process has a certain stride or share, and *(essentially)*
the timescales of the timeslices are multiplied by the stride length

- The process with the shorter stride or the longer share runs
longer/more often than that with the opposite
- Higher priority processes take *"shorter strides"*
