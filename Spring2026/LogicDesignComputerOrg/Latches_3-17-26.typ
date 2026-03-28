#import "@preview/wavy:0.1.3"
#import "@preview/circuiteria:0.2.0"

#set heading(numbering: "1.")

#show raw.where(lang: "wavy"): it => wavy.render(
  "{
    signal: [" + it.text + "]
  }",
)
#set document(
  author: "Xander Jhaveri",
  title: "Latches",
)

= S-R Latch
The overall circuit has two inputs and two outputs
- Inputs: S, R
- Outputs: Q, QN

Created using two NOR gates. The first has inputs of S and the output of the
other NOR gate, the second has inputs of R and the output of the other NOR
gate.

#figure(
  circuiteria.circuit({
    import circuiteria: *

    element.block(
      x: 0,
      y: 0,
      w: 2,
      h: 2,
      id: "block",
      ports: (
        west: ((id: "set", name: "S"), (id: "reset", name: "R")),
        east: ((id: "out0", name: "Q"), (id: "out1", name: "QN")),
      ),
    )
    wire.stub("block-port-set", "west")
    wire.stub("block-port-reset", "west")
    wire.stub("block-port-out0", "east")
    wire.stub("block-port-out1", "east")
  }),
  caption: "Symbol for S-R Latch",
)

#figure(
  circuiteria.circuit({
    import circuiteria: *

    gates.gate-nor(x: 0, y: 0, w: 1, h: 1, id: "nortop")
    gates.gate-nor(x: 0, y: -2, w: 1, h: 1, id: "norbottom")
    wire.stub("nortop-port-in0", "west", name: "S", length: 1)
    wire.stub("norbottom-port-in1", "west", name: "R", length: 1)
    wire.stub("nortop-port-out", "east", name: "Q", length: 1)
    wire.stub("norbottom-port-out", "east", name: "QN", length: 1)
    wire.wire(
      "wQN",
      ("norbottom-port-out", "nortop-port-in1"),
      style: "dodge",
      dodge-margins: (25%, 50%),
      dodge-y: -0.25,
    )
    wire.wire(
      "wQN",
      ("nortop-port-out", "norbottom-port-in0"),
      style: "dodge",
      dodge-margins: (50%, 50%),
      dodge-y: -0.75,
    )
  }),
  caption: "Circuit Diagram for S-R Latch",
)

The output of the S NOR gate is Q, the output of the R NOR gate is QN. Q
and QN should always be inverses.

#figure(
  table(
    columns: 4,
    stroke: none,
    align: center,
    [S], [R], table.vline(), [Q], [QN],
    table.hline(),
    [0], [0], [Prev. Q], [Prev. QN],
    [0], [1], [0], [1],
    [1], [0], [1], [0],
    [1], [1], [0], [0],
  ),
  caption: "S-R Latch",
)

When S is set to 1, Q will be set to 1 and QN will be set to 0.
When R is set to 1, Q will be set to 0 and QN will be set to 1.

You shouldn't set and reset at the same time, but it will usually output Q and
QN both as 0.

#figure(
  table(
    columns: 3,
    align: center,
    stroke: none,
    [], [], table.vline(), [_Next Input_],
    [S], [R], [Q\*],
    table.hline(),
    [0], [0], [_Prev._ $Q$],
    [0], [1], [0],
    [1], [0], [1],
    [1], [1], [0],
  ),
  caption: [S-R Latch in Terms of $Q\*$],
)

Using the Truth Table and K-maps, we find:

#align(center)[$Q\* = S + R' #sym.dot Q$]

This equation for $Q\*$ is called the characteristic equation for an S-R latch.

A timing diagram is a great way to represent sequential logic circuits like S-R
latches

```wavy
  {name:'S', wave:'010..10'},
  {name:'R', wave:'0..10..'},
  {name:'Q', wave:'01.0.1.'},
  {name:'QN', wave:'10.1.0.'},
```

= #overline("S")-#overline("R") Latch

_Summary of section: The bar implies active low inputs_

This is an S-R Latch with active low set and reset inputs

It is made the exact same way, except instead of using NOR gates, you use NAND
gates.

#figure(
  table(
    columns: 4,
    stroke: none,
    align: center,
    [S], [R], table.vline(), [Q], [QN],
    table.hline(),
    [0], [0], [0], [0],
    [0], [1], [1], [0],
    [1], [1], [0], [1],
    [1], [1], [Prev. Q], [Prev. QN],
  ),
  caption: "S-R Latch Active Low Inputs",
)

