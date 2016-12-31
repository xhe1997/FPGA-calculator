module full_adder(sum, cout, a, b, cin);
    output sum, cout;
    input  a, b, cin;
    wire   partial_s, partial_c1, partial_c2;

    xor x0(partial_s, a, b);
    xor x1(sum, partial_s, cin);
    and a0(partial_c1, a, b);
    and a1(partial_c2, partial_s, cin);
    or  o1(cout, partial_c1, partial_c2);
endmodule // full_adder

`define ALU_ADD    3'h2
`define ALU_SUB    3'h3
`define ALU_AND    3'h4
`define ALU_OR     3'h5
`define ALU_NOR    3'h6
`define ALU_XOR    3'h7

// 01x - arithmetic, 1xx - logic
module alu1(out, carryout, A, B, carryin, control);
    output      out, carryout;
    input       A, B, carryin;
    input [2:0] control;

    // add code here!!!
    wire Bc;
    wire sum,cout;
    wire [1:0] controlc;
    wire lout;
    wire not_control2,v1,v2;

//arithmetric
	xor x1(Bc,B,control[0]);
	full_adder f(sum,cout,A,Bc,carryin);
	
//logic
	assign controlc[1:0]=control[1:0];
	logicunit l(lout,A,B,controlc);
	
//decision
	not n1(not_control2,control[2]);
	and a1(v1,not_control2,sum);
	and a2(v2,control[2],lout);
	or  o1(out,v1,v2);

//carryout
	assign carryout=cout;
	
endmodule // alu1
