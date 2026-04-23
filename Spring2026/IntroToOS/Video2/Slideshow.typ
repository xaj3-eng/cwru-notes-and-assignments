#import "@preview/typslides:1.3.3": *
#show: typslides.with(
  ratio: "16-9",
  theme: "dusky",
  font-size: 20pt,
  link-style: "color",
  show-progress: true,
)

#front-slide(
  title: "Software-Defined Super Cores",
  subtitle: "Intel Corporation — EP4579444A1",
  authors: "Xander Jhaveri",
  info: [CSDS 338 — Video 2],
)

#slide(title: "The Problem: Single-Thread Performance can Bottleneck", outlined: true)[
  #cols(columns: (1fr, 1fr), gutter: 2em)[
    - Clock speeds plateaued \~2005
    - More cores don't help (most software is single-threaded at its bottleneck)
    - Making cores stronger is expensive in space & power

  ][
    *Alterative Solution Attempt:*
    - P-core + E-core: pick which core to use
      - Inflexible Architecture

  ]

  #align(center)[
    #framed[
      The OS may have lots of CPUs of various types, but it doesn't
      have full control over how to allocate its resources because the
      number of CPU cores is fixed.
    ]
  ]
]

#slide(title: "The Invention: Software-Defined Super Cores", outlined: true)[

  #framed[
    What if multiple small CPU cores could be *dynamically joined by the OS* into one virtual core, or
    *"super core" (SDC)*, to execute a single thread quicker than a single core.
  ]

  *How it works:*
  - OS scheduler detects a demanding single-threaded workload
  - Signals hardware to enter *super core mode* for that thread
  - Fused cores divide the instruction stream internally
  - Abstracted from software -- super cores act like a single core from a
    software perspective.
]

#slide(title: "Patent Figure 1: Super Core Diagram", outlined: true)[
  #figure()[#rotate(90deg)[#image("SDC1.png", height: 30em)]]
]

#blank-slide[
  #underline[= Why Should We Care?]
  #columns(2)[
    *Flexibility*
    - Adapts for optimal performance under different types of stress
    #colbreak()
    *Software Independence*
    - Developers won't feel the need to parallelize for speed increases.
    - Furthermore, old code will get faster.
  ]

  #v(1em)
  #underline[= Speculation & Future Impact]
  #columns(2)[
    *Operating Systems*
    - How can we determine which threads deserve super cores?
    - Which cores should be merged into a super core?
    #colbreak()
    *Hardware*
    - Should CPU cores get smaller?
    - How many cores should we have?
    - How deep can this be optimized.
  ]
]

#focus-slide()[
  Thank You
]

#slide(title: "References")[https://patents.google.com/patent/EP4579444A1/en

  Invented by Jayesh Gaur, Sumeet Bandishte, Ariel Sabba, Ori Lempel, Lihu Rappoport, Sreenivas Subramoney]
