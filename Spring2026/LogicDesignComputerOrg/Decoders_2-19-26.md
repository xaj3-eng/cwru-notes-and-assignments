# Decoders and Encoders

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

```txt
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
> inactives (i.e. not the asserted values);
> The active low truth table looks the same, except the outputs are complemented

### Example 1

$$F = X \cdot Y \cdot Z + X \cdot Y' \cdot Z = \sum_{X,Y,Z} (5,7)$$

Implement $F(X,Y,Z)$ using a 3-to-8 binary decoder and one external gate. All
inputs and outputs are active high.

$$B: B^4 -> B^8$$
$$B(E,X,Y,Z) = (o_1,o_2,o_3,o_4,o_5,o_6,o_7,o_8)$$

B is a 3-to-8 binary decoder

$$F = B_5 + B_7$$

> If this was an active low circuit, you would use a NAND gate as opposed to an
> OR.

### Example 2: 74x138

Inputs: G1, G2A_L, G2B_L, C (MSB), B, A (LSB)
Outputs: Y7_L, Y6_L, Y5_L, Y4_L, Y3_L, Y2_L, Y1_L, Y0_L

Circuit for Y0_L: $G1' + G2A_L + G2B_L + C + B + A$

Or you could create a separate combinational circuit for 'enabled':

$$EN=(G1'+G2A_L+G2B_L)'$$

### Example 3: Using 3 to 8 Binary Decoder

Design $F=X \cdot Y' + Y \cdot Z'$ using a 74x138 and one external gate

$$F = X \cdot Y' \cdot Z + X \cdot Y' \cdot Z' + X' \cdot Y \cdot Z' + X \cdot Y
\cdot Z'$$

$$F = \sum_{X,Y,Z} (2,4,5,6)$$

$$B_o = B(1,0,0,Z,Y,X)$$
$$F = (B_2 \cdot B_4 \cdot B_5 \cdot B_6)'$$

F uses one 74x138 and one NAND gate. (NAND gate functions like an OR because the
74x138 is active low)

|  | $F=1$ | $F=0$ |
| :--: | :--: | :--: |
| Active High Outputs | OR | NOR |
| Active Low Outputs | NAND | AND |

### Example 4: Using 2x4 Decoders to Build 4x16 Decoders

```sv
module four_by_sixteen(
  input logic en,
  input logic[3:0] in,
  output logic[15:0] out,
);

  logic[3:0] lvl2en;

  two_by_four U1 (
    .en(en),
    .in(in[3:2]),
    .out(lvl2en)
  );

  two_by_four ULVL2[3:0] (
    .en(lvl2en),
    .in(in[1:0]),
    .out(out)
  );
endmodule;
```

### Example 5: Encoders

Design an 8x3 binary **ENCODER** that is the inverse of a 3x8 binary decoder.

> Note: You run into problems when more than 1 input is active. We can get
> around this with "Request Encoders"/"Priority Encoders"

Priority Encoders: In order to achieve the above functionality, we need to
assign Priority to the inputs. e.g. we will design an 8-to-3 encoder by assuming
I7 has the highest priority, and cascading down.

To design a priority encoder, we need to define intermediate variables:

$H_i=1$ if $I_i$ is the highest priority input in that specific situation.
Meaning that if $H_6=1$ and $I_6$ is asserted, then the output must be 6.

$$H_7 = I_7$$
$$H_6 = I_7' \cdot I_6$$
$$H_5 = I_7' \cdot I_6' \cdot I_5$$
$$...$$
$$H_0 = I_7' \cdot I_6' \cdot I_5' \cdot ... \cdot I_0$$

$$Y_0 = H_1 + H_3 + H_5 + H_7$$
$$Y_1 = H_2 + H_3 + H_6 + H_7$$
$$Y_2 = H_4 + H_5 + H_6 + H_7$$

> Or the opposite for active low

> Even the outputs can be active low, meaning $I_7$ could correspond to 000

Group Select Bit: The output bit for encoders called "group select" is asserted
whenever the encoder is enabled and at least one input is asserted.

Output Enabled Bit: Active whenever the encoder is active

## Definitions

- **Asserted**: A signal is asserted when it's at its active level.
- **Active Level**: Determines when a signal is considered active.
  - **Active High**: If the signal performs the named action or denotes a named
    condition when it is **high**.
  - **Active Low**: If the signal performs the named action or denotes a named
    condition when it is **low**.
  - Active level can be applied to both the inputs and outputs of decoders (i.e.
    the enables and the outputs). If an input/output is denoted with a '_L', then
    it is active low, otherwise, it is usually active high. A bar over an
    input/output also denotes active low.
- **Group Select Bit**: An output bit for encoders. It's asserted
  whenever the encoder is enabled and at least one input is asserted.
- **Output Enable Bit**: Asserted whenever the encoder is enabled
