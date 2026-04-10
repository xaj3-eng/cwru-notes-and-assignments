#import "@local/xnotes:1.0.2": *
#show: doc => xnote(doc)

#show raw.where(lang: "txt"): it => align(center, it)

#title[MSI Counters #footnote[Medium Scale Integration Counters]]

= 74x163

The most popular counter is the 74x163: a synchronous 4-bit binary counter.

- Inputs:
  - CLK
  - \~CLR
  - \~LD
  - ENP
  - ENT
  - A, B, C, D
- Outputs:
  - $Q D, Q C, Q B, Q A$
  - $R C O$

ENP and ENT are enable inputs

The LD input loads ABCD into QA,QB,QC,QD

The CLR input resets QD,QC,QB,QA to 0

The RCO output represents "Ripple Carry Out", it is asserted when all Q
values are 1. i.e. it is 1 when the counter is at it's max

#example[
  Using a 74x163 and one combinational logic gate, design a counter with
  the following counting sequence:

  $
    0,1,2,...,9,10,0,1,2,...
  $

  i.e. a "Mod 11" counter
]

```txt
           ------------
     CLK --|CLK       |
NAND Out --|~CLR    QA|
       1 --|ENT     QB|--|---\
       1 --|ENP     QC|  |NAND|o---
           |ABCD    QD|--|---/
           |~LD       |
           ------------
```

= 8-bit Counter

#example[Build an 8-bit counter from 2 74x163s with the following counting
  sequence:
  $
    0,1,2,...,127,128,0,1,...
  $
]

Essentially: Feed the RCO output of the first 4-bit counter into the enable input of the second 4-bit counter. Then whenever the MSB (Q8) is 1, use it to clear everything.

#aside[It's not considered great practice to "Gate the Clock" which means
  passing a non-clock input into the CLK]

= 74x169

This is mostly the same as the 74x163 except for one input: UP/DN. _Also
RCO, ENP, and ENT are active low for the 74x169 and there is no clear_

If UP/DN = 0, count down; If UP/DN = 1, count up.

= T-Bird Tail Lights #footnote[This represents those turn signals that
  light up in a sequence pointing in the direction of the turn that you
  love.]

