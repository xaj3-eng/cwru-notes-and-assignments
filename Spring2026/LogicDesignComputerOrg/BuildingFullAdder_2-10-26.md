# Building a Multi-Bit Full Adder

## Full Adder ($n=4$)

| Row | $a$ | $b$ | $c_{in}$ | $c_{out}$ | $s$ | Minterms | Maxterms |
| -- | -- | -- | -- | -- | -- | ---- | ---- |
| 0 | 0 | 0 | 0 | 0 | 0 | $a' \cdot b' \cdot c'$ | $a + b + c$ |
| 1 | 0 | 0 | 1 | 0 | 1 | $a' \cdot b' \cdot c$ | $a + b + c'$ |
| 2 | 0 | 1 | 0 | 0 | 1 | $a' \cdot b \cdot c'$ | $a + b' + c$ |
| 3 | 0 | 1 | 1 | 1 | 0 | $a' \cdot b \cdot c$ | $a + b' + c'$ |
| 4 | 1 | 0 | 0 | 0 | 1 | $a \cdot b' \cdot c'$ | $a' + b + c$ |
| 5 | 1 | 0 | 1 | 1 | 0 | $a \cdot b' \cdot c$ | $a' + b + c'$ |
| 6 | 1 | 1 | 0 | 1 | 0 | $a \cdot b \cdot c'$ | $a' + b' + c$ |
| 7 | 1 | 1 | 1 | 1 | 1 | $a \cdot b \cdot c$ | $a' + b' + c'$ |

Because there are two outputs, we will need two canonical sums and products.

> Reminder about Canonical Sum Notation: the inputs go on the bottom of the sum,
you sum the minterms associated with the row values getting summed

$s$:

- Canonical Sum: $s = \sum_{a,b,c_{in}} (1,2,4,7)$
- Canonical Product: $s = \prod_{a,b,c_{in}} (0,3,5,6)$

$c_{out}$:

- Canonical Sum of: $c_{out} = \sum_{a,b,c_{in}} (3,5,6,7)$
- Canonical Product: $c_{out} = \prod_{a,b,c_{in}} (0,1,2,4)$

### XOR

| $x$ | $y$ | $x \oplus y$ |
| --------------- | --------------- | --------------- |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

$$x \oplus y = x' \cdot y + x \cdot y'$$

Returning to the canonical sum for $s$ in the full adder...

$$s = a'b'c + a'bc' + ab'c + abc$$
$$s = c'(a'b + ab') + c(a'b' + ab)$$
$$s = c'(a \oplus b) + c(a \oplus b)'$$
$$s = (a \oplus b) \oplus c$$

## Multi-Bit Full Adder

It's just a bunch of single bit full adders, but the carry out of the less
significant bit is the carry into the more significant bit.

> In Verilog, you will create vectors of bits that represent the two
numbers being added (A and B). You will output a vector of bits as the sum
(s). You will need an addition intermediate vector that stores the carries
(c)
