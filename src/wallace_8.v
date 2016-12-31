module wallace_8(p,negative,Asign,Bsign,a,b);

	input [7:0] a;
	input [7:0] b;
	input Asign, Bsign;
	output [15:0] p;
	output negative;

	wire 	a0_b0,a0_b1,a0_b2,a0_b3,a0_b4,a0_b5,a0_b6,a0_b7,
		a1_b0,a1_b1,a1_b2,a1_b3,a1_b4,a1_b5,a1_b6,a1_b7,
		a2_b0,a2_b1,a2_b2,a2_b3,a2_b4,a2_b5,a2_b6,a2_b7,
		a3_b0,a3_b1,a3_b2,a3_b3,a3_b4,a3_b5,a3_b6,a3_b7,
		a4_b0,a4_b1,a4_b2,a4_b3,a4_b4,a4_b5,a4_b6,a4_b7,
		a5_b0,a5_b1,a5_b2,a5_b3,a5_b4,a5_b5,a5_b6,a5_b7,
		a6_b0,a6_b1,a6_b2,a6_b3,a6_b4,a6_b5,a6_b6,a6_b7,
		a7_b0,a7_b1,a7_b2,a7_b3,a7_b4,a7_b5,a7_b6,a7_b7;
	
	

	xor x1(negative, Asign, Bsign);
	


	and a0(a0_b0, a[0],b[0]);
	and a1(a0_b1, a[0],b[1]);
	and a2(a0_b2, a[0],b[2]);
	and a3(a0_b3, a[0],b[3]);
	and a4(a0_b4, a[0],b[4]);
	and a5(a0_b5, a[0],b[5]);
	and a6(a0_b6, a[0],b[6]);	
	and a7(a0_b7, a[0],b[7]);
	and a8(a1_b0, a[1],b[0]);
	and a9(a1_b1, a[1],b[1]);
	and a10(a1_b2, a[1],b[2]);
	and a11(a1_b3, a[1],b[3]);
	and a12(a1_b4, a[1],b[4]);
	and a13(a1_b5, a[1],b[5]);
	and a14(a1_b6, a[1],b[6]);
	and a15(a1_b7, a[1],b[7]);
	and a16(a2_b0, a[2],b[0]);
	and a17(a2_b1, a[2],b[1]);
	and a18(a2_b2, a[2],b[2]);
	and a19(a2_b3, a[2],b[3]);
	and a20(a2_b4, a[2],b[4]);
	and a21(a2_b5, a[2],b[5]);
	and a22(a2_b6, a[2],b[6]);
	and a23(a2_b7, a[2],b[7]);
	and a24(a3_b0, a[3],b[0]);
	and a25(a3_b1, a[3],b[1]);
	and a26(a3_b2, a[3],b[2]);
	and a27(a3_b3, a[3],b[3]);
	and a28(a3_b4, a[3],b[4]);
	and a29(a3_b5, a[3],b[5]);
	and a30(a3_b6, a[3],b[6]);
	and a31(a3_b7, a[3],b[7]);
	and a32(a4_b0, a[4],b[0]);
	and a33(a4_b1, a[4],b[1]);
	and a34(a4_b2, a[4],b[2]);
	and a35(a4_b3, a[4],b[3]);
	and a36(a4_b4, a[4],b[4]);
	and a37(a4_b5, a[4],b[5]);
	and a38(a4_b6, a[4],b[6]);
	and a39(a4_b7, a[4],b[7]);
	and a40(a5_b0, a[5],b[0]);
	and a41(a5_b1, a[5],b[1]);
	and a42(a5_b2, a[5],b[2]);
	and a43(a5_b3, a[5],b[3]);
	and a44(a5_b4, a[5],b[4]);
	and a45(a5_b5, a[5],b[5]);
	and a46(a5_b6, a[5],b[6]);
	and a47(a5_b7, a[5],b[7]);
	and a48(a6_b0, a[6],b[0]);
	and a49(a6_b1, a[6],b[1]);	
	and a50(a6_b2, a[6],b[2]);
	and a51(a6_b3, a[6],b[3]);
	and a52(a6_b4, a[6],b[4]);
	and a53(a6_b5, a[6],b[5]);
	and a54(a6_b6, a[6],b[6]);
	and a55(a6_b7, a[6],b[7]);
	and a56(a7_b0, a[7],b[0]);
	and a57(a7_b1, a[7],b[1]);
	and a58(a7_b2, a[7],b[2]);
	and a59(a7_b3, a[7],b[3]);
	and a60(a7_b4, a[7],b[4]);
	and a61(a7_b5, a[7],b[5]);
	and a62(a7_b6, a[7],b[6]);
	and a63(a7_b7, a[7],b[7]);
	
	assign p[0]=a0_b0;


	wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, 
	     c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, 
	     c25, c26, c27, c28, c29, c30, c31, c32, c33, c34, c35, c36, c37, 
	     c38, c39, c40, c41, c42, c43, c44, c45, c46, c47, c48, c49, c50,
 	     c51, c52, c53, c54, c55, s0, s1, s2, s3, s4, s5, s6, s7, s8, s9,
 	     s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22,
 	     s23, s24, s25, s26, s27, s28, s29, s30, s31, s32, s33, s34, s35,
 	     s36, s37, s38, s39, s40, s41, s42, s43, s44, s45, s46, s47, s48, 
	     s49, s50, s51, s52, s53, s54, s55;

	halfadder h1(p[1],c0,a0_b1,a1_b0);
	fulladder f1(s1,c1,a1_b1,a2_b0,c0);
	fulladder f2(s3,c3,a2_b1,a3_b0,c1);
	fulladder f3(s6,c6,a3_b1,a4_b0,c3);
	fulladder f4(s10,c10,a4_b1,a5_b0,c6);
	fulladder f5(s15,c15,a5_b1,a6_b0,c10);
	fulladder f6(s21,c21,a6_b1,a7_b0,c15);
	fulladder f7(s28,c28,a6_b2,a7_b1,c21);
	fulladder f8(s35,c35,a6_b3,a7_b2,c28);
	fulladder f9(s41,c41,a6_b4,a7_b3,c35);
	fulladder f10(s46,c46,a6_b5,a7_b4,c41);
	fulladder f11(s50,c50,a6_b6,a7_b5,c46);
	fulladder f12(s53,c53,a6_b7,a7_b6,c50);
	fulladder f13(p[14],p[15],a7_b7,c53,c54);


	halfadder h2(p[2],c2,s1,a0_b2);
	fulladder f14(s4,c4,s3,a1_b2,c2);
	fulladder f15(s7,c7,s6,a2_b2,c4);
	fulladder f16(s11,c11,s10,a3_b2,c7);
	fulladder f17(s16,c16,s15,a4_b2,c11);
	fulladder f18(s22,c22,s21,a5_b2,c16);
	fulladder f19(s29,c29,s28,a5_b3,c22);
	fulladder f20(s36,c36,s35,a5_b4,c29);
	fulladder f21(s42,c42,s41,a5_b5,c36);
	fulladder f22(s47,c47,s46,a5_b6,c42);
	fulladder f23(s51,c51,s50,a5_b7,c47);
	fulladder f24(p[13],c54,s53,c51,c52);
	
	halfadder h3(p[3],c5,s4,a0_b3);
	fulladder f25(s8,c8,s7,a1_b3,c5);
	fulladder f26(s12,c12,s11,a2_b3,c8);
	fulladder f27(s17,c17,s16,a3_b3,c12);
	fulladder f28(s23,c23,s22,a4_b3,c17);
	fulladder f29(s30,c30,s29,a4_b4,c23);
	fulladder f30(s37,c37,s36,a4_b5,c30);
	fulladder f31(s43,c43,s42,a4_b6,c37);
	fulladder f32(s48,c48,s47,a4_b7,c43);
	fulladder f33(p[12],c52,s51,c48,c49);

	halfadder h4(p[4],c9,s8,a0_b4);
	fulladder f34(s13,c13,s12,a1_b4,c9);
	fulladder f35(s18,c18,s17,a2_b4,c13);
	fulladder f36(s24,c24,s23,a3_b4,c18);
	fulladder f37(s31,c31,s30,a3_b5,c24);
	fulladder f38(s38,c38,s37,a3_b6,c31);
	fulladder f39(s44,c44,s43,a3_b7,c38);
	fulladder f40(p[11],c49,s48,c44,c45);

	halfadder h5(p[5],c14,s13,a0_b5);
	fulladder f41(s19,c19,s18,a1_b5,c14);
	fulladder f42(s25,c25,s24,a2_b5,c19);
	fulladder f43(s32,c32,s31,a2_b6,c25);
	fulladder f44(s39,c39,s38,a2_b7,c32);
	fulladder f45(p[10],c45,s44,c39,c40);

	halfadder h6(p[6],c20,s19,a0_b6);
	fulladder f46(s26,c26,s25,a1_b6,c20);
	fulladder f47(s33,c33,s32,a1_b7,c26);
	fulladder f48(p[9],c40,s39,c33,c34);

	halfadder h7(p[7],c27,s26,a0_b7);
	halfadder h8(p[8],c34,s33,c27);
	

endmodule
