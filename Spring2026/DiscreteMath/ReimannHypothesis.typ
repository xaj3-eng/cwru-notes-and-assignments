#import "@local/xnotes:1.0.0": *
#show: doc => xnote(doc)

#title[The Riemann Hypothesis][Special Topic]

The Riemann Hypothesis has yet to be proved or disproved.

= Euler and the Pi and Zeta Functions

Remember: #emph[There are infinitely many primes]

Let $pi(n)=$ the number of prime numbers before $n$

i.e. #h(25pt) $pi(10)=4, pi(20)=8$

#hypothesis[
  #align(center)[$pi(n)$ is a finite polynomial function]
]


#definition[The *Euler Zeta Function*:

  $
    zeta(s) = 1/1^s + 1/2^s + 1/3^s + ... , #h(15pt) s in ZZ^+\
    = sum_(i=1)^(infinity) 1/i^s
  $
]


#example[
  #align(center)[
    let $s=1$

    $zeta(1)=1/1 + 1/2 + 1/3 + ...,$ #emph[Diverges]

    let $s=2$

    $zeta(2)=1/1^2 + 1/2^2 + 1/3^2 + ...= pi^2/6$

    #v(10pt)

    For any $s<2, zeta$ diverges
    For any $s>=2, zeta$ converges


  ]
]

Note something strange: Rational numbers are closed under addition, yet
when adding infinite rational numbers, we get an irrational number in
$pi^2/6$

#example[
  #align(center)[
    let $s=-1$

    $zeta(-1)=1 + 2 + 3 + ...$

    Euler _"showed"_ that $zeta(-1) = -1/12$
  ]
]

#proposition[
  $zeta(-1) = -1/12$,
  Consider the following Taylor Series

  $x/(1-x)^2 = x + 2x^2 + 3x^3 + ...$

  let $x=-1$ *#sym.arrow.l Error Here*

  $-1/4 = -1+2-3+4-5+6... \\
  &=-(1+3+5+7+...) + (2 + 4 + 6 +8+...) \\
  &=-1(1 + 2 + 3 + ... + 4(1 + 2 + 3 + ...) \\
  &= 3(1 + 2 + 3 + ...)$

  $-1/12=1+2+3+...$
]

You cannot substitute $x=-1$ into the Taylor Series because it is not in
the domain.

#definition[*Anayltic Combination:*

  Let $f(x)$ with domain $D_1$, and $g(x)$, which is equal to $f(x)$ in $D_1$,
  but has a larger domain $D_2$.

  if $x in D_1, f(x) = g(x)$
]

#proposition[$pi(n) approx n/(ln n)$]

= The Riemann Hypothesis

#definition[*The Riemann Zeta Function* (Riemann, 1859)

  Riemann's extension of the zeta function from $s in ZZ^+$ to $s in CC$

  $zeta_R (S)=1/(2pi i) Gamma (1-s) integral.cont (z^(s-1) e^-z)/(1-e^z) d z$

  $zeta_R equiv zeta$ when $s in ZZ^+$
]

Note: $zeta_R (-1) = -1/12$

#hypothesis[*The Riemann Hypothesis*

  Let $zeta_R (s) = 0$

  s has trivial and non trivial solutions:

  + Trivial Solutions: $s=-2n, #h(15pt) n in ZZ^+$
  + Non Trivial Solutions: $s=1/2 + b i, #h(15pt) b in RR$
]

This means that all (non-trivial) solutions to $zeta_R(s)$ satisfy
$"real"(s) = 1/2$

#hypothesis[
  $pi(n) = sum_(i=1)^(infinity) M(n)/i J(i sqrt(2))$ #h(15pt) (Riemann)
]

$J(x)$ is called the Riemann Prime Counting function
$
  J(x)=L_i (x) - sum_(p) L_i (x^p) - ln 2 + integral_x^infinity (d
  t)/(t(t^2 - 1)(ln t)
$
Where $p$ is a non-trivial solution of $zeta_R (s)$

