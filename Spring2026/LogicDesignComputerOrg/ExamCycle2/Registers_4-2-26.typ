#import "@local/xnotes:1.0.2": *
#show: doc => xnote(doc)
#set page(height: auto)

#title[Registers]

#v(3em)

= Simple Registers

#definition[A *register* is a collection of two or more D flip-flops with a
  common clock input. They are often used to stored a collection of related
  bits]

#aside[Registers are essentially multi-bit D Flip-Flops; they simply store
  multi-bit data.]

= Shift Registers

#definition[A *shift register* is an n-bit register that shifts its stored
  value/data by one bit position at every clock tick]

#aside[The shift register acts kind of like a queue; it stores n bits of
  data, one at a time, FIFO. It can also be used to delay a signal by n
  clock ticks]

A "Serial-In, Serial-Out" shift register has one input and one output (plus the clock)

- _SERIN_: A new bit to be shifted into one end at every clock tick
- _SEROUT_: The bit input from _SERIN_ will appear at the output _SEROUT_
  after $n$ clock ticks, and will be lost at the next clock tick.

#example[
  How to build a shift register *(Serial-In Serial-Out)*
][
  - Start with $n$ D Flip-Flops, hook up the same clock to all of them.
  - Hook up _SERIN_ to the first D Flip-Flip input and _SEROUT_ to the last
    output.
  - Then hook up the output of each D Flip-Flop to the input of the next
    D Flip-Flop. Much like ripple carry adders with _carry out_ and _carry
    in_.
]


A "Serial-In, Parallel-Out" shift register is the exact same as the
"Serial-Out" shift register, however, every bit of data is outputted before
being fed into the next D Flip-Flop, so you can read all of the data
stored.

A "Parallel-In, Serial-Out" shift register can load all of the inputs in at
once, but only outputs one bit at a time.
- It has an additional "Load/Shift" bit, that determines whether to
  load parallel data in, or to get the data by shifting the bits
  down.
- This is useful because you can queue up a sequences of outputs
  that will cascade down on every clock tick.
- You can build it using a multiplexer for the load inputs

== The 74x194

The 74x194 is the universal shift register. It has the following inputs and
outputs:

#columns(2)[
  #align(center)[*Inputs:*]
  - _CLK_
  - $S_1 S_0$
  - Mappings for $S_1 S_0$
    - Hold: 00
    - Shift Right: 01
    - Shift Left: 10
    - Load: 11
  - $A B C D$
    - Inputs can be loaded in parallel via the load bits.
  - _SERIN_, Left and Right
  - _CLR_

  #colbreak()

  #align(center)[*Outputs:*]
  - $Q_A Q_B Q_C Q_D$
  - These outputs are outputted in parallel.
]

= Shift Register Counters

#definition[Shift Register Counters][
  - We can combine shift registers with combinational logic gates to form a
    state machine whose state diagram is cyclic.
    - Does not count in an ascending or descending binary sequence
    - Useful in many control applications
]

#example[Ring Counter from 74x194s][
  - A ring counter will follow this pattern: 0001, 0010, 0100, 1000, 0001,
    ...
  - You can build this with a 74x194 by setting $S_1 S_0$ to shift left and
    using the most leftmost output as the serial input so it will
    automatically load a 1 whenever a 1 shifts out.
]

#aside[We can make what is called a "self correcting counter" by only
  loading $Q_3$ into the serial bit when $Q_2, Q_1, Q_0$ are all zero. This
  way, if there is more than one 1, then it will self correct to have only
  one 1.]
