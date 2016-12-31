// 00 - AND, 01 - OR, 10 - NOR, 11 - XOR
module logicunit(out, A, B, control);
    output      out;
    input       A, B;
    input [1:0] control;

	wire not_A,not_B,w1,w2;
	wire v1,v2,v3,v4;	
	wire u1,u2,u3,u4;
	wire x1,x2,x3,x4;
	
	not n1(not_A,A);
	not n2(not_B,B);
//and
	and	a1(v1,A,B);
//or
	or	o1(v2,A,B);
//nor
	and	a2(v3,not_A,not_B);
//xor
	and	a3(w1,A,not_B);
	and	a4(w2,not_A,B);
	or	o2(v4,w1,w2);

	assign	u1=(control==2'b00);
	assign	u2=(control==2'b01);
	assign	u3=(control==2'b10);
	assign	u4=(control==2'b11);
	
	and	a5(x1,u1,v1);
	and	a6(x2,u2,v2);
	and	a7(x3,u3,v3);
	and	a8(x4,u4,v4);
	
	or	o3(out,x1,x2,x3,x4);
	
endmodule // logicunit
