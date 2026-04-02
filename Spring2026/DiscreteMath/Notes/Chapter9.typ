#import "@local/xnotes:1.0.2": *
#show: doc => xnote(doc)
#set page(height: auto)

#title[Combinatorics][Chapter 9]

#definition[The Possibility Tree][
  - This is a tree structure with all possibilities as children.

  #columns(2)[
    - #example[Coin Flip][

        #tree-list[
          - Heads
          - Tails
        ]
      ]

    #colbreak()

    - #example[Roll of Die][

        #columns(2)[
          #tree-list[
            - 1
            - 2
            - 3
          ]
          #colbreak()
          #tree-list[
            - 4
            - 5
            - 6
          ]
        ]
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

  - #example[Number of combinations for a 4-digit combination lock][
      - $10 dot 10 dot 10 dot 10 = 10000$
    ]
]

#definition[Probability][
  - Let the set $S$ be a sample space (all possible outcomes from a given
    combination)
    - e.g. ${A A, B B, A B B, B A A, ..., A B A B A}$
  - Let $E$ be an event (a set) in $S$ such that $E subset.eq S$

  $
    P_r (E) = (|E|) / (|S|)
  $

  - i.e. #emph[ the *probability* that $E$ occurs is equal to the number
      of outcomes that satisfies $E$ over the total number of possibilities
    ]

  - #example[Rolling a die][
      - $S = {1,2,3,4,5,6}$
      - $E =$ even number, $E = {2,4,6}$
      - $P_r (E) = (|E|) / (|S|) = 3 / 6 = 1 / 2 = 50%$
    ]
]

#definition[Permutation - ][
  #emph[A *permutation* of a set of elements is an
    order of those elements]
  - No repetitions, every element must be included in each permutation
  - #example[
      $A={1,2,3}$

      - $123, 132, 213, 231, 312, 321$ are all of the permutations of $A$
    ]
]

#theorem[Given n elements, the number of permutations $p$ is given by:
  $
    p(n) = n!
  $
]

#definition[_r-_Permutation - ][
  #emph[An ordering of any r elements in a set]
  - No repetitions, $r$ unique elements are included in each permutation
]

#theorem[Given n elements, the number of $r$-permutations $p$ is given by:
  $
    p(n,r)= n! / (n - r)!
  $
]

#example[
  $f: A -> B, |A|=|B|=n$ where $f$ is a bijective function.

  - The number of *bijective* functions from A to B is $n!$
  - The number of *total* functions from A to B is $n^n$
]
