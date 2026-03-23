#set page(height: auto, margin: 1cm)

#line(length: 100%, stroke: 1mm)

#align(center)[
  #title("Discrete Mathematics, Homework 4")
  Xander Jhaveri
]

#line(length: 100%, stroke: 1mm)

#show heading: h => {
  set text(size: 18pt)
  underline(h)
}

= Section 5.1

6. $0,0,0,1$

#line(length: 100%)

60. $=> 2 #sym.dot sum_(k=1)^n (3k^2 + 4) + 5 #sym.dot sum_(k=1)^n (2k^2 - 1)\
  => sum_(k=1)^n (6k^2 + 8) + sum_(k=1)^n (10k^2 - 5)$

  #block(stroke: 1pt + black, inset: 0.5em)[$ => sum_(k=1)^n (16k^2 +3) $]
#line(length: 100%)

= Section 5.2

3. #set enum(numbering: "a.")
  + $P(1): 1^2 = (1(1+1)(2(1)+1))/6 \
    => 1 = (1(2)(3))/6$

    #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(1)$ is true]

  + $P(k): 1^2+2^2+...+k^2 = (k(k+1)(2k+1))/6$
  + $P(k+1): 1^2+2^2+...+k^2+(k+1)^2 = (k+1(k+2)(2k+3))/6$
  + Proof by Induction:

    - Step 1: #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(1)$ is true]

    - Step 2: Assume $P(k)$ is true

      $1^2 + 2^2 + ... + k^2 = (k(k+1)(2k+1))/6 \
      P(k+1): 1^2 + 2^2 + ... + (k+1)^2 = (k+1(k+2)(2k+3))/6 \
      P(k+1): (k(k+1)(2k+1))/6 + (k+1)^2 = (k+1(k+2)(2k+3))/6 \
      P(k+1): (2k^3 + 3k^2 + k)/6 + k^2+2k+1=(2k^3+9k^2+13k+6)/6 \
      P(k+1): (2k^3+9k^2+13k+6)/6 = (2k^3+9k^2+13k+6)/6$

#block(stroke: 0.5pt + gray, inset: 0.25em)[If $P(k)$ is true, then $P(k+1)$ is also true.]

#block(stroke: 1pt + black, inset: 0.5em)[Therefore---by mathematical induction---for all positive integers $n$,
  $
    1^2 + 2^2 + ... + n^2 = (n(n+1)(2n+1))/6
  $
]

#line(length: 100%)

7. Let $P(n): sum_(i=1)^n (5i-4) = (n(5n-3))/2$

  - Step 1: Proving $P(1)$

    $sum_(i=1)^1 (5i-4) = (1(5(1)-3))/2 \
    5(1)-4=(1(2))/2 \
    1 = 1$

  #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(1)$ is true]

  - Step 2: Proving $P(k+1)$ given $P(k)$

    Assume $P(k)$ is true:

    $1 + 6 + ... + (5k-4) = (k(5k-3))/2 \
    P(k+1): 1 + 6 + ... + (5k - 4)+ (5k + 1) = ((k+1)(5k+2))/2 \
    P(k+1): (k(5k-3))/2 + (5k + 1) = ((k+1)(5k+2))/2 \
    P(k+1): (5k^2-3k)/2 + (5k + 1) = (5k^2+7k+2)/2 \
    P(k+1): (5k^2+7k+2)/2=(5k^2+7k+2)/2$

  #block(stroke: 0.5pt + gray, inset: 0.25em)[If $P(k)$ is true, then $P(k+1)$ is also true.]

#block(stroke: 1pt + black, inset: 0.5em)[Therefore---by mathematical induction---for all  integers $n>=1$,
  $
    1 + 6 + 11 + 16 +... + (5n-4) = (n(5n-3))/2
  $
]

#line(length: 100%)

