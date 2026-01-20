# Signed Binary Numbers

## Binary Addition Review

$$
0111+1001=10000
$$

## Full Adder

The full adder is the same as a half adder, with the addition
of the carry input bit

### Truth Table for Full Adder

The following is called a "truth table". It just shows the corresponding
outputs for **ALL POSSIBLE** inputs

|Input 1|Input 2|Carry Input|Output (Carry Out, Sum)|
|:-:|:-:|:-:|:-:|
|0|0|0|00|
|1|0|0|01|
|0|1|0|01|
|0|0|1|01|
|1|1|0|10|
|1|0|1|10|
|0|1|1|10|
|1|1|1|11|

### How to get to the output given the inputs

Observations:

- When there are an odd number of '1' inputs, then the sum bit is 1
- When there are 2 or more '1' inputs, then the carry out bit is 1

## Binary Subtraction

### Example

$$
11100101-00101110=10110111
$$

### Truth Table

Instead of a carry bit, you have a "burrow" bit, coming from the
rightmore bit. This means that it subtracts an additional 1 from the
left bit, adding 2 (10) to the right bit

|Input 1|Input 2|Burrow In|Output (Burrow Out, Difference)|
|:-:|:-:|:-:|:-:|
|0|0|0|00|
|1|0|0|01|
|0|1|0|11|
|0|0|1|11|
|1|1|0|00|
|1|0|1|00|
|0|1|1|10|
|1|1|1|11|

## Signed Binary Numbers

There are two representations for signed binary numbers:

- Sign-magnitude representation
- 2's complement representation (radix complement)

### Sign-Magnitude Representation

> Just let the first bit be the minus sign

- The first bit is the sign bit
  - 0 = '+'
  - 1 = '-'
- The rest of the bits are magnitude bits
- $-85_{10} = 1101010_2$
- There are an equal number of positive and negative bits represented

There is some inefficiency: for $n$ bits, you can represent $2^n - 1$ numbers

- Normally you can represent $2^n$ numbers where n is the number of bits
- But in this representation you can represent $2^n-1$
  - 0 is represented twice
  - $000_2 = 100_2 = 0$

> **Sign-Magnitude Representation is not a very good representation for circuits**

### Complement Number Representation

> Negate numbers by taking their complement

- In this representation, numbers can be added or subtracted directly
without sign checks
- We will deal with a fixed number of bits, $n$
- If an operation produces a result with more than $n$ bits, we will throw away
the extra high-order digit

The complement of a number D with radix R:
$$= r^n - D$$

Cool little shortcut, the complement of each digit d:
$$= r - 1 - d$$

For binary this means that the complement of a number is the same representation
except all 1s and 0s are flipped

### 2's Complement Representation (Radix Complement Representation for non-binary)

The most significant bit is represents $2^{n-1}$

- The most significant bit just represents positive or negative:
  - 0 = positive
  - 1 = negative
- The magnitude is represented as the complement + 1 if the number is negative

Positive numbers will look the same

$$3_{10} = 0011_2$$

- To find the negative number from a positive number, do the following:
  - Step 1: Complement every digit, meaning flip every bit
  - Step 2: Add 1
  - Ex: $3_{10} = 0011_2, -3_{10} = 1100_2 + 1_2 = 1101_2$
  - First bit / MSB represents $-8$

Calculate decimal equivalent by summing all bit values like normal, but
MSB is treated as $-2^{n-1}$

This representation is completely efficient because all $2^n$ values are
represented

- There is no negative 0 value
- There is an additional negative number represented
