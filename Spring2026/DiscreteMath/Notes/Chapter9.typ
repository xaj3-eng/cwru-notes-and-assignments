#import "@local/xnotes:1.0.2": *
#show: doc => xnote(doc, header-breaks: true)
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

= 9.2 - The Multiplication Rule

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

= 9.3 The Addition and Difference Rules

Recall the definition of *partition*. The partition of a set A has the
following properies
1. $U_(i=0)^k A_i = A_1 union A_2 union ... union A_k = A$
2. All sets in partition are mutually disjoint.

#theorem[The Addition Rule - ][
  If ${A_1, A_2, ..., A_k}$ is a partition of A, then
  $
    |A| = sum_(i=1)^(k) A_i
  $
]

- #example[
    $|ZZ| = |"even"| + |"odd"|$
  ]

#example[
  How many possible passwords (permutations) consisting of *up to 3* letters?
  - The set of passwords with 1 letter, of 2 letters, and of 3 letters form
    a partition of our desired set.
  - ${A_1, A_2, A_3}$ is a partition of A, so
  - $|A| = |A_1| + |A_2| + |A_3|$
  - $|A| = 26 + 26^2 + 26^3$
]

#theorem[The Difference Rule -][
  If A and B are two sets with $B subset.eq A$, then
  $
    |A - B| = |A| - |B|
  $]

- #proof[
    - Because $B$ is a subset of $A$, ${B, A-B}$ is a partition of $A$
    - Therefore $|A| = |B| + |A-B|$
    - #conclusion[$|A-B| = |A| - |B|$]
  ]

#theorem[Inclusion-Exclusion Rule (2 dim. and n dim.)][
  $
    |A_1 union A_2| = |A_1| + |A_2| - |A_1 inter A_2| \
    |U_(i=0)^k A_i| = sum_(i=1)^(k) |A_i| - sum_(i=1)^(k) sum_(j=1)^(k) |A_i
    inter A_j| + sum_(i=1)^(k) sum_(j=1)^(k) sum_(l=1)^(k) |A_i inter A_j inter A_l| - ... + (-1)^n
    |inter_(i=1)^k A_i|
  $
]

- You have to add back the odd terms because you removed it multiple times
  by subtracting 2 intersections. But if you have an even number of
  overlaps, then you will over-count the odds and need to subtract.
- Think about Venn Diagrams

= 9.4 - The Pigeonhole Principle

#theorem[The Pigeonhole Principle][

  _If $m$ pigeons fly into $n$ holes, $m > n$, then at least one hole
  must contain two or more pigeons, i.e._

  - If $f: A -> B, |A| > |B|$, then $f$ is not one-to-one
]
_*Furthermore...*_

#theorem[The Generalized Pigeonhole Principle][

  _If m pigeons fly into n holes, $m>=k n+1$, then at least one hole contains
  at least $k+1$ pigeons, i.e._

  - If $f: A -> B, |A| >= k|B| + 1$, then there is at least one image in $f$
    that has at least $k+1$ preimages.

  - #example[
      $m = 7, n = 3$

      - $7 > 2(3) + 1$
      - At least one output has three corresponding inputs
    ]
]

#example[
  You have a bag of markers with the following combination of markers:
  - 5 Red
  - 8 Blue
  - 10 White
  - 12 Green
  - 7 Yellow

  Find the minimum number of markers picked randomly from the bag to have
  at least 5 markers of the same color taken out. The Generalized
  Pigeonhole Principle equation ($m >= k n + 1$) is very important

  - let $m$ be the number of pigeons
  - let $n$ be the number of holes
  - let $k + 1$ be the minimum number of pigeons flying through 1 hole.

  $k+1=5, n = 5, m >= k n + 1$,

  #conclusion[$m >= 21$]
]

= 9.5 - Combinations

Recall the definition of permutation; a permutation is a specific ordering
of a number of elements of a set.

#definition[An *r-combination* of a set of elements is subset of those elements with cardinality r.]

#example[Let $A={1,2,3}$

  $
    P(3,2)=12,13,23,21,31,32 \
    C(3,2)=12,13,23
  $
]

#theorem[
  $C(n,r)= n! / ((n-r)! r!)$
]

= 9.8 - Expected Values

Recall the definition of probability:

$
  S: "Sample Space" \
  E: "Event", space E subset.eq S \
  P_r (E) = (|E|) / (|S|)
$

#theorem[
  Let $A$ and $B$ be two events in $S$:
  1. $0 <= P_r (A), space P_r (B) <= 1$
  2. $P_r (emptyset) = 0, space P_r (S) = 1$
  3. If $A inter B = emptyset, space P_r (A union B) = P_r (A) + P_r (B)$
    - $|A union B| = |A| + |B| - |A inter B|, space |A inter B| = 0$
]

#example[Show that $P_r (A^c) = 1 - P_r (A)$
  $
    A union A^c = S, space A inter A^c = emptyset \
    P_r (A union A^c) = P_r (S), space P_r (A inter A^c) = P_r emptyset)\
    P_r (A union A^c) = 1, P_r (A inter A^c) = 0 \
    P_r (A union A^c) = P_r (A) + P_r (A^c) \
    P_r (A) + P_r (A^c) = 1
  $
]