12. Let $P(n): sum_(i=1)^n 1/(i(i+1)) = n/(n+1)$

  - Step 1: Proving $P(1)$

    $sum_(i=1)^1 (i/(i+1)) = 1/(1+1) \
    1/2=1/2$

  #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(1)$ is true]

  - Step 2: Proving $P(k+1)$ given $P(k)$

    Assume $P(k)$ is true:

    $1/(1 #sym.dot 2) + 1/(2 #sym.dot 3) + ... + 1/(k(k+1)) = k/(k+1) \
    P(k+1): 1/(1 #sym.dot 2) + 1/(2 #sym.dot 3) + ... + 1/((k+1)(k+2)) = (k+1)/(k+2) \
    P(k+1): k/(k+1) + 1/((k+1)(k+2)) = (k+1)/(k+2) \
    P(k+1): (k(k+2) + 1)/((k+1)(k+2)) = (k+1)/(k+2) \
    P(k+1): (k^2+2k+1)/((k+1)(k+2)) = (k+1)/(k+2) \
    P(k+1): (k+1)^2/((k+1)(k+2)) = (k+1)/(k+2) \
    P(k+1): (k+1)/(k+2) = (k+1)/(k+2) \ $

  #block(stroke: 0.5pt + gray, inset: 0.25em)[If $P(k)$ is true, then $P(k+1)$ is also true.]

#block(stroke: 1pt + black, inset: 0.5em)[Therefore---by mathematical induction---for all  integers $n>=1$,
  $
    1/(1 #sym.dot 2) + 1/(2 #sym.dot 3) + ... + 1/(n(n+1)) = n/(n+1)
  $
]

#line(length: 100%)

29. $1-2+2^2-2^3+...+(-1)^n 2^n \
  = sum_(i=0)^n (-2)^n \
  = (1(-2)^(n+1)-1)/(-2-1)$
  #block(stroke: 1pt + black, inset: 0.5em)[
    $
      = ((-2)^(n+1)-1)/(-3)
    $
  ]

#line(length: 100%)

= Section 5.3

4. #set enum(numbering: "a.")
  + $P(0): 4 | 5^0 - 1 \
    P(0): 4 | 4$

    #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(0)$ is true]

  + $P(k): 4 | 5^k-1$
  + $P(k+1): 4 | 5^(k+1)-1$
  + To show that this divisibility property is true by mathematical
    induction, we must prove that $P(k+1)$ is true given that $P(k)$ is
    true. i.e. we must prove $4 | 5^(k+1)-1$ given $4 | 5^k-1$.

#line(length: 100%)

7. #set enum(numbering: "a.")
  + $P(2):$ In a round robin tournament involving 2 teams, the teams can be
    labeled $T_1,T_2$ where $T_1$ beats $T_2$.

    In a round robin tournament,
    there must be exactly one winning team, which can be written as $T_1$,
    therefore:

    #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(2)$ is true]

  + $P(k)$ In a round robin tournament involving k teams, the teams can be
    labeled $T_1,T_2,...,T_k$ such that $T_i$ beats $T_(i+1)$ for every
    $i=1,2,...,k$.

  + $P(k+1)$ In a round robin tournament involving k teams, the teams can be
    labeled $T_1,T_2,...,T_(k+1)$ such that $T_i$ beats $T_(i+1)$ for every
    $i=1,2,...,k+1$.

  + To show that $P(n)$ is true for all integers $n>=2$, we must prove that $P(k+1)$
    is true given that $P(k)$ is true. i.e. we must prove that given that
    it's possible to label all of the teams $T_1,T_2,...,T_k$ where $T_i$
    beats $T_(i+1)$, then we can introduce another team into the tournament
    and the labeling remains possible.

#line(length: 100%)

15. - Step 1: Proving $P(0)$ is true:

  $P(0): 6 | 0(0^2+5) \
  P(0): 6 | 0 \
  P(0): 0 = 6k, k in ZZ\
  => k=0, k in ZZ$

  #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(0)$ is true]

  - Step 2: Proving $P(k+1)$ is true, given that $P(k)$ is true:

    $P(k): 6 | k(k^2+5) \
    P(k): k^3+5k = 6m_1, m_1 in ZZ$

    Suppose $P(k)$ is true

    $P(k+1): 6 | (k+1)(k^2+2k+6) \
    P(k+1): k^3+3k^2+8k+6 = 6m_(k+1), m_(k+1) in ZZ$

    We can substitute $6m_1$ for $k^3+5k$ because we assume that $P(k)$ is
    true.

    $P(k+1): 6m_1 + 3k^2+3k+6=6m_(k+1), m_1 in ZZ \
    P(k+1): 6m_1 + 3k(k+1) + 6 = 6m_(k+1)$

    $2 | k(k+1)$ because $k$ and $k+1$ are consecutive integers.

    Therefore $k(k+1) = 2m_2, m_2 in ZZ$

    and $3k(k+1) = 6m_2, m_2 in ZZ$, so we can substitute $6m_2$ for
    $3k(k+1)$:

    $P(k+1): 6m_1 + 6m_2 + 6 = 6m_(k+1) \
    P(k+1): m_1 + m_2 + 1 = m_(k+1)$

    $m_(k+1)$ is an integer because $m_1,m_2 in ZZ$ and integers are closed
    under addition.

    #block(stroke: 0.5pt + gray, inset: 0.25em)[$6 | (k+1)(k^2+2k+6)$ given that $6 | k(k^2+5)$,

      i.e.
      $P(k+1)$ is true given that $P(k)$ is true.]

