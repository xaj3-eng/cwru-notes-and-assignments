#import "@local/xnotes:1.0.0": *
#import "@preview/wavy:0.1.3"
#show raw.where(lang: "wavy"): it => wavy.render(
  "{
    signal: [" + it.text + "]
  }",
)
#show: doc => xnote(doc)

= Designing a Synchronous State Machine

#example[
  Design a synchronous state machine with two inputs A and B, and a single
  output Z that will become 1 if:

  - A had the same value at each of the two previous clock ticks
  - B has been 1 since the last time te first condition was tru.

    $Z=0$ otherwise
]

#figure(
  table(
    columns: 6,
    align: center,
    stroke: none,

    [], table.vline(), table.cell(colspan: 4)[Incoming AB], table.vline(), [State Output],
    table.hline(),
    [Current State], [00], [01], [11], [10], [Z],
    table.hline(),
    [Initial State], [A0], [A0], [A1], [A1], [0],
    [A0], [OK0], [OK0], [A1], [A1], [0],
    [A1], [A0], [A0], [OK1], [OK1], [0],
    [OK0], [OK0], [OK0], [OK1], [A1], [1],
    [OK1], [A0], [A0], [OK1], [OK1], [1],
  ),
  caption: "State Transition Table",
)

= Optimizing State Machines

If you have a state transition table, and there are two states that are
exactly the same, combine them

= Practical Guidelines and Reasonable State Assignements

- Choose the initial state such that the state machine can easily be forced
  at reset.
  - e.g. 0000
- Minimize the number of state variables that change on each transition.
- Take symmetries into account. If one state means almost the same thing
  as, then use similar state assignments differing in one bit (or the
  minimum bits).
- If there are unused state bits, do not limit you choice to the first $s$
  $n$-bit integers.
- Decompose the set of state variables into individual bits or fields where
  each bit or field has a well-defined meaning with respect to the inputs
  and the outputs
- Use more than the minimum number of state variables

#example[

  #figure(
    table(
      columns: 5,
      align: center,
      stroke: none,
      table.hline(),
      table.cell(colspan: 5)[Assignment],
      [State Name], [Simplest $Q_1$-$Q_3$], [Decomp. $Q_1$-$Q_3$],
      [One-Hot $Q_1$-$Q_5$], [\~One-Hot $Q_1$-$Q_4$],
      table.hline(),
      [INIT], [000], [000], [00001], [0000],
      [A0], [001], [100], [00010], [0001],
      [A1], [010], [101], [00100], [0010],
      [OK0], [011], [110], [01000], [0100],
      [OK1], [100], [111], [10000], [1000],
      table.hline(),
    ),
  )
]

== The Minimal Risk Design

Let's assign the states in our first example like so:

#align(center)[
  #table(
    columns: 2,
    stroke: none,
    align: center,
    [INIT], table.vline(), [000],
    [A0], [100],
    [A1], [101],
    [OK0], [110],
    [OK1], [111],
  )
]

The minimal risk design would assign all of the bits to the initial state.

= Counters

Any clocked synchronous circuit with a single cycle in the state diagram is
called a counter.

Modulus of a counter is the number of states in a counter.

== Ripple Counters

#example[4-bit binary counter]

#table(
  columns: 1,
  stroke: none,
  align: center,
  [$Q_3 Q_2 Q_1 Q_0$],
  table.hline(),
  [0000],
  [0001],
  [0010],
  [0011],
  [...],
  [1111],
)

- $Q_0 =$ Direct Output from Clock through T Flip-Flop
- $Q_1 =$ Output from $Q_0$ through T Flip-Flop
- $Q_2 =$ Output from $Q_1$ through T Flip-Flop
- $Q_3 =$ Output from $Q_2$ through T Flip-Flop

Fun fact, if you just use all of the inverted outputs of the T Flip-Flops,
then you have a down counter.

> Remember that you can turn a D Flip-Flop into a T Flip-Flop by feeding
$Q'$ into $D$
)
