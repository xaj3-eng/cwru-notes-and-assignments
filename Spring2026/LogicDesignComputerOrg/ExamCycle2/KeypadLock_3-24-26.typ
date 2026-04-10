#import "@local/xnotes:1.0.0": *

#show: doc => xnote(doc, chapter: 0)

#title[Keypad Lock]

Let's build a keypad lock system with the following properties:

- Correct Passcode Input: 31
- Correct Passcode (Unlock) Output = 1

= State Transition Diagram

3 States:
- 0 Correct Inputs Locked (0)
- 1 Correct Input Locked (1)
- Unlocked (2)

= State Transition Table

#figure(
  table(
    columns: 4,
    align: center,
    stroke: none,
    [Current State], [Current UNLOCKED Output], table.vline(), [Input],
    table.vline(), [Next State],
    table.hline(),
    [0 Correct - Locked], [0], [0 | 1 | 2], [0 Correct - Locked],
    [0 Correct - Locked], [0], [3], [1 Correct - Locked],
    [1 Correct - Locked], [0], [0 | 2 | 3], [0 Correct - Locked],
    [1 Correct - Locked], [0], [1], [Unlocked],
    [Unlocked], [1], [x], [Locked],
  ),
  caption: "State Transition Table for Keypad Lock",
)

== State Assignments

We have three states, so we need a minimum of 2 state variables to code
uniquely for three states. With 2 state variables, there are 4 states: $00,
01, 10, 11$

- 0 Correct - Locked: $00$ ($11?$)
- 1 Correct - Locked: $01$
- Unlocked: $10$

#block(fill: rgb("#ccccee"), inset: 0.5em, radius: 5pt, width: 100%)[Note: We
  have 1 extra state: $11$]

When you have unused states, you could use it to ensure:
+ Minimal Risk
+ Minimal Cost

#figure(
  table(
    columns: 6,
    align: center,
    stroke: none,
    [], [Next], [State], [by], [Input], [],
    [$Q_1 Q_0$], table.vline(), [$00$], [$01$], [$10$], [$11$],
    table.vline(), [Unlock Output],
    table.hline(),
    [00], [00], [00], [00], [01], [0],
    [01], [00], [10], [00], [00], [0],
    [10], [00], [00], [00], [00], [1],
    [11], [00], [00], [00], [00], [0],
  ),
  caption: "State Assignment Table",
)

Use K-Maps to find state assignment equations for $Q_1, Q_0$.

This is technically a *Moore* machine and not a Mealy machine because the
equations aren't a function of the inputs, only the current state.

== Problem with our Circuit

Let's say we use buttons labeled 0-3 that output 00, 01, 10, and 11. If you
hold the button too long, then the clock will pulse twice and the circuit
will behave as if you hit the same button twice. Also if you wait in
between your presses, it will think you inputted a 0.


