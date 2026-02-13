module module_b(
	input logic a, b,
	output logic y1, y2, y3
);

	always_comb begin
		y1 = a & b;
		y2 = a | b;
		y3 = a ^ b;
	end

endmodule