# Positional Number Systems

A **positional number system** is a system where the position of each
digit matters and there is a specific base/radix

The **base/radix** is the amount of possible digits at each position

Starting from the right digit with 0, you take the digit and multiply by $base^0$,
then move left and increment the power

$ 281_{10} = 2*10^2+8*10^1+1*10^0 $

$ (d_3 d_2 d_1 d_0)_r => D = d_3 * r^3 + d_2 * r^2 + d_1 * r^1 + d_0 $

$ (d_p d_p-1 ... d_0)_r => D = \sum_{i=0}^{p} d_i * r^i $

- Left most digit is called "the **most significant digit**"
- Right most digit is called "the **least significant digit**"

Numbers to the right of the {base} point mean powers go into the negatives

## Binary

In digital circuits, everything is either charged or discharged, no in between,
everything is binary:

- 0 / 1
- High / Low
- On / Off

In Binary, the base is 2 (r = 2), and every digit is called a **bit**.

> Right now we're only dealing with unsigned numbers

$ 1100_2 = 2^3 + 2^2 + 0 + 0 = 12_10 $

$ 101.101_2 = 2^2 + 2^0 + 2^-1 + 2^{-3} = 5.625 $

## Octal

In Octal, the base is 8 (r = 8) and the set of possible digits is
$ \{0, 1, 2, 3, 4, 5, 6, 7\} $

Each octal digit can be uniquely represented using 3-bit binary numbers:

|Octal Digit|Binary Three Digits|
|:-:|:-:|
|0|000|
|1|001|
|2|010|
|3|011|
|4|100|
|5|101|
|6|110|
|7|111|

### Ex. Convert from Octal to Binary

- $354_8 = 011, 101, 100 = 011101100_2$
- $10110010_2 = 2, 6, 2 = 262_8$
- Tip: Go first from the binary point to the left, then from the
binary point to the right
- $1011.10_2 = 001, 011, ., 100 = 1, 3, ., 4 = 134_8$

### Ex. Convert from Octal to Decimal

- $ 102_8 = 1*8^2 + 2*8^0 = 72_{10} $

## Hexadecimal

In Hexadecimal, the base is 16 (r = 16) and the digits are
$ \{0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f\} $

|Hexadecimal Digit|Decimal Number|
|:-:|:-:|
|0|0|
|1|1|
|...|...|
|9|9|
|a|10|
|b|11|
|c|12|
|d|13|
|e|14|
|f|15|

### Alternative notation

- c0ffee$_{16}$ = "0xc0ffee"

### Ex. Converting Hexadecimal

- $ c_{16} = 12_{10} = 1100_2 $
- $ f_{16} = 15_{10} = 1111_2 $
- $ 2f_{16} = 47_{10} $
- $ ac91_{16} = 1010110010010001_2 = 126221_8 $

## Bits and Bytes

1 bit is 1 digit in binary

1 **byte** is 8 bits or 8 digits in binary

Because every hexadecimal digit represents 4 digits in binary,
**every pair of two hexadecimal digits is a byte**

4 bits are called a **"nibble"**

## Converting from decimal

- Least significant digit = num % $16$
- Divide by $16$ and discard remainder
- Repeat to get leftmore digit

### Ex. Binary

- $54_{10} = ?_2$
  - $54 mod 2 = 0$, least significant bit is zero: $...0$
  - $27 mod 2 = 1$: $...10_2$
  - $13 mod 2 = 1$: $...110_2$
  - $6 mod 2 = 0$: $...0110_2$
  - $3 mod 2 = 1$: $...10110_2$
- Final Answer: $110110_2$

### Ex. Hexadecimal

- $527_{16} = 527 mod 16 + (8 mod 16 * 16) = 8f_{16}$

### Ex. Octal

- $467_{10} = ?_8$
  - $467 mod 8 = 3$: $...3$
  - $58 mod 8 = 2$: $...23$
  - $7 mod 8 = 7$: $723$
- Final Answer: $723$

## Binary Addition>

It's the same as regular addition, but you carry when you get to two. :astonished:

### Half Adder

|First Input|Second Input|Output Binary|
|:-:|:-:|:-:|
|0|0|00|
|1|0|01|
|0|1|01|
|1|1|10|

The left output bit is called carry out

### Full Adder

Same as half adder, but there is also a "carry in" bit.
