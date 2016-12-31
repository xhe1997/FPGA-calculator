module add(
	input [3:0] r1,
	input [3:0] r2,
	input [3:0] l1,
	input [3:0] l2,
	input [15:0] sw,
	output [3:0] sum,
	output [3:0] digit
)
	wire [3:0] a, b;
	mux2v mr(a,r1,r2,(sw[0]|sw[12]));
	mux2v ml(b,l1,l2,(sw[2]|sw[14]));
	halfadder ha(sum,,a,b);
	assign digit[0] = sw[1];
	assign digit[1] = sw[0];
	assign digit[2] = sw[15];
	assign digit[3] = sw[14];

endmodule
