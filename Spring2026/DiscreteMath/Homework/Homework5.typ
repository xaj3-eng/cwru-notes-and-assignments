#import "@local/xnotes:1.0.2": *
#show: doc => xnote(doc)
#set page(height: auto)

#title[Homework 5][Xander Jhaveri]

= Section 6.1 <6.1>

1. 2. $B subset.eq A$ and $B subset A$
  4. $B subset.eq A$ and $B subset A$

4. $B subset.eq A$ because every integer that is divisble by 20 is also
  divisible by 5:
  - $m = 20s, space s in ZZ$,
  - $m = 5(4s), space s in ZZ$
  - $m = 5r, space r in ZZ$ because integers are closed under addition
  $A subset.not.eq B$, $"Example": 5 in A, 5 in.not B$
12. 1. ${x in RR | -3 <= x < 2}$
  2. ${x in RR | -1 < x <= 0}$
  7. ${x in RR | x < -3 "or" x >= 2}$
  9. ${x in RR | x <= -1 "or" x > 0}$

25. 1. $[1, 2]$
  3. No, $R_1, R_2, ...$ are not mutually disjoint because they all contain
    the value 1 and a small range greater than 1.
  4. $[1, 2]$
  6. $[1, 2]$

29. #underline[Yes,] ${RR^+, RR^-, {0}}$ is a partition of $RR$ because
  - $RR^+ union RR^- union {0} = RR$
  - $RR^+, RR^-, "and" {0}$ are mutually disjoint because they contain none
    of the same values.

#pagebreak()

= Section 9.2 <9.2>

11.
  3. There are 6 positions that can be manipulated, each with 2 possible
    values. Therefore, by the multiplication rule: #conclusion[There are $2^6 = 32$ possible bit strings of length 8 that begin and end with a 1]

17.
  3. #table(
      columns: 2,
      stroke: none,
      align: center,
      [Digit \#], table.vline(), [\# Possible Digits],
      table.hline(),
      [1], [9],
      [2], [9],
      [3], [8],
      [4], [7],
    )
    #conclusion[By the multiplication rule, there are $9 dot 9 dot 8 dot 7 =
      4536$ possible integers from 1000 through 9999 with distinct digits.]

  5.
    - $P_r ("Distinct Digits") = "# Distinct Digits"/"Total #" = 4536/9000 =
      63/125$
      #table(
        columns: 2,
        stroke: none,
        align: center,
        [Digit \#], table.vline(), [\# Possible Digits],
        table.hline(),
        [4], [5],
        [1], [8],
        [2], [8],
        [3], [7],
      )
    - $P_r ("Distinct Digits and Odd") = "# Distinct Digits and Odd" /
      "Total #" = 2240 / 9000 = 56/225$

21.
  1. The number of relations from $A$ to $B$ is the number of possible
    sets of ordered pairs $(x,y), space x in A, y in B$. There are $m
    dot n$ possible pairs, by the multiplication rule. Every ordered
    pair, $(x,y)$ can either be present in the set, or absent. Since there
    $m dot n$ pairs and every pair has two possible states, by the
    multiplication rule,

    #conclusion[There are $2^(m n)$ possible relations from $A$ to $B$]

  2. The number of functions from $A$ to $B$ is the number of possible
    mappings from every element in $A$ to every element in $B$.
    #table(
      columns: 2,
      stroke: none,
      align: center,
      [Element $a in A$], table.vline(), [\# Possible Elements $b in B$],
      table.hline(),
      [$a_1$], [n],
      [$a_2$], [n],
      [...], [...],
      [$a_m$], [n],
    )
    Therefore, by the multiplication rule,

    #conclusion[There are $n^m$ possible functions from $A$ to $B$]

  3. $m^n / 2^(m n)$