#definition[Expected Value - ][_In a sample space $S = {a_1, a_2, ..., a_n}$, each $a_i in FF$ occurs with probability $P_i$. The *expected value* $EE = sum_(i=1)^(n) a_i P_i$_]

#example[What is the expected rolled value when rolling a die?
  $
    EE = sum_(i=1)^(n) 1/6 i \
    EE = 1/6 (1 + 2 + 3 + 4 + 5 + 6) \
    #conclusion[
      $EE = 21/6 = 3.5$
    ]
  $
]

#example[50000 people pay \$5 each to play the lottery with the following
  properties:
  1. \$1M: 1/50000
  2. \$1,000: 1/5000
  3. \$500: 1/50
  4. \$10: 1/5

  Is the lottery worth it?

  $
    S={1000000, 1000, 500, 10, 0} \
    EE = sum a_i P_i \
    EE = 1000000 (1/50000) + 1000(1/5000) + 500(1/50) + 10(1/5) = 3.22
  $

  #conclusion[The expected value is \$3.22, so on average, you will lose \$1.78]
]

= 9.9

#example[Somebody rolls a die, and you have to guess what they rolled
  $
    S = {1,2,3,4,5,6} \
    P_r (i) = 1/6
  $
  Now they tell you that the number is even, what is the probability that
  you guess correctly now?

  $
    S = {2,4,6} \
    P_r (i_"even") = 1/3
  $

  If you are given more information, the probability will only increase, it
  will never decrease (Assuming that both the original info and the new
  info are true Information Theory looks into this further). Furthermore:
]

#theorem[When $B$ is an event in $S$ and $A$ is given:
  $
    P_r (B | A) = (P_r (A inter B)) / (P_r (A)) \
    (|A inter B|)/(|S|)/((|A|)/(|S|)) = (|A inter B|) / (|A|)
  $
]

$A$ now acts as the sample space,
and $A inter B$ is the event within the sample space.

#example[Pair of dice is rolled. What is the probability that the sum of
  the numbers is 8, given that both numbers are even?

  - $A:$ Both Even $= {22,24,26,42,44,46,62,64,66}$
  - $B:$ Sum is 8
  - $A inter B ={26,44,62}$
  - $P_r (B|A) = (|A inter B|) / (|A|) = 3/9$
  #conclusion[$P_r (B | A) = 1/3$]
]

We now know the following:
$
  P_r (B | A) = (P_r (A inter B)) / (P_r (A)) \
  P_r (A | B) = (P_r (B inter A)) / (P_r (B)) \
$
And,
$
  p and q equiv q and p \
  A inter B = B inter A \
  P_r (A inter B) = P_r (B inter A)
$
Which is where *Bayes' Formula* comes from:
$
  P_r (B | A) P_r (A) = P_r (A | B) P_r (B) = P_r (A inter B) \
  <=> P_r (B | A) = ((P_r (B)) / (P_r (A))) P_r (A | B)
$
Bayes' Formula is used in similar cases to the contrapositive; if it is
difficult to compute $P_r (B | A)$, instead find $P_r (A | B).$

#example[You are planning a picnic, but the morning is cloudy. Based on
  historical data, 50% of rainy days start with a cloudy morning, 40% of
  mornings are cloudy, and this is a dry month with 10% of days having rain
  overall.

  What is the probability of it raining, given that it is a cloudy morning?

  $
    P_r ("rain" | "cloudy") = ((P_r ("rain")) / (P_r ("cloudy"))) P_r
    ("cloudy" | "rain") \
    P_r ("rain" | "cloudy") = (0.1 / 0.4) dot 0.5 \
    P_r ("rain" | "cloudy") = 0.125 = 12.5%
  $

  #conclusion[There is a 12.5% chance that it will rain given that it is a
    cloudy morning.]
]

#example[The test for cat allergies has an accuracy of 80%. It tells 80% of
  the patients that have an allergy that they have an allergy. It tells 20%
  of the patients that don't have a cat allergy that they do.

  If 1% of the population has a cat allergy, what is the chance that you
  have a cat allergy given that the test told you that you do?

  $
    P_r ("Allergy" | "Positive") = ((P_r ("Allergy")) / (P_r ("Positive"))) P_r
    ("Positive" | "Allergy") \
    <=> P_r ("Allergy" | "Positive") = (0.01 / (P_r ("Positive"))) dot 0.8
    \
    P_r ("Positive") = 0.01 P_r ("Positive" | "Allergy") + 0.99 P_r
    ("Positive" | "No Allergy") \
    = 0.01(0.8) + 0.99(.2) = 0.008 + .198 = 0.206 \
    P_r ("Allergy" | "Positive") = (0.01 / 0.206) dot 0.8 = 0.0388
  $

  #conclusion[If you get a positive test, there is a 3.88% chance that you
    have a cat allergy.]
]
