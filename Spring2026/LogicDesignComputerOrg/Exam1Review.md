# Exam 1 Review

## Positional Number Systems and Conversions

Ex. 1. $D98C_{16} = ?_2$

- $D = 1101, 9 = 1001, 8 = 1000, C = 1100$
- $D98C_{16} = 1101100110001100_2$

Ex. 2. $101110_2$ in two's complement, to decimal

- $= -32 + 8 + 4 + 2 = -18_{10}$

Ex. 3. Simplify $(a' + b) \cdot (a + b + c) \cdot c'$

- $(a' + b) \cdot (a \cdot c' + b \cdot c' + c \cdot c')$ By Distributivity
- $(a' + b) \cdot (a \cdot c' + b \cdot c')$ By Complements and Identities
- $c' \cdot (a' + b) \cdot (a + b)$ By Distributivity
- $c' \cdot (b + (a \cdot a'))$ By Distributivity
- $c' \cdot b$ By Complements and Identities

Ex. 4. $F = \sum_{A,B,C} (1,2,4,7)$, find the canonical product

- Use truth table or invert
- $F = \prod_{A,B,C} (0,3,5,6)$
- $F = (a + b + c) \cdot (a + b' + c') \cdot (a' + b + c') \cdot (a' + b' + c)$

Notes:

- If you want to implement something with NAND gates, start with sum of products
- If you want to implement something with NOR gates, start with product of sums
