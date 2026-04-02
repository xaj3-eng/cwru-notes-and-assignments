#import "@local/xnotes:1.0.1": *
#show: doc => xnote(doc)

#title[Set Theory][Chapter 6]

#definition[A is a *proper subset* of B if it is a subset of and is not equal to B]

#theorem[$A = B$ if $A in B$ and $B in A$]

#definition[Power Set][
  - A set is a *power set* of $A$ if it is the set of all possible subsets
    of $A$
]

- #example[
    - $A = {1,2}$
    - $P(A) = {emptyset, {1}, {2}, {1,2}}$
  ]

#theorem[$|P(A)| = 2^(|A|)$]

= Operations Between Sets

1. Union
  - $A union B = {forall x in U | x in A or x in B}$
    - Note: $U$ is the universal set, i.e. the set of all possible elements
  - #example[
      $A = {1,2,3}, B = {3,4,5}$
      $
        A union B = {1,2,3,4,5}
      $]

#sidenote[
  $
    sum_(i=1)^(10) i = 1 + 2 + ... + 10
  $

  This is union notation:

  $
    U_(i=1)^(10) A_i = A_1 union A_2 union ... union A_10
  $
]

2. Intersection
  - $A inter B = {x in U | x in A and x in B}$
  - #example[$A = {1,2,3}, B = {3,4,5}$

      $
        A inter B = {3}
      $]

3. Difference
  - $A - B = {x in U | x in A and x in.not B}$
  - #example[$A = {1,2,3}, B = {3,4,5}$

      $
        A - B = {1,2}
      $]

4. Complement
  - $A^c = {x in U | x in.not A}$
  - The complement of $A$ represents all possible elements that aren't in
    $A$



  - #example[$"let" i in ZZ^+, A_i = (-1/i, 1/i)$ where $A_i$ is an open interval.

      $
        i=2, A_2=(-1/2, 1/2)
      $

      Show that for any $A_i, space A_(i+1) subset A_i$
    ]

  - #proof[
      $"let" x in A_(i+1)$

      $
        -1/i < -1/(i + 1) < x < 1/(i + 1) < 1/i
      $

      Therefore $A_i subset A_(i+1)$
    ]

#sidenote[Note: He talked about how we have to prove that it's a proper subset,
  but I didn't really understand it.]


5. #definition[Disjoint Sets][
    - $A$ and $B$ are *disjoint* if $A inter B = emptyset$

    - $A_1, A_2, A_3, ...$ are *mutually disjoint* if for any $i,j in ZZ^+, A_i
      inter A_j = emptyset$
  ]

6. #definition[Partition of a set][
    - $A_1, A_2, ..., A_n$ is a *partition* of $A$ if

      + $U_(i=1)^n A_i = A$
      + $A_1, A_2, ..., A_n$ are muttually disjoint
  ]

- #example[Partitions of $ZZ^+$

    - $ZZ^-, ZZ^+, {0}$
    - Sets of Even and Odd Integers
    - Sets 3k, 3k+1, 3k+2
    - ${1} union {forall x in ZZ | x eq.not 1}$
  ]
