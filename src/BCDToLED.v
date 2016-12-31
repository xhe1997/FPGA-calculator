module BCDToLED(
	input [3:0] x,
	output [6:0] seg,
	output [3:0] an
	);
	assign seg[0]=(x[2]&~x[1]&~x[0])|(~x[3]&~x[2]&~x[1]&x[0]);
	assign seg[1]=(x[2]&~x[1]&x[0])|(x[2]&x[1]&~x[0]);
	assign seg[2]=~x[2]&x[1]&~x[0];
	assign seg[3]=(x[2]&~x[1]&~x[0])|(~x[2]&~x[1]&x[0])|(x[2]&x[1]&x[0]);
	assign seg[4]=x[0]|(x[2]&~x[1]);
	assign seg[5]=(x[0]&~x[3]&~x[2])|(x[1]&x[0])|(~x[2]&x[1]);
	assign seg[6]=(~x[1]&~x[3]&~x[2])|(x[2]&x[1]&x[0]);

	assign an[3:0]=4'b1110;

endmodule
