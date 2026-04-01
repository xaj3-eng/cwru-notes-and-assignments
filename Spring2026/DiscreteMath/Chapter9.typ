#import "@local/xnotes:1.0.1": *
#show: doc => xnote(doc)

#title[Combinatorics][Chapter 9]

#definition[The Possibility Tree][
  - This is a tree structure with all possibilities as children.

  - #example[Coin Flip][

      #tree-list[
        - Heads
        - Tails
      ]
    ]

  - #example[Roll of Die][
      #align(center)[
        #table(
          columns: 3,
          stroke: none,
          [- 1], [- 2], [- 3],
          [- 4], [- 5], [- 6],
        )
      ]
    ]

  - #example[Two tennis players A and B play until one win stwo games in a
      row or a total of 3 games.

      #tree-list[
        - A
          - *A wins*
          - B
            - A
              - *A wins*
              - B
                - *A wins*
                - *B wins*
            - *B wins*
        - B
          - A
            - *A wins*
            - B
              - A
                - *A wins*
                - *B wins*
              - *B wins*
          - *B wins*
      ]
    ]
]

- Nowadays, people are weighting their possibility trees with probabilities
  or other weights

= Section 9.2 - The Multiplication Rule

#theorem[The Multiplication Rule][
  - If there are k positions to be filled...


  #align(center)[
    #table(
      columns: 2,
      align: center,
      stroke: none,
      [Position \#], [Number of Ways],
      table.hline(),
      [1], [$n_1$],
      [2], [$n_2$],
      [3], [$n_3$],
      [...], [...],
      [k], [$n_k$],
    )
  ]

  - Then the total number of ways to fill all k positions is
  $
    n_1 dot n_2 dot ... dot n_k
  $
]

#definition[Probability][
  - Let the set $S$ be a sample space (all possible outcomes from a given
    combination)
    - e.g. ${A A, B B, A B B, B A A, ..., A B A B A}$
  - Let $E$ be an event in $S$ such that $E subset.eq S$

  $
    P_r(E) = (|E|) / (|S|)
  $

  - i.e. the probability that $E$ occurs is equal to the number of outcomes
    that satisfies $E$ over the total number of possibilities
]

- #example[Rolling a die][
    - $S = {1,2,3,4,5,6}$
    - $E =$ even number, $E = {2,4,6}$
    - $P_r(E) = (|E|) / (|S|) = 3 / 6 = 1 / 2 = 50%$
  ]