31.
  4. #table(
      columns: 2,
      stroke: none,
      align: center,
      [Distinct Prime $p_i$], table.vline(), [\# Possible Divisors],
      table.hline(),
      [$p_1$], [$a_1 + 1$],
      [$p_2$], [$a_2 + 1$],
      [...], [...],
      [$p_m$], [$a_m + 1$],
    )

    Therefore, by the multiplication rule,

    #conclusion[There are $product_(i=1)^m (a_i+1)$ distinct positive
      divisors in $product_(i=1)^m p_i^(a_i)$]


  5. Possible ways to get 12 divisors: $(a_1 + 1)(a_2 + 1)... = 12$, where
    $p$ are the smallest distinct prime numbers.
    - $p^11: 2^11 = 2048$
    - $p^5 p^1: 2^5 dot 3 = 96$
    - $p^3 p^2: 2^3 dot 3^2 = 72$
    - $p^2 p^1 p^1: 2^2 dot 3 dot 5 = 60$

    #conclusion[The smallest positive integer with 12 positive integer
      divisors is 60]

39. 2. $P(9,6) = 9!/3! = 9 dot 8 dot 7 dot 6 dot 5 dot 4 = 60480$
  4. $P(7,4) = 7!/3! = 7 dot 6 dot 5 dot 4 = 840$

#pagebreak()

= Section 9.3 <9.3>

2.
  2. #table(
      columns: 2,
      align: center,
      stroke: none,
      [String Length], table.vline(), [\# Possible Hexadecimal Numbers],
      table.hline(),
      [2], [$16 dot 16$],
      [3], [$16^3$],
      [4], [$16^4$],
      [5], [$16^5$],
    )
    By the addition rule,

    #conclusion[There are $16^2 + 16^3 + 16^4 + 16^5 = 1118464$ possible
      strings of hexadecimal digits that consist of two to five digits.]

7.
  3. #table(
      columns: 2,
      align: center,
      stroke: none,
      [Password Length], table.vline(), [\# Possible Passwords],
      table.hline(),
      [3], [$50^3$],
      [4], [$50^4$],
      [5], [$50^5$],
    )

    The number of total possible passwords, by the addition and
    multiplication rules is $50^3 + 50^4 + 50^5 =$ #underline[318875000]

    #table(
      columns: 2,
      align: center,
      stroke: none,
      [Password Length],
      table.vline(),
      [\# Possible Passwords; No
        Repetitions],
      table.hline(),
      [3], [$50 dot 49 dot 48$],
      [4], [$50 dot 49 dot 48 dot 47$],
      [5], [$50 dot 49 dot 48 dot 47 dot 46$],
    )

    The number of possible passwords with no repetitions is $50(49)(48) +
    50(49)(48)(47) + 50(49)(48)(47)(46) =$ #underline[259896000]

    #conclusion[Therefore by the difference rule, the number of possible
      passwords with at least 1 repetition is $318875000-259896000=58979000$]


  4. $P_r ("At Least 1 Repetition") = 58979000/318875000 approx 0.185$

17.
  1. $16 dot 15 dot 14 dot 13 = 43680$ four digit hexadecimal strings with
    no repetitions.
  2. \# 4-digit strings at least 1 repetition = $"# total strings" -
    "# strings no repetitions"$ = $16^4 - 43680 =$ #underline[21856]
  3. $P_r ("At least 1 repetition") = 21856/16^4 = 683/2048 approx 0.333$

23.
  1. $floor(1000/4) + floor(1000/7) - floor(1000/28) = 357$ integers 1
    through 1000 divisible by 4 or 7.
  2. $P_r ("Divisible by 4 or 7") = 357/1000 = 0.357$
  3. \# integers 1 through 1000 not divisible by 4 or 7 = $1000-357=643$

#pagebreak()

= Section 9.4 <9.4>

4. Yes, there are $26^2=676$ combinations of first and last initials.
  Therefore by the pigeonhole principle a function from people in the group to initials combinations
  is not one-to-one.

  #conclusion[ There is a at least set of 2 people with the same first and
    last initials]

7. Let there be a function $f: A -> B$ where $A$ is the six randomly chosen
  integers and $B$ be the following partition of $S: {{3,12}, {4,11},
    {5,10}, {6,9}, {7,8}}$.

  Let $f$ be a function that maps the integer in
  $A$ to the corresponding subset that contains the integer in $B$. Because
  $|A|=6 > |B|=5$, by the pigeonhole principle, there are at least two integers
  that correspond to the same subset in $B$. Because all of the subsets in
  $B$ have elements that sum to 15 and there are no repeated elements,

  #conclusion[If six random integers are chosen from $S$, there will be at
    least two integers that sum to 15.]

