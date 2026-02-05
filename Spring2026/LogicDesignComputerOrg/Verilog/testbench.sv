`timescale 1ns / 100ps

module testbench (
    input  logic X,
    input  logic Y,
    output logic A
);

  assign A = X & Y;

endmodule
