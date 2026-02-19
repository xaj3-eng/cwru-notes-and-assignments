# Decoders

## What are Decoders?

- Multi-input, multi-output devices
- Convert coded inputs to coded outputs
- Generally, input has fewer bits than the output
- One-to-one mapping from input to output
- Example: Seven-Segment-Display Decoder

## Binary Decoders

The most common decoder is a binary decoder; 0 $n$-to-$2^n$ decoder

For a binary decoder: output is 1-out-of-m code; the possible outputs look like
this:

- for $n=2, m=4$: 0001, 0010, 0100, 1000.

```
                     -------------                           
        enable    ---|          0|---
                     |           |---
                     |          .|---
                  ---|0         .|---
                     |.         .|--- 2^n outputs
         inputs      |.          |---
                     |.          |---
                  ---|n-1     2^n|---
                     -------------
```

For a binary decoder:

If we have n inputs, we will have $2^n$ outputs only one of which will be
asserted at a time if the decoder is enabled. e.g. 2-to-4 binary decoder with a
single active high enable, active-high inputs. All outputs are active high.

Here is an example truth table for an **active high** binary decoder, $n=2$

### Truth Table: Active High

| $EN$ | $I_1$ | $I_0$ | $y_3$ | $y_2$ | $y_1$ | $y_0$ |
| :--: | :--: | :--: | :--: | :--: | :--: | :--: |
| 0 | X | X | 0 | 0 | 0 | 0 |
| **1** | 0 | 0 | 0 | 0 | 0 | **1** |
| **1** | 0 | **1** | 0 | 0 | **1** | 0 |
| **1** | **1** | 0 | 0 | **1** | 0 | 0 |
| **1** | **1** | **1** | **1** | 0 | 0 | 0 |

> Note: If Enabled is 0, we don't care what the inputs are, we just return all
> 0s (i.e. the inactive values, not the asserted values);
> The active low truth table looks the same, except the outputs are complemented

### Example

$$F = X \cdot Y \cdot Z + X \cdot Y' \cdot Z = \sum_{X,Y,Z} (5,7)$$

Implement $F(X,Y,Z)$ using a 3-to-8 binary decoder and one external gate. All
inputs and outputs are active high.

$$B: B^4 -> B^8$$
$$B(E,X,Y,Z) = (o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8)$$

B is a 3-to-8 binary decoder

$$F = B_5 + B_7$$

> If this was an active low circuit, you would use a NAND gate as opposed to an
> OR.

## Definitions

- **Asserted**: A signal is asserted when it's at its active level.
- **Active Level**: Determines when a signal is considered active.
  - **Active High**: If the signal performs the named action or denotes a named
    condition when it is **high**.
  - **Active Low**: If the signal performs the named action or denotes a named
    condition when it is **low**.