#block(stroke: 1pt + black, inset: 0.5em)[
  Therefore---by mathematical induction---$n(n^2+5)$ is divisible by 6, for
  each integer $n>=0$.
]

#line(length: 100%)

= Section 5.4

10.
  - Step 1: Proving $P(8)$ is true

    8#sym.cent can be obtained using a combination of 1 3#sym.cent coin
    and 1 5#sym.cent coin.

    #block(stroke: 0.5pt + gray, inset: 0.25em)[Therefore $P(8)$ is true]

  - Step 2: Proving $P(k+1)$ is true, given that $P(8) #sym.and P(9)
    #sym.and ... #sym.and P(k)$ is true, $k >= 8, k in ZZ$

    - Case 1: $k+1=9 #sym.or k+1=10$

      9#sym.cent can be obtained using a combination of 3 3#sym.cent
      coins.

      10#sym.cent can be obtained using a combination of 2 5#sym.cent
      coins.

      #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(k+1)$ is true for $k+1=9,10$]

    - Case 2: $k+1 >= 11$

      $(k-2)$#sym.cent can be obtained using some combination of $x$
      3#sym.cent coins and $y$ 5#sym.cent coins

      Thus $(k+1)$#sym.cent can be obtained using a combination of $(x+1)$
      3#sym.cent coins and $y$ 5#sym.cent coins

      #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(k+1)$ is true for $k+1>=11$]

    #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(k+1)$ is true for $k+1>=8$]

  #block(
    stroke: 1pt + black,
    inset: 0.5em,
  )[Therefore---by mathematical induction---Any $n$#sym.cent can be obtained using a combination of 3#sym.cent and 5#sym.cent coins for any $n>=8$.]

#line(length: 100%)

13.
  - Step 1: Proving $P(2)$ is true

    $2$ has a trivial unique prime decomposition of $2$

    #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(2)$ is true]

  - Step 2: Proving $P(k+1)$ is true, given that $P(2) #sym.and P(3)
    #sym.and ... #sym.and P(k)$ is true, $k >= 2, k in ZZ$

    - Case 1: $k+1$ is prime

      $k+1$ isn't divisible by any numbers besides $1$ and $k+1$, therefore
      it has a trivial unique prime decomposition of $k+1$

      #block(stroke: 0.5pt + gray, inset: 0.25em)[$k+1$ has a unique prime
        decomposition for all prime $k+1$]

    - Case 2: $k+1$ is composite

      $k+1 = r s, 1<r,s<k+1$ by definition of composite

      $P(r)$ is true, so $r$ has a unique prime decomposition $p_r$

      $P(s)$ is true, so $s$ has a unique prime decomposition $p_s$

      Thus $k+1 = p_r p_s$ where $p_r, p_s$ are unique products of prime
      numbers.

      #block(stroke: 0.5pt + gray, inset: 0.25em)[$k+1$ has a unique prime
        decomposition for all composite $k+1$]

    $k+1$ is either prime or composite

    #block(stroke: 0.5pt + gray, inset: 0.25em)[$k+1$ has a unique prime
      decomposition]

  #block(
    stroke: 1pt + black,
    inset: 0.5em,
  )[Therefore---by mathematical induction---the unique factorization of
    integers theorem is true]

#line(length: 100%)

