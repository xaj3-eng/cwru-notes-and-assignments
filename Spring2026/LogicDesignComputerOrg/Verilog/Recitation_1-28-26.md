# Verilog Notes

C-style syntax

There are two data types:

- Wire (Simulates physical wire)
- Logic (Usually just use logic)

They each have four possible states:

- 0
- 1
- X (Unknown)
- Z (We'll learn)

## Modules

```verilog
module test_module(
  input logic A, B, C,
  output logic X
);

...

endmodule
```

## Assignment

```verilog
  assign Y = (A & B) | ~C;

  // Or

  always_comb begin
    Y = (A & B) | ~C;
  end
```

## Timing of Assignment

```verilog
  // Does Not Swap (Sequential)

  assign x = y;
  assign y = x;

  // Does Not Swap (Sequential)

  always_comb begin
    x = y;
    y = x;
  end

  // Does Swap (Assigns next yield, concurrently)

  always_comb begin;
    x <= y; // Note the "<="
    y <= x;
  end
```

## Calling Other Modules

```verilog
// Call testmodule
test_module(
  // I forgot syntax
)
```

## Add Delay and Timescale

```verilog
  `timescale 1ns/100ps // Sets the timescale to nanoseconds, with 100ps precision

module test();
  initial begin
    #5 a=0; // Delays 5 ns
    #2 b=1;
  end

  always begin;
    #2 b = ~b;
  end
endmodule
```

## Builtin $ Modules

```verilog
$display("Prints something");
$time // returns the current time
$montor("This prints something everytime a is changed", a);
```
