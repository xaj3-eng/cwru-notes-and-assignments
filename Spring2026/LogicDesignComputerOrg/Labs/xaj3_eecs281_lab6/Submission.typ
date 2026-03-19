#show title: set align(center)

#title[
  #set text(22pt)
  Lab 6: Decoders and Encoders
]

#set raw(block: true)

= Screenshot of Output

#image("OutputScreenshot.png")

= `lab6.sv`

```sv
module lab6 ();

  function logic [7:0] decoder3to8(logic en_b, logic [2:0] in);
    casex ({
      en_b, in
    })
      4'b1xxx: return 8'b1111_1111;
      4'b0000: return 8'b1111_1110;
      4'b0001: return 8'b1111_1101;
      4'b0010: return 8'b1111_1011;
      4'b0011: return 8'b1111_0111;
      4'b0100: return 8'b1110_1111;
      4'b0101: return 8'b1101_1111;
      4'b0110: return 8'b1011_1111;
      4'b0111: return 8'b0111_1111;
      default: return 8'b1111_1111;
    endcase
  endfunction

  function logic [2:0] encoder8to3(logic en_b, logic [7:0] in_b);
    casex ({
      en_b, in_b
    })
      9'b1_xxxxxxxx: return 3'b111;
      9'b0_0xxxxxxx: return 3'b111;
      9'b0_10xxxxxx: return 3'b110;
      9'b0_110xxxxx: return 3'b101;
      9'b0_1110xxxx: return 3'b100;
      9'b0_11110xxx: return 3'b011;
      9'b0_111110xx: return 3'b010;
      9'b0_1111110x: return 3'b001;
      9'b0_11111110: return 3'b000;
      default: return 3'b000;
    endcase
  endfunction

  logic [2:0] in, out;
  logic [7:0] d_out;
  logic clk;

  always_comb begin
    d_out = decoder3to8(~clk, in);
    out   = encoder8to3(~clk, d_out);
  end

  initial begin
    clk = 1'b1;
    in  = 3'b111;
    forever #5 clk = ~clk;
  end

  always @(posedge clk) in += 1;


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, lab6);

    $display("CLOCK |  IN  |  Decoder OUT  |  Encoder OUT  ");
    $monitor("   %1b  | %3b |   %8b    |      %3b      ", clk, in, d_out, out);

    #82 $finish();
  end

endmodule
```
