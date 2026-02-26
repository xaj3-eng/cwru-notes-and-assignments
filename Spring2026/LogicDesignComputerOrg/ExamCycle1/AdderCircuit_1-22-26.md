# Adder Circuits

## Adding 2 Binary Numbers with $n$ bits

- You need $n$ full adders
- You hook up all of the input bits to their corresponding adders
- You connect the 'carry outs' to the successive 'carry ins'
- You discard the MSB's carry out

## Subtracting 2 Binary Numbers with $n$ bits

Same as addition except for these changes

- Flip all of the bits for the number being subtracted
- Set the 'carry in' of the LSB's adder to 1, (never the case for adding)
