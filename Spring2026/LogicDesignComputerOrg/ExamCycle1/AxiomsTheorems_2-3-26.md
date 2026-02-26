# Axioms and Theorems

> On exams and homeworks you must specify which axioms and theorems you use

## Axioms

Axiom 1 and 1':

- $x=0$ if $x \neq 1$
- $x=1$ if $x \neq 0$

Axiom 2 and 2':

- if $x=0$, then $x'=1$
- if $x=1$, then $x'=0$

Axiom 3 and 3':

- $0 \cdot 0 = 0$
- $1 + 1 = 1$

Axiom 4 and 4':

- $1 \cdot 1 = 1$
- $0 + 0 = 0$

Axiom 5 and 5':

- $1 \cdot 0 = 0 \cdot 1 = 0$
- $1 + 0 = 0 + 1 = 1$

Axioms 1 through 5 (and complements) completely define the switching algebra

## Theorems

Theorem 1 and 1': Identities / Single Value Theorem

- $x + 0 = x$
  - Proof by perfect induction
    - $x=0, 0+0=0$; True according to Axiom 4
    - $x=1, 1+0=1$; True according to Axiom 5
- $x \cdot 1 = x$

Theorem 2 and 2': Null Elements

- $x + 1 = 1$
- $x \cdot 0 = 0$

Theorem 3 and 3': Idempotency

- $x + x = x$
- $x \cdot x = x$

Theorem 4: Involution

- $(x')' = x$

Theorem 5 and 5': Complements

- $x + x' = 1$
- $x \cdot x' = 0$

Theorem 6 and 6': Commutativity

- $x + y = y + x$
- $x \cdot y = y \cdot x$

Theorem 7 and 7': Associativity

- $(x + y) + z = x + (y + z)$
- $(x \cdot y) \cdot z = x \cdot (y \cdot z)$

> Note that AND has precedence over OR

Theorem 8 and 8': Distributivity

- $x \cdot (y + z) = x \cdot y + x \cdot z$
- $x + (y \cdot z) = x + y \cdot x + z$

> Note OR distributes over AND, unlike addition and multiplication

Theorem 9 and 9': Covering

- $x + x \cdot y = x$
  - Proof:
    - $x \cdot 1 + x \cdot y = x \cdot (1 + y)$
    - $x \cdot (1 + y) = x \cdot 1 = x$
- $x \cdot (x + y) = x$

Theorem 10: Combining

- $x \cdot y + x \cdot y' = x$
  - Proof:
    - $x \cdot y + x \cdot y' = x \cdot (y + y')$
    - $x \cdot (y + y') = x \cdot 1 = x$
- $(x + y) \cdot (x + y') = x$

Theorem 11: Consensus

- $x \cdot y + x' \cdot z + y \cdot z = x \cdot y + x' \cdot z$
  - Proof:
    - If $y \cdot z = 0$ and $A + 0 = A$, then the $y \cdot z$
    term is irrelevant anyway
    - If $y \cdot z = 1$, both $y,z = 1$, and therefore
    $x \cdot y + x' \cdot z = x + x' = 1$
  - $y \cdot z$ is called the consensus of $x \cdot y$ and $x' \cdot z$
  - $y \cdot z$ is always equivalent to the preceding expression

Theorem 12: Generalized Idempotency

- $x + x + ... + x_{n} = x$
  - Proof by finite induction:
    - When n = 2:
      - $x + x = x$
    - When n = 3:
      - $x + x + x = (x + x) + x = x + x = x$
    - When n = i + 1, same logic applies

Theorem 13 and 13': DeMorgan's Theorem

- $(x_1 \cdot x_2 \cdot ... \cdot x_n)' = x_1' + x_2' + ... + x_n'$
- $(x_1 + x_2 + ... + x_n)' = x_1' \cdot x_2' \cdot ... \cdot x_n'$

- Example:
  - $(x \cdot y)' = x' \cdot y'$

Generalized DeMorgan's:

For $F(x,y,z,...,+,\cdot)$

Example:

- $F = (w' \cdot x) + (x \cdot y) + (w \cdot (x' + z'))$
- $F' = (w' \cdot x)' \cdot (x \cdot y)' \cdot (w \cdot (x' + z'))'$

## Simplifications

### Example

$$(v' + x) \cdot (w \cdot (y' + z)) + (v' + x) \cdot (w \cdot (y' + z))'$$

- Use distributivity to pull out $v' + x$

$$(v' + x) \cdot ((w \cdot (y' + z)) + (w \cdot (y' + z))')$$