= S-R Latch with Enable

An S-R Latch with an enable is very easy to create. You simply add a third input
'C', and instead of inputting S and R into the NOR gates, you input (S #sym.dot.op C)
and (R #sym.dot.op C).

When enable is asserted, it acts as an S-R latch, when enable is not asserted,
holds the last value at output.

#figure(
  circuiteria.circuit({
    import circuiteria: *

    element.block(
      x: 0,
      y: 0,
      w: 2,
      h: 2,
      id: "block",
      ports: (
        west: ((id: "enable", name: "C"), (id: "set", name: "S"), (id: "reset", name: "R")),
        east: ((id: "out0", name: "Q"), (id: "out1", name: "QN")),
      ),
    )
    wire.stub("block-port-set", "west")
    wire.stub("block-port-reset", "west")
    wire.stub("block-port-enable", "west")
    wire.stub("block-port-out0", "east")
    wire.stub("block-port-out1", "east")
  }),
  caption: "Symbol for S-R Latch with Enable",
)

#figure(
  circuiteria.circuit({
    import circuiteria: *

    gates.gate-and(x: 0, y: 0.25, w: 1, h: 1, id: "and0")
    gates.gate-and(x: 0, y: -2.25, w: 1, h: 1, id: "and1")
    gates.gate-nor(x: 2, y: 0, w: 1, h: 1, id: "nortop")
    gates.gate-nor(x: 2, y: -2, w: 1, h: 1, id: "norbottom")
    wire.stub("and0-port-in0", "west", name: "S", length: 1)
    wire.stub("and1-port-in1", "west", name: "R", length: 1)
    wire.stub("and0-port-in1", "west", name: "C", length: 1)
    wire.stub("and1-port-in0", "west", name: "C", length: 1)
    wire.stub("nortop-port-out", "east", name: "Q", length: 1)
    wire.stub("norbottom-port-out", "east", name: "QN", length: 1)
    wire.wire(
      "ao0",
      ("and0-port-out", "nortop-port-in0"),
      style: "direct",
    )
    wire.wire(
      "ao1",
      ("and1-port-out", "norbottom-port-in1"),
      style: "direct",
    )
    wire.wire(
      "wQN",
      ("norbottom-port-out", "nortop-port-in1"),
      style: "dodge",
      dodge-margins: (25%, 50%),
      dodge-y: -0.25,
    )
    wire.wire(
      "wQN",
      ("nortop-port-out", "norbottom-port-in0"),
      style: "dodge",
      dodge-margins: (50%, 50%),
      dodge-y: -0.75,
    )
  }),
  caption: "Circuit Diagram",
)

S-R latches with enables are useful in control applications when setting a flag in response
to a condition and resetting it when the condition goes away/changes.

= D-Latches

D-Latches (Data) have two input bits. One input, D, holds the data that you want
to write, the other input works as an enable input, C, and writes D to Q when it is
asserted. There are two outputs Q and QN like the other latches.

If C is asserted, then Q is D and QN is \~D. If C is not asserted, then Q holds
its value.

