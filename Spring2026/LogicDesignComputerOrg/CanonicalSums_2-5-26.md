# Canonical Sums and Min/Max terms

## Review

### DeMorgan's

$$(A + B)' = A' \cdot B'$$

$$(A \cdot B)' = A' + B'$$

In Other Words:

- NOR = AND with inverted inputs
- NAND = OR with inverted inputs

### Simplification Example

$$F = [ (A' + B')' + (A' \cdot B' \cdot C)' + C' \cdot D]'$$

- Use DeMorgan's to simplify inside the square brackets:

$$F = [ A \cdot B + A + B + C' + C' \cdot D]'$$

- Use Covering: $A \cdot B + A = A$

$$F = [ A + B + C']'$$

- Use DeMorgan's to simplify:

$$F = A' \cdot B' \cdot C$$

### Truth Tables

> Professor likes it if you start with (0,0,0), then (0,0,1), (0,1,0), and so on
where the left most bit is the most significant

Prime Number Detector:

|$X$|$Y$|$Z$|$F(X,Y,Z)$|
|---------------|---------------|---------------|---------------|
|0|0|0|0|
|0|0|1|0|
|0|1|0|1|
|0|1|1|1|
|1|0|0|0|
|1|0|1|1|
|1|1|0|0|
|1|1|1|1|

## Definitions

- Literal: A variable or complement in an expression:
  - $A + B' + C$ is a three literal expression
- Product Term: A single literal or logical product of two or more literals,
  - $A'$, $X \cdot Y \cdot Z'$ are product terms
- Sum Term: A single literal or logical sum of two or more literals,
  - $A'$, $X + Y + Z'$ are sum terms
- Sum of products expression: logical sum of product terms,
$A' + B \cdot C \cdot D' + A \cdot D$ is a sum of products expression
- Product of sums expression: logical sum of product terms,
  - $A' \cdot (B + C + D') \cdot (A + D)$ is a product of sums expression
- Normal Term: A product of some term in which no variable appears more
than once:
  - $W \cdot X \cdot X \cdot Y'$ is not normal
  - $W \cdot X \cdot Y'$ is normal
- N-variable minterm: Normal product term with n literals that is
1 in exactly one row of the truth table
  - Minterms single out a specific combination of inputs
  - There are $2^n$ such terms
- N-variable maxterm: Normal sum term with n literals that is 0
in exactly one row of the truth table
  - There are $2^n$ such terms

## Building the Prime Number Detector

| $X$ | $Y$ | $Z$ | Minterm |
| :--: | :--: | :--: | :--: |
| 0 | 0 | 0 | $X' \cdot Y' \cdot Z'$ |
| 0 | 0 | 1 | $X' \cdot Y' \cdot Z$ |
| 0 | 1 | 0 | $X' \cdot Y \cdot Z'$ |
| 0 | 1 | 1 | $X' \cdot Y \cdot Z$ |
| 1 | 0 | 0 | $X \cdot Y' \cdot Z'$ |
| 1 | 0 | 1 | $X \cdot Y' \cdot Z$ |
| 1 | 1 | 0 | $X \cdot Y \cdot Z'$ |
| 1 | 1 | 1 | $X \cdot Y \cdot Z$ |

### Canonical Sum

> The sum of all minterms for the values that should return 1

Canonical Sum for prime number detector: Sum of minterms for 2, 3, 5, 7

$$ F = X' \cdot Y \cdot Z' + X' \cdot Y \cdot Z +
X \cdot Y' \cdot Z + X \cdot Y \cdot Z$$

$$ F = X' \cdot Y + X \cdot Z$$

### Alternative Canonical Sum Notation

> If an exam question asks for the canonical sum, it doesn't want this,
it wants the notation above

Read as "The logical sum of product terms 2, 3, 5, and 7"

$$F = \sum_{X,Y,Z}(2,3,5,7)$$

- This canonical sum can be created from a truth table
- A truth table can be created from the canonical sum

Example: $F = \sum_{X,Y,Z}(1,2,6)$

$$F = X' \cdot Y' \cdot Z + X' \cdot Y \cdot Z' + X \cdot Y \cdot Z'$$
