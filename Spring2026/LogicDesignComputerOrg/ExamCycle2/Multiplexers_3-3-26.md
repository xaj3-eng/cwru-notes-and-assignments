# Multiplexers

We will select one data source out of $n$ different sources, each sending $b$ bits
of data and output the b-bit data that was inputted by that particular data
source.

Pretty much, you're given multiple multi-bit inputs. Then you pick one with the
selection input. Let's say you input 4 4-bit numbers, then there is a 2-bit
select input where you pick which of the four inputs you want.

## Designing Multiplexers

### Example 1: 2x1 Multiplexer

- **Input**:
  - 2 1-bit data sources: $D_0, D_1$
  - 1-bit select: $S$; $S = log_2(2)=1$
  - 1-bit enable: $EN$
- **Output**:
  - 1-bit output: $Y$

| $EN$ | $S$ | $Y$ |
| :---------------: | :---------------: | :---------------: |
| 0 | X | 0 |
| 1 | 0 | $D_0$ |
| 1 | 1 | $D_1$ |

$$Y=EN \cdot S' \cdot D0 + EN \cdot S \cdot D1$$

How would this change if each source supplied two bits instead of one?

- You would just duplicate this circuit, with the first bit of $D_0 / D_1$
outputted by the first circuit, and the second bit outputted by the second.

### Example 2: 4x1 Multiplexer

- **Input**:
  - 4 1-bit data sources: $D_0, D_1$
  - 2-bit select: $S$; $S = log_2(4)=2$
  - 1-bit enable: $EN$
- **Output**:
  - 1-bit output: $Y$
- $Y =$
  - $EN \cdot S_1' \cdot S_0' \cdot D_0 +$
  - $EN \cdot S_1' \cdot S_0 \cdot D_1 +$
  - $EN \cdot S_1 \cdot S_0' \cdot D_2 +$
  - $EN \cdot S_1 \cdot S_0 \cdot D_3 +$

For $n$ sources with $b$-bit data:

- $J=0,1,...,n-1$
- $i=1,2,...,b$

$iY = \sum_{j=0}^{n-1} EN \cdot \mu _j \cdot iD_j$, Where:

- $iY$ is a particular output bit $1 <= i <= b$
- $iD_j$ is the input bit $i$ from source $j, 0<=j<=n-1$
- $\mu _j$ is the $j$th minterm of the S select bits.

## Using Multiplexers

### Example 3: Using Large Multiplexer (Unconstrained Size)

Design the sum output of a **full adder** using an 8-to-1 multiplexer. logic 0 and 1
are available.

| $a$ | $b$ | $c_{in}$ | $sum$ |
| :--: |:--: |:--: |:--: |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 1 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 1 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 1 |

This is the simplest problem ever actually. You just set the source inputs the
corresponding sum values, so $[0,1,1,0,1,0,0,1]$ and then set the select values
to $a,b,c_{in}$. So it literally just picks a value from the output set

Also, this is super technically inefficient. See next example

### Example 4: Using a Smaller Multiplexer and NOT Gates

Design the sum output of a **full adder** using an 8-to-1 multiplexer and NOT gates. logic 0 and 1
are available.

- Source Inputs: $[c, c', c', c]$
- Select Inputs: $a,b$

### Example 5: Building an 8-input 1-bit Multiplexer

- Active Low Enable
- Outputs both high and low version of inputs

```sv
module mux8x1(
  input logic en_l,
  input logic[2:0] s,
  input logic[7:0] d,
  output logic y, y_l
)
    assign y = ~en_l & d[s];
    assign y_l = ~y;
endmoule
```

Just do EN_L' AND {correct select combination} AND D{i} for everything and do the
sum of products.

### Example 6: Building a 2-input 4-bit Multiplexer

For every output, do EN_L' AND S' AND D0 OR EN_L' AND S AND D1
