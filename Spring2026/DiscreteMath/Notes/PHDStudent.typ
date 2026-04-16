#import "@local/xnotes:1.0.2": *
#show: doc => xnote(doc)
#import "@preview/finite:0.5.1"

#set page(height: auto)
#title(size-title: 2.5em)[Automata and Turing Machines]

= Finite Automata

Finite automata is used for a function that takes a string and either accepts
or rejects it:

$
  f("string") -> "bool (Accept | Reject)"
$

== Deterministic Finite Automata (DFA)

#example[
  Let's say we have a binary string, and we want to calculate the parity.
  We will accept strings with an odd number of 1s and reject those with an
  even. A simple way to do this is to calculate the sum.

  $
    1 + 1 = 2, space
    f("10100") = "Reject" \
    1 + 1 + 1 = 3, space
    f("11100") = "Accept"
  $

  Note that this is finite, and for extremely large binary strings, we
  would have calculate a very large sum. But there are
  only two possible outputs, is there a better way?

  Yes, you can draw a state machine, where the two states are accept and
  reject. As you iterate over the list, whenever you encounter a 1, you
  switch states.

  #aside[This diagram is like a standardized format for finite automata.
    But most people use $q_i$ to represent states.

    Double circle means accept.]
  #align(center)[
    #finite.automaton(
      (
        Even: (Odd: "1", Even: "0"),
        Odd: (Even: "1", Odd: "0"),
      ),
      initial: "Even",
    )
  ]

  We call this a #underline[Deterministic finite automata (DFA)] because we
  know the number of nodes and every transition.
]

#example[
  Let's say that we want a function to determine if the last two letters of
  string argument is "ab". One way to represent this function is like so:

  #align(center)[
    #finite.automaton(
      (
        q0: (qa: "'a'", q0: "Not 'a'"),
        qa: (qab: "'b'", q0: "Not 'b'"),
        qab: (q0: ""),
      ),
      initial: "q0",
    )
  ]

  Let's look at how the states change for the following string: "abbabb"

  #figure(
    table(
      columns: 2,
      stroke: none,
      align: center,
      [Current State], table.vline(), [Letter],
      table.hline(),
      [Q0], [a],
      [Qa], [b],
      [Qab], [b],
      [Q0], [a],
      [Qa], [b],
      [Qab], [b],
      [Q0], [' '],
    ),
    caption: ["abbabb" States],
  )
]

#example[
  Determine if a phone number is a (740) number.

  #align(center)[
    #finite.automaton(
      (
        q0: (q7: "7", f: "~7"),
        q7: (q74: "4", f: "~4"),
        q74: (q740: "0", f: "~0"),
        q740: none,
      ),

      initial: "q0",
      final: "q740",
      layout: finite.layout.custom.with(positions: (
        q0: (0, 0),
        q7: (2, 0),
        f: (0, -2),
        rest: (rel: (2, 0)),
      )),
      style: (
        transition: (curve: 0.01),
      ),
    )
  ]
]

== Non-Deterministic Finite Automata (NFA)

All DFA's can be represented as an NFA, but not all NFA's can be
represented as a DFA. NFA's can be in multiple states at the same time.
For every token/character in the string, the NFA will imagine that it is in
every possible state at the same time and test the output from there.

#example[
  Determine if a string contains "ab" or "ba".

  The following is an example of a *DFA* diagram:

  #align(center)[
    #finite.automaton(
      (
        q0: (qa: "a", qb: "b"),
        qa: (qab: "b", qa: "a", qb: "b"),
        qb: (qba: "a", qa: "a", qb: "b"),
      ),

      initial: "q0",
      final: ("qab", "qba"),
      layout: finite.layout.custom.with(positions: (
        q0: (0, 0),
        qa: (2, 1),
        qb: (2, -1),
        qab: (4, 1),
        qba: (4, -1),
        rest: (rel: (2, 0)),
      )),
      style: (
        transition: (curve: 0.2),
        qb-qb: (anchor: bottom),
        qb-qa: (anchor: top + right),
      ),
    )
  ]

  He was going to give an example of this as an NFA because apparently its
  a good problem for it, but then he realized
  that it was too complicated and we had to move on.
]

= Turing Machines

A Turing Machine is like finite automata, except it can #underline[store data] at each
of its states, as well as switch states.

#example[
  Given a string, determine if the string contains the same number of a's
  and b's.

  #align(center)[
    #block(stroke: 1pt, outset: 1em)[
      #finite.automaton(
        (
          qa: (qa: "a: +1", qb: "b: +1"),
          qb: (qa: "a: +1", qb: "b: +1"),
        ),
        style: (
          qa-qa: (anchor: left + top),
          qb-qb: (anchor: right + top),
        ),
        initial: "qa",
        final: none,
      )
    ]
  ]

  So in this example, maybe qa and qb start at 0, and you count up on +1.
  You can then compare the two, and accept or reject based on the
  comparison.

]