11. Let a function $f: A -> B$ map randomly chosen integers to sets of
  which they are contained. $A$ is the set of the $n+1$ randomly chosen
  integers, and $B$ is the following partition of the set: ${{1,2},
    {3,4}, ..., {2n-1, 2n}}$

  Because $|A|=n+1>|B|=n$, by the pigeonhole principle, there are at least
  two randomly chosen integers that correspond to the same subset in $B$.
  Because there are no repeated integers, and every subset contains 1/2
  even integers,


  #conclusion[At least one of the randomly chosen $n+1$ integers will be
    even.]

31. Suppose that there are 2 assistants that are assigned to 3 or more
  executives--let's assume the scenario with the maximum number of
  executives: 2 assistants with 4 executives each. This means that the other
  3 assistants are assigned to a
  maximum of 2 executives each. The maximum possible number of executives
  with assistants in this scenario is $3 dot 2 + 2 dot 4 = 14$. This
  contradicts the fact that there are 15 executives, therefore our
  assumption is false, and

  #conclusion[At least 3 assistants are assigned to at least 3 executives]

33. Because there are 6 elements in $A$, there are $2^6=64$ distinct subsets
  of $A$, including $emptyset$, and there are 63 distinct subsets that have
  an existing sum. Let $k$ be the smallest element in $A$. This means that
  the minimum sum of a subset of $A$ is simply $k$, and the maximum sum is
  $k + 10 + 11 + 12 + 13 + 14 = k+60$. There are 61 elements in the range
  from $k$ to $k + 60$ and there are 63 possible subset sums from $A$.
  Therefore by the pigeonhole principle, there are at least two subsets of
  $A$ that have the same sum.

#pagebreak()

= Section 9.5 <9.5>

7.
  1. $C(13,7) = P(13,7)/7! = 13!/(7! (13-7)!) =$ #underline[1716]
  2.
    + $C(7,4) dot C(6,3) =$ #underline[700]
    + $1716 - 1 =$ #underline[1715]
    + $C(7,1) dot C(6,6) + (7,2) dot C(6,5) + (7,3) dot C(6,4) =$
      #underline[658]
  3. $C(13,7) - C(11,5) =$ #underline[1254]
    - You must subtract out all of the combinations where both members are
      already in the group.
  4. $C(11,5) + C(11,7) =$ #underline[792]

8.
  1. $C(14,10) = 14!/(10! 4!) =$ #underline[1001]
  2.
    + $C(6,4) dot C(8,6) =$ #underline[420]
    + $C(14, 10) - C(6,10) =$ #underline[1001]
    + $C(8,8) dot C(6,2) + C(8,7) dot C(6,3) =$ #underline[175]
  3. $C(12,10) + C(12, 9) dot C(2,1) =$ #underline[506]
  4. $C(12,8) + C(12,10) =$ #underline[561]

10. $C(60,22) dot C(60-22,22) dot C(60-22-22,16) = C(60,22) dot C(38,22) \
  = 60!/(22! 38!) dot 38!/(22! 16!) = 60!/(22! 22! 16!) approx 9.15 dot
  10^26$

13.
  2. $C(10,5) =$ #underline[252]
  5. $C(10,0) + C(10,1) =$ #underline[11]

16.
  2. $C(40,5) - C(37,5)=$ #underline[222111]
  3. $P_r("Defective") = 222111/(C(40,5)) = 222111/658008 approx 0.338$

20.
  1. $11!/(3!2!2!1!1!1!1!) =$ #underline[1663200]
  2. $9!/(3!2!1!1!1!1!) =$ #underline[30240]
  3. $9!/(3!2!2!1!1!) =$ #underline[15120]

#pagebreak()

= Section 9.8 <9.8>

3. 1. 0.6
  2. #underline[No], $P(C)=0.4$ because $A,B$, and $C$ are mutually exclusive, so $P(A) + P(B) + P(C) = 1$. Thus $0.4 + 0.2 + P(C)=1$

15.
  - $"Total Revenue" = 3000("$"20) = "$"60000$
  - $"Total Prize Expenses" = "$"40000 + "$"1000 + "$"500 = "$"41500$
  - $"Profit" = "Total Revenue" - "Total Prize Expenses"$ #v(1em, weak: true)
    $= "$"60000 -"$"41500 = "$"18500$
  - $"Expected Profit / Ticket" = "$18500"/"3000 Tickets" =$
  - #final_answer[$approx "$"6.17$ to charity for each ticket sold.]

