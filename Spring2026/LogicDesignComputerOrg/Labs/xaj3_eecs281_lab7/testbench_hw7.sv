module testbench_hw7 ();
  logic clk, en_b;
  logic up;

  logic load4_b;
  logic [3:0] load_in4;
  logic [3:0] q4;
  logic rco4_b;

  logic load5_b;
  logic [4:0] load_in5;
  logic [4:0] q5;
  logic rco5_b;


  up_down_counter #(
      .N(4)
  ) counter4 (
      .clk    (clk),
      .en_b   (en_b),
      .load_b (load4_b),
      .up     (up),
      .load_in(load_in4),
      .q      (q4),
      .rco_b  (rco4_b)
  );

  up_down_counter #(
      .N(5)
  ) counter5 (
      .clk    (clk),
      .en_b   (en_b),
      .load_b (load5_b),
      .up     (up),
      .load_in(load_in5),
      .q      (q5),
      .rco_b  (rco5_b)
  );

  initial begin
    clk      = 1'b0;
    en_b     = 1'b1;
    load4_b  = 1'b0;
    load5_b  = 1'b0;
    up       = 1'b1;
    load_in4 = 4'b0000;
    load_in5 = 5'b00000;

    forever #5 clk = ~clk;
  end

  initial begin

    #10;
    load4_b = 1'b0;
    load5_b = 1'b0;
    #10;
    en_b = 1'b0;
    #10;
    load4_b = 1'b1;
    load5_b = 1'b1;
    #320;
    en_b     = 1'b1;
    up       = 1'b0;
    load4_b  = 1'b0;
    load5_b  = 1'b0;
    load_in4 = 4'b1111;
    load_in5 = 5'b11111;
    #10;
    en_b = 1'b0;
    #10;
    load4_b = 1'b1;
    load5_b = 1'b1;
    en_b    = 1'b1;
    #10;
    en_b = 1'b0;
    #320;
    load4_b  = 1'b0;
    load5_b  = 1'b0;
    load_in4 = 4'b1010;
    load_in5 = 5'b01010;
    #10;
    load4_b = 1'b1;
    load5_b = 1'b1;
    #10;
    up       = 1'b1;
    load4_b  = 1'b0;
    load5_b  = 1'b0;
    load_in4 = 4'b0101;
    load_in5 = 5'b10101;
    #10;
    load4_b = 1'b1;
    load5_b = 1'b1;
    #14;
    $finish();
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench_hw7);

    $display(
        "CLOCK | Enable | Up |  Q4  | Load Bit: 4 | Load Input: 4 | RCO 4 |   Q5   | Load Bit: 5 | Load Input: 5 | RCO 5");
    $monitor(
        " %1b    | %1b      | %1b  | %4b |    %4b     |     %4b      | %4b  | %5b  |    %5b    |     %5b     | %5b   ",
        clk, en_b, up, q4, load4_b, load_in4, rco4_b, q5, load5_b, load_in5, rco5_b);

    #744;
    $finish();
  end

endmodule