16.
  - Step 1: Proving $P(2)$ is true

    $P(2):$ the sum of any 2 odd integers is even.

    $P(2): exists m_f in ZZ, (2m_1+1) + (2m_2+1) = 2m_f, m_1,m_2 in ZZ$

    $P(2): exists m_f in ZZ, 2m_1+2m_2+2 = 2m_f$

    $P(2): exists m_f in ZZ, m_1+m_2+1=m_f$

    #block(stroke: 0.5pt + gray, inset: 0.25em)[Because integers are
      closed under addition, the sum of any 2 odd integers is even]

  - Step 2: Proving $P(k+1)$ is true, given that $P(2) #sym.and P(3)
    #sym.and ... #sym.and P(k)$ is true, $k >= 2, k in ZZ$

    - Case 1: $k$ is even

      $P(k):$ the sum of any $k$ odd integers is even.

      $P(k): exists m_f in ZZ, (2m_1+1) + (2m_2+1) + ... + (2m_k+1)=2m_f, m_i, in ZZ$

      $P(k): exists m_f in ZZ, 2m_1 + 2m_2 + ... + 2m_k + k = 2m_f$

      Because k is even $=> k = 2l, l in ZZ$

      $P(k): exists m_f in ZZ, 2m_1 + 2m_2 + ... 2m_k + 2l = 2m_f$

      $P(k): exists m_f in ZZ, m_1 + m_2 + ... + m_k + l = m_f$

    #block(stroke: 0.5pt + gray, inset: 0.25em)[Because integers are
      closed under addition, if $k$ is even, the sum of any $k$ odd integers is even]

    - Case 2: $k$ is odd

      $P(k):$ the sum of any $k$ odd integers is odd.

      $P(k): exists m_f in ZZ, (2m_1+1) + (2m_2+1) + ... + (2m_k+1)=2m_f+1, m_i in ZZ$

      $P(k): exists m_f in ZZ, 2m_1 + 2m_2 + ... + 2m_k + k = 2m_f+1$

      Because k is odd $=> k = 2l+1, l in ZZ$

      $P(k): exists m_f in ZZ, 2m_1 + 2m_2 + ... 2m_k + 2l + 1 = 2m_f + 1$

      $P(k): exists m_f in ZZ, m_1 + m_2 + ... + m_k + l = m_f$

    #block(stroke: 0.5pt + gray, inset: 0.25em)[Because integers are
      closed under addition, if $k$ is odd, the sum of any $k$ odd integers is odd]

#block(stroke: 1pt + black, inset: 0.5em)[
  Therefore---by mathematical induction---$forall n in ZZ, n >= 2$, if $n$
  is even, then any sum of n odd integers is even, and if $n$ is odd, then
  any sum of n odd integers is odd.
]

#line(length: 100%)

17. $4^1 = 4 \
  4^2 = 16 \
  4^3 = 64 \
  4^4 = 256 \
  4^5 = 1024 \
  4^6 = 4096 \
  4^7 = 16384 \
  4^8 = 65536$

- #underline[Conjecture]: $forall n in ZZ, n >= 1$

  If $n$ is odd, $4^n mod 10 = 4$, if $n$ is even, $4^n mod 10 = 6$

#underline[Proof by Mathematical Induction:]

- Step 1: Proving $P(1)$ is true

  $4^1 mod 10 = 4$

  #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(1)$ is true]

- Step 2: Proving $P(k+1)$ is true, given that $P(1) #sym.and P(2)
  #sym.and ... #sym.and P(k)$ is true, $k >= 1, k in ZZ$

  - Case 1: $k+1$ is even

    $P(k+1): 4^(k+1) mod 10 = 6$

    $P(k+1): 4^(k+1) = 10m_(k+1) + 6, m_(k+1) in ZZ$

    $k$ is odd and $P(k)$ is assumed to be true

    $4^k mod 10 = 4$

    $4^k = 10m_k + 4, m_k in ZZ$

    $4^(k+1) = 4(4^k)$

    $4^(k+1) = 4(10m_k + 4)$

    $4^(k+1) = 40m_k + 16$

    $4^(k+1) = 10(m_k + 1) + 6$

    Because integers are closed under addition,

    $4^(k+1) = 10m_(k+1) + 6$ when $k$ is even

    #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(k+1)$ is true when $k+1$
      is even]

  - Case 2: $k+1$ is odd

    $P(k+1): 4^(k+1) mod 10 = 4$

    $P(k+1): 4^(k+1) = 10m_(k+1) + 4, m_(k+1) in ZZ$

    $k$ is even and $P(k)$ is assumed to be true

    $4^k mod 10 = 6$

    $4^k = 10m_k + 6, m_k in ZZ$

    $4^(k+1) = 4(4^k)$

    $4^(k+1) = 4(10m_k + 6)$

    $4^(k+1) = 40m_k + 24$

    $4^(k+1) = 10(m_k + 2) + 4$

    Because integers are closed under addition,

    $4^(k+1) = 10m_(k+1) + 4$ when $k$ is when

    #block(stroke: 0.5pt + gray, inset: 0.25em)[$P(k+1)$ is true when $k+1$
      is odd]

#block(stroke: 1pt + black, inset: 0.5em)[
  Therefore---by mathematical induction---$forall n in ZZ, n >=1$

  If $n$ is odd, $4^n mod 10=4$, if $n$ is even, $4^n mod 10 = 6$
]
