module full_adder (
    input logic [3:0] A,
    input logic [3:0] B,
    output logic [3:0] sum,
    output logic carry_out
);
  logic [3:0] C = 4'b0000;
  and U[4] (sum, A, B);
endmodule