18. #table(
    columns: 3,
    align: center,
    stroke: none,
    [Combination], table.vline(), [\# Ways to Select], table.vline(),
    [Sum],
    table.hline(),
    [{1,2,2}], [1], [5],
    [{1,2,8}], [4], [11],
    [{2,2,8}], [2], [12],
    [{1,8,8}], [1], [17],
    [{2,8,8}], [2], [18],
  )

  $"Expected Sum" &= sum_(i=0)^(n) a_i P_i \
  &= 5(1/10) + 11(4/10) + 12(2/10) + 17(1/10) + 18(2/10) \
  & #final_answer[$= 63/5 = 12.6$]$

#pagebreak()

= Section 9.9 <9.9>

2. $& P(X | Y) = P(X inter Y)/P(Y) \
  &=> 1/3 = P(X inter Y) / (1/4) \
  & #final_answer[$P(X inter Y) = 1/12$]$

18. Using Bayes' Formula:

  $P (B | A) P (A) = P (A | B) P (B) = P (A inter B) \
  => P (B | A) P (A) = P (A | B) P (B) = P(B) dot P(A) \
  => (P(B | A) P (A)) / (P(A)) = P(B)
  , space (P(A | B) P (B)) / (P(B)) = P(B) \
  => #conclusion[$P(B | A) = P(B), P(A | B) = P(A)$]$

#pagebreak()

= Additional Questions

== Blue and Gray Dice:

#align(center)[
  #columns(2)[
    \# Rolls with Sum of 6: *5*
    #columns(2)[
      - {#text(blue)[1], #text(gray)[5]}
      - {#text(blue)[2], #text(gray)[4]}
      - {#text(blue)[3], #text(gray)[3]}
      #colbreak()
      - {#text(blue)[4], #text(gray)[2]}
      - {#text(blue)[5], #text(gray)[1]}
    ]

    $P("Sum = 6")=5/36$

    #colbreak()

    \# Rolls with Both Odds: *9*
    #columns(2)[
      - {#text(blue)[1], #text(gray)[1]}
      - {#text(blue)[1], #text(gray)[3]}
      - {#text(blue)[1], #text(gray)[5]}
      - {#text(blue)[3], #text(gray)[1]}
      - {#text(blue)[3], #text(gray)[3]}
      #colbreak()
      - {#text(blue)[3], #text(gray)[5]}
      - {#text(blue)[5], #text(gray)[1]}
      - {#text(blue)[5], #text(gray)[3]}
      - {#text(blue)[5], #text(gray)[5]}
    ]

    $P("Both Odd") = 9/36 = 1/4$
  ]

  \# Rolls with Sum of 6 and Both Odds: *3*
  #columns(3)[
    - {#text(blue)[1], #text(gray)[5]}
    #colbreak()
    - {#text(blue)[3], #text(gray)[3]}
    #colbreak()
    - {#text(blue)[5], #text(gray)[1]}
  ]


]

$
  P("Sum = 6" inter "Both Odd") = 3/36 = 1/12 \
  =>P("Sum = 6" | "Both Odd") = P("Sum = 6" inter "Both Odd") /
  (P("Both Odd")) \
  #final_answer[$P("Sum = 6" | "Both Odd") (1/12)/(1/4) = 1/3$]
$

== 98% Accurate Drug Test:

We are trying to find $P("Drug User" | "Positive Test")$

- Bayes' Formula: $P (B | A) P (A) = P (A | B) P (B) = P (A inter B)$

$
  & => P("Drug User" | "Positive Test") dot P("Positive Test") = P("Positive Test"
      | "Drug User") dot P("Drug User") \
  & => P("Drug User" | "Positive Test") = (P("Positive Test" | "Drug User")
    dot P("Drug User"))/(P("Positive Test"))
$

- $P("Positive Test" | "Drug User") = 98% = 0.98$
- $P("Drug User") = 0.5% = 0.005$
- $P("Positive Test") = 0.5% dot 98% + 99.5% dot 2% = 2.48% = 0.0248$

#final_answer[
  $
    => P("Drug User" | "Positive Test") = (0.98 dot 0.005)/
    (0.0248) = 49/248 approx 0.198
  $
]


