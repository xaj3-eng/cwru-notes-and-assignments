# Parameterized Modules

Compile time parameters similar to java generics, but with values instead of
types

## Declaring Parameterized Modules

```sv
module param_example #(
  parameter N = 8;
) (
  input logic[N-1:0] a,
  input logic b,
  output logic[N-1:0] c
);

  assign c = a & {N{b}};

endmodule
```

## Using Parameterized Modules

```sv
module test();

  /* Initializing a, b, and c */ 

  param_example #(
    .N(8)
  ) U1 (
    .a(a),
    .b(b),
    .c(c),
  )
endmodule
```
