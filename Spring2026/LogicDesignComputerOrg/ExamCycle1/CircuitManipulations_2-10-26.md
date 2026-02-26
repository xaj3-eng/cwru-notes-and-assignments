# Circuit Manipulations

- If you add a NOT gate in the middle of a circuit, you can undo it with
another NOT.
- An OR gate with inverted inputs is a NAND gate.
- An AND gate with inverted inputs is a NOR gate

If you can only use certain gates, use double NOT GATES,
and then push the NOT's back to the gates, and invert them

I got lost kinda mb

## Example

$$F = A' \cdot B' \cdot C + D'$$
$$= (A + B)' \cdot C + D'$$
$$= (A + B)' \cdot (C' \cdot D)'$$
