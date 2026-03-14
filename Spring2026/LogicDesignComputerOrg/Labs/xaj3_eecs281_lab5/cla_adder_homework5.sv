module cla_adder #(
    parameter N = 8
) (
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    input logic c_in,
    output logic [N-1:0] s,
    output logic c_out
);

  logic [N-1:0] p, g;
  logic [N:0] c;

  assign p = a ^ b;
  assign g = a & b;

  for (genvar i = 0; i <= N; i++) begin
    if (i == 0) assign c[i] = c_in;
    else assign c[i] = g[i-1] | (p[i-1] & c[i-1]);
  end

  assign s = p ^ c[N-1:0];
  assign c_out = c[N];
endmodule