This is created by feeding (\~D #sym.dot.op C) into the first NOR gate with QN,
and (D #sym.dot.op C) into the second NOR gate with Q.

= D Flip-Flop <sec:d-flip-flop>

The D Flip-Flop is made of 2 D-Latches. It has to inputs--D and CLK--and two
outputs--Q and QN. It is created by feeding D and \~CLK into the first D-Latch,
and then the first Q output and \~\~CLK into the second D-Latch. The outputs of the
second D-Latch are the final outputs.

This circuit sets Q and QN to D and \~D when the clock ticks up, and does
nothing when the clock ticks down.

You can invert the clock input to make the set occur on CLK downtick by
simple removing the first NOT gate from the CLK, so you input CLK and
\~CLK into the D-Latches.


```wavy
  {name:'CLK', wave:'010..10'},
  {name:'D', wave:'1..0...',data:'head body tail'},
  {name:'Q', wave:'01...0.',data:'head body tail'},
  {name:'QN', wave:'0....1.',data:'head body tail'},
```

Note that: $Q\* = D$ where Q\* is the upcoming Q value.

= T Flip-Flop

The T Flip-Flop (Toggle Flip-Flop) has just one input, CLK, and two
outputs, Q and QN. Every time the clock ticks, Q will complement.

This is made the exact same way as a D Flip-Flop, but you replace D with
the output from QN.

#figure(
  circuiteria.circuit({
    import circuiteria: *

    element.block(
      x: 0,
      y: 0,
      w: 2,
      h: 2,
      id: "block",
      ports: (
        west: ((id: "clk", clock: true),),
        east: ((id: "out0", name: "Q"), (id: "out1", name: "QN")),
      ),
    )
    wire.stub("block-port-clk", "west", name: "CLK")
    wire.stub("block-port-out0", "east")
    wire.stub("block-port-out1", "east")
  }),
  caption: "T Flip-Flop",
)

= D Flip-Flop with Enable

#figure(
  table(
    columns: 4,
    align: center,
    stroke: none,
    [], [], [_Current State_], table.vline(), [_Next State_],
    [EN], [D], [Q], [Q\*],
    table.hline(),
    [0], [0], [0], [0],
    [0], [0], [1], [1],
    [0], [1], [0], [0],
    [0], [1], [1], [1],
    [1], [0], [0], [0],
    [1], [0], [1], [0],
    [1], [1], [0], [1],
    [1], [1], [1], [1],
  ),
  caption: "Truth Table for D Flip-Flop with Enable",
)

This truth table shows:

#align(center)[$Q\* = E N' #sym.dot Q + E N #sym.dot D$]

You build this using a normal D Flip-Flop, except you replace D with Q if
enabled isn't asserted, and with D if it is asserted (You can use a 2x1
multiplexer to achieve this).

= S-R Flip-Flop

An S-R Flip-Flop is the same as an S-R latch, except it toggles on click
rise vs. whenever enable is asserted.

Recall that for a D Flip-Flop, $Q\* = D$

= Finite State Machines

We will use sequential logic circuits to build finite state machines. A
finite state machine is any sequential logic circuit with a finite number
of states (crazy). If
there are $n$ state bits, then there are $2^n$ possible states.

A *Mealy* Machine is a finite state machine that has state and output
equations that depend both on inputs and the
current state. i.e. $G(D, Q) = ...$

A *Moore* Machine is a finite state machine that has state and output
equations that only depend on only the current
state (not the inputs). i.e. $G(Q) = ...$

= Designing a 2-Bit Counter

We will design a two-bit binary counter. There is an enable (EN) input.
When $E N = 1$, count up by 1 on clock tick. When $E N = 0$, keep the
current output. There is an additional output (MAX), which becomes 1 when
$E N = 1$ and the output is at its maximum.

== State Transition Diagram

A digram of the state table

== State and Output Tables

=== State Table

#figure(
  table(
    columns: 3,
    align: center,
    stroke: none,
    [Current State, $S$], table.vline(), [$E N = 0$], table.vline(), [$E N = 1$],
    table.hline(),
    [Count is 0], [0], [1],
    [Count is 1], [1], [2],
    [Count is 2], [2], [3],
    [Count is 3], [3], [0],
  ),
  caption: "State Table for 2-bit Counter",
)

=== Output Table: MAX

#figure(
  table(
    columns: 3,
    align: center,
    stroke: none,
    [$E N$], [$S$], table.vline(), [$M A X$],
    table.hline(),
    [0], [x], [0],
    [1], [0], [0],
    [1], [1], [0],
    [1], [2], [0],
    [1], [3], [1],
  ),
  caption: "MAX Output Table for 2-bit Counter",
)

== State Assignment

#figure(
  table(
    columns: 3,
    align: center,
    stroke: none,
    [], table.vline(), [_MSB State_], [_LSB State_],
    [], [$Q_1$], [$Q_0$],
    table.hline(),
    [Count is 0], [0], [0],
    [Count is 1], [0], [1],
    [Count is 2], [1], [0],
    [Count is 3], [1], [1],
  ),
  caption: "State Assignment Table",
)

#figure(
  table(
    columns: 3,
    align: center,
    stroke: none,
    [], table.vline(), [$E N = 0$], table.vline(), [$E N = 1$],
    [$Q_1 Q_0$], [$Q_1 Q_0 M A X\*$], [$Q_1 Q_0 M A X\*$],
    table.hline(),
    [00], [000], [010],
    [01], [010], [100],
    [10], [100], [110],
    [11], [110], [001],
  ),
  caption: "State Assignment with Output",
)
