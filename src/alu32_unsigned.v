module alu32_unsigned(out, negative, A, B, control_ori, Asign, Bsign);
    output [31:0] out;
//    output        overflow, negative;
    output negative;
    input  [31:0] A, B;
    input   Asign, Bsign;
    input   [2:0] control_ori;



wire negative_temp;
wire [2:0] control;
wire [2:0] control_temp;
wire plus_temp = (control_ori==3'b010);
wire minus_temp = (control_ori==3'b011);

wire A_plus_B_plus = Asign & Bsign;
wire A_plus_B_minus = Asign & ~Bsign;
wire A_minus_B_plus = ~Asign & Bsign;
wire A_minus_B_minus = ~Asign & ~Bsign;

mux2v #(3)m2(control_temp, control_ori, 3'b011, plus_temp & (A_plus_B_minus | A_minus_B_plus));
mux2v #(3)m3(control, control_temp, 3'b010, minus_temp & (A_plus_B_minus | A_minus_B_plus));

//wire negative_sign=(A_plus_B_minus | A_minus_B_plus | A_minus_B_minus);
//wire negative_sign=(A_plus_B_minus | A_minus_B_plus | A_minus_B_minus) & (~ A_plus_B_plus);
wire negative_sign = A_minus_B_minus|A_minus_B_plus;

wire [31:0]out_1;
wire [31:0]out_2;
wire [31:0]out_3;
wire [31:0]carryout_1;
wire [31:0]carryout_2;

wire [31:0]one=32'b1;

wire [2:0] minus=3'b011;
alu1 a0(out_1[0],carryout_1[0],A[0],B[0],control[0],control);
alu1 a1(out_1[1],carryout_1[1],A[1],B[1],carryout_1[0],control);
alu1 a2(out_1[2],carryout_1[2],A[2],B[2],carryout_1[1],control);
alu1 a3(out_1[3],carryout_1[3],A[3],B[3],carryout_1[2],control);
alu1 a4(out_1[4],carryout_1[4],A[4],B[4],carryout_1[3],control);
alu1 a5(out_1[5],carryout_1[5],A[5],B[5],carryout_1[4],control);
alu1 a6(out_1[6],carryout_1[6],A[6],B[6],carryout_1[5],control);
alu1 a7(out_1[7],carryout_1[7],A[7],B[7],carryout_1[6],control);
alu1 a8(out_1[8],carryout_1[8],A[8],B[8],carryout_1[7],control);
alu1 a9(out_1[9],carryout_1[9],A[9],B[9],carryout_1[8],control);
alu1 a10(out_1[10],carryout_1[10],A[10],B[10],carryout_1[9],control);
alu1 a11(out_1[11],carryout_1[11],A[11],B[11],carryout_1[10],control);
alu1 a12(out_1[12],carryout_1[12],A[12],B[12],carryout_1[11],control);
alu1 a13(out_1[13],carryout_1[13],A[13],B[13],carryout_1[12],control);
alu1 a14(out_1[14],carryout_1[14],A[14],B[14],carryout_1[13],control);
alu1 a15(out_1[15],carryout_1[15],A[15],B[15],carryout_1[14],control);
alu1 a16(out_1[16],carryout_1[16],A[16],B[16],carryout_1[15],control);
alu1 a17(out_1[17],carryout_1[17],A[17],B[17],carryout_1[16],control);
alu1 a18(out_1[18],carryout_1[18],A[18],B[18],carryout_1[17],control);
alu1 a19(out_1[19],carryout_1[19],A[19],B[19],carryout_1[18],control);
alu1 a20(out_1[20],carryout_1[20],A[20],B[20],carryout_1[19],control);
alu1 a21(out_1[21],carryout_1[21],A[21],B[21],carryout_1[20],control);
alu1 a22(out_1[22],carryout_1[22],A[22],B[22],carryout_1[21],control);
alu1 a23(out_1[23],carryout_1[23],A[23],B[23],carryout_1[22],control);
alu1 a24(out_1[24],carryout_1[24],A[24],B[24],carryout_1[23],control);
alu1 a25(out_1[25],carryout_1[25],A[25],B[25],carryout_1[24],control);
alu1 a26(out_1[26],carryout_1[26],A[26],B[26],carryout_1[25],control);
alu1 a27(out_1[27],carryout_1[27],A[27],B[27],carryout_1[26],control);
alu1 a28(out_1[28],carryout_1[28],A[28],B[28],carryout_1[27],control);
alu1 a29(out_1[29],carryout_1[29],A[29],B[29],carryout_1[28],control);
alu1 a30(out_1[30],carryout_1[30],A[30],B[30],carryout_1[29],control);
alu1 a31(out_1[31],carryout_1[31],A[31],B[31],carryout_1[30],control);

alu1 a32 (out_2[0],carryout_2[0],out_1[0],one[0],minus[0],minus);
alu1 a33 (out_2[1],carryout_2[1],out_1[1],one[1],carryout_2[0],minus);
alu1 a34 (out_2[2],carryout_2[2],out_1[2],one[2],carryout_2[1],minus);
alu1 a35 (out_2[3],carryout_2[3],out_1[3],one[3],carryout_2[2],minus);
alu1 a36 (out_2[4],carryout_2[4],out_1[4],one[4],carryout_2[3],minus);
alu1 a37 (out_2[5],carryout_2[5],out_1[5],one[5],carryout_2[4],minus);
alu1 a38 (out_2[6],carryout_2[6],out_1[6],one[6],carryout_2[5],minus);
alu1 a39 (out_2[7],carryout_2[7],out_1[7],one[7],carryout_2[6],minus);
alu1 a40 (out_2[8],carryout_2[8],out_1[8],one[8],carryout_2[7],minus);
alu1 a41 (out_2[9],carryout_2[9],out_1[9],one[9],carryout_2[8],minus);
alu1 a42 (out_2[10],carryout_2[10],out_1[10],one[10],carryout_2[9],minus);
alu1 a43 (out_2[11],carryout_2[11],out_1[11],one[11],carryout_2[10],minus);
alu1 a44 (out_2[12],carryout_2[12],out_1[12],one[12],carryout_2[11],minus);
alu1 a45 (out_2[13],carryout_2[13],out_1[13],one[13],carryout_2[12],minus);
alu1 a46 (out_2[14],carryout_2[14],out_1[14],one[14],carryout_2[13],minus);
alu1 a47 (out_2[15],carryout_2[15],out_1[15],one[15],carryout_2[14],minus);
alu1 a48 (out_2[16],carryout_2[16],out_1[16],one[16],carryout_2[15],minus);
alu1 a49 (out_2[17],carryout_2[17],out_1[17],one[17],carryout_2[16],minus);
alu1 a50 (out_2[18],carryout_2[18],out_1[18],one[18],carryout_2[17],minus);
alu1 a51 (out_2[19],carryout_2[19],out_1[19],one[19],carryout_2[18],minus);
alu1 a52 (out_2[20],carryout_2[20],out_1[20],one[20],carryout_2[19],minus);
alu1 a53 (out_2[21],carryout_2[21],out_1[21],one[21],carryout_2[20],minus);
alu1 a54 (out_2[22],carryout_2[22],out_1[22],one[22],carryout_2[21],minus);
alu1 a55 (out_2[23],carryout_2[23],out_1[23],one[23],carryout_2[22],minus);
alu1 a56 (out_2[24],carryout_2[24],out_1[24],one[24],carryout_2[23],minus);
alu1 a57 (out_2[25],carryout_2[25],out_1[25],one[25],carryout_2[24],minus);
alu1 a58 (out_2[26],carryout_2[26],out_1[26],one[26],carryout_2[25],minus);
alu1 a59 (out_2[27],carryout_2[27],out_1[27],one[27],carryout_2[26],minus);
alu1 a60 (out_2[28],carryout_2[28],out_1[28],one[28],carryout_2[27],minus);
alu1 a61 (out_2[29],carryout_2[29],out_1[29],one[29],carryout_2[28],minus);
alu1 a62 (out_2[30],carryout_2[30],out_1[30],one[30],carryout_2[29],minus);
alu1 a63 (out_2[31],carryout_2[31],out_1[31],one[31],carryout_2[30],minus);



wire compare0 = (A[0]==0 & B[0]==1);
wire compare1 = (A[1]==0 & B[1]==1);
wire compare2 = (A[2]==0 & B[2]==1);
wire compare3 = (A[3]==0 & B[3]==1);
wire compare4 = (A[4]==0 & B[4]==1);
wire compare5 = (A[5]==0 & B[5]==1);
wire compare6 = (A[6]==0 & B[6]==1);
wire compare7 = (A[7]==0 & B[7]==1);
wire compare8 = (A[8]==0 & B[8]==1);
wire compare9 = (A[9]==0 & B[9]==1);
wire compare10 = (A[10]==0 & B[10]==1);
wire compare11 = (A[11]==0 & B[11]==1);
wire compare12 = (A[12]==0 & B[12]==1);
wire compare13 = (A[13]==0 & B[13]==1);
wire compare14 = (A[14]==0 & B[14]==1);
wire compare15 = (A[15]==0 & B[15]==1);
wire compare16 = (A[16]==0 & B[16]==1);
wire compare17 = (A[17]==0 & B[17]==1);
wire compare18 = (A[18]==0 & B[18]==1);
wire compare19 = (A[19]==0 & B[19]==1);
wire compare20 = (A[20]==0 & B[20]==1);
wire compare21 = (A[21]==0 & B[21]==1);
wire compare22 = (A[22]==0 & B[22]==1);
wire compare23 = (A[23]==0 & B[23]==1);
wire compare24 = (A[24]==0 & B[24]==1);
wire compare25 = (A[25]==0 & B[25]==1);
wire compare26 = (A[26]==0 & B[26]==1);
wire compare27 = (A[27]==0 & B[27]==1);
wire compare28 = (A[28]==0 & B[28]==1);
wire compare29 = (A[29]==0 & B[29]==1);
wire compare30 = (A[30]==0 & B[30]==1);
wire compare31 = (A[31]==0 & B[31]==1);

wire equal0 = (A[0]==B[0]);
wire equal1 = (A[1]==B[1]);
wire equal2 = (A[2]==B[2]);
wire equal3 = (A[3]==B[3]);
wire equal4 = (A[4]==B[4]);
wire equal5 = (A[5]==B[5]);
wire equal6 = (A[6]==B[6]);
wire equal7 = (A[7]==B[7]);
wire equal8 = (A[8]==B[8]);
wire equal9 = (A[9]==B[9]);
wire equal10 = (A[10]==B[10]);
wire equal11 = (A[11]==B[11]);
wire equal12 = (A[12]==B[12]);
wire equal13 = (A[13]==B[13]);
wire equal14 = (A[14]==B[14]);
wire equal15 = (A[15]==B[15]);
wire equal16 = (A[16]==B[16]);
wire equal17 = (A[17]==B[17]);
wire equal18 = (A[18]==B[18]);
wire equal19 = (A[19]==B[19]);
wire equal20 = (A[20]==B[20]);
wire equal21 = (A[21]==B[21]);
wire equal22 = (A[22]==B[22]);
wire equal23 = (A[23]==B[23]);
wire equal24 = (A[24]==B[24]);
wire equal25 = (A[25]==B[25]);
wire equal26 = (A[26]==B[26]);
wire equal27 = (A[27]==B[27]);
wire equal28 = (A[28]==B[28]);
wire equal29 = (A[29]==B[29]);
wire equal30 = (A[30]==B[30]);
wire equal31 = (A[31]==B[31]);

//check negative



wire cond31 = compare31;
wire cond30 = equal31  & compare30;
wire cond29 = equal30  & equal31  & compare29;
wire cond28 = equal29  & equal30  & equal31  & compare28;
wire cond27 = equal28  & equal29  & equal30  & equal31  & compare27;
wire cond26 = equal27  & equal28  & equal29  & equal30  & equal31  & compare26;
wire cond25 = equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare25;
wire cond24 = equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare24;
wire cond23 = equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare23;
wire cond22 = equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare22;
wire cond21 = equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare21;
wire cond20 = equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare20;
wire cond19 = equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare19;
wire cond18 = equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare18;
wire cond17 = equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare17;
wire cond16 = equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare16;
wire cond15 = equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare15;
wire cond14 = equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare14;
wire cond13 = equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare13;
wire cond12 = equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare12;
wire cond11 = equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare11;
wire cond10 = equal11  & equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare10;
wire cond9 = equal10  & equal11  & equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare9;
wire cond8 = equal9  & equal10  & equal11  & equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare8;
wire cond7 = equal8  & equal9  & equal10  & equal11  & equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare7;
wire cond6 = equal7  & equal8  & equal9  & equal10  & equal11  & equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare6;
wire cond5 = equal6  & equal7  & equal8  & equal9  & equal10  & equal11  & equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare5;
wire cond4 = equal5  & equal6  & equal7  & equal8  & equal9  & equal10  & equal11  & equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare4;
wire cond3 = equal4  & equal5  & equal6  & equal7  & equal8  & equal9  & equal10  & equal11  & equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare3;
wire cond2 = equal3  & equal4  & equal5  & equal6  & equal7  & equal8  & equal9  & equal10  & equal11  & equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare2;
wire cond1 = equal2  & equal3  & equal4  & equal5  & equal6  & equal7  & equal8  & equal9  & equal10  & equal11  & equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare1;
wire cond0 = equal1  & equal2  & equal3  & equal4  & equal5  & equal6  & equal7  & equal8  & equal9  & equal10  & equal11  & equal12  & equal13  & equal14  & equal15  & equal16  & equal17  & equal18  & equal19  & equal20  & equal21  & equal22  & equal23  & equal24  & equal25  & equal26  & equal27  & equal28  & equal29  & equal30  & equal31  & compare0;


/**
//check negative
wire cond31 = compare31;
wire cond30 = ~cond31 & compare30;
wire cond29 = ~cond31 & ~cond30 & compare29;
wire cond28 = ~cond31 & ~cond30 & ~cond29 & compare28;
wire cond27 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & compare27;
wire cond26 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & compare26;
wire cond25 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & compare25;
wire cond24 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & compare24;
wire cond23 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & compare23;
wire cond22 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & compare22;

wire cond21 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & compare21;
wire cond20 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 & compare20;
wire cond19 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & compare19;
wire cond18 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 &  ~cond22 & ~cond21 &~cond20 & ~cond19 & compare18;
wire cond17 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & compare17;
wire cond16 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & compare16;
wire cond15 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & compare15;
wire cond14 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & compare14;
wire cond13 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & compare13;
wire cond12 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & compare12;
wire cond11 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & compare11;
wire cond10 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & ~cond11 & compare10;
wire cond9 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & ~cond11 & ~cond10 & compare9;
wire cond8 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & ~cond11 & ~cond10 & ~cond9 & compare8;
wire cond7 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & ~cond11 & ~cond10 & ~cond9 & ~cond8 & compare7;
wire cond6 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & ~cond11 & ~cond10 & ~cond9 & ~cond8 & ~cond7 & compare6;
wire cond5 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & ~cond11 & ~cond10 & ~cond9 & ~cond8 & ~cond7 & ~cond6 & compare5;
wire cond4 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & ~cond11 & ~cond10 & ~cond9 & ~cond8 & ~cond7 & ~cond6 & ~cond5 & compare4;
wire cond3 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 & ~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & ~cond11 & ~cond10 & ~cond9 & ~cond8 & ~cond7 & ~cond6 & ~cond5 & ~cond4 & compare3;
wire cond2 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 &~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & ~cond11 & ~cond10 & ~cond9 & ~cond8 & ~cond7 & ~cond6 & ~cond5 & ~cond4 & ~cond3 & compare2;
wire cond1 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 &~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & ~cond11 & ~cond10 & ~cond9 & ~cond8 & ~cond7 & ~cond6 & ~cond5 & ~cond4 & ~cond3 & ~cond2 & compare1;
wire cond0 = ~cond31 & ~cond30 & ~cond29 & ~cond28 & ~cond27 & ~cond26 & ~cond25 & ~cond24 & ~cond23 &~cond22 & ~cond21 &~cond20 & ~cond19 & ~cond18 & ~cond17 & ~cond16 & ~cond15 & ~cond14 & ~cond13 & ~cond12 & ~cond11 & ~cond10 & ~cond9 & ~cond8 & ~cond7 & ~cond6 & ~cond5 & ~cond4 & ~cond3 & ~cond2 & ~cond1 & compare0;
*/

assign negative_temp= (cond0 |cond1 |cond2 |cond3 |cond4 |cond5 |cond6 |cond7 |cond8 |cond9 |cond10 |cond11 |cond12 |cond13 |cond14 |cond15 |cond16 |cond17 |cond18 |cond19 |cond20 |cond21 |cond22 |cond23 |cond24 |cond25 |cond26 |cond27 |cond28 |cond29 |cond30 |cond31) & (control==3'b011) ;

xor x1(negative,negative_temp, negative_sign);

assign out_3[0] = ~out_2[0];
assign out_3[1] = ~out_2[1];
assign out_3[2] = ~out_2[2];
assign out_3[3] = ~out_2[3];
assign out_3[4] = ~out_2[4];
assign out_3[5] = ~out_2[5];
assign out_3[6] = ~out_2[6];
assign out_3[7] = ~out_2[7];
assign out_3[8] = ~out_2[8];
assign out_3[9] = ~out_2[9];
assign out_3[10] = ~out_2[10];
assign out_3[11] = ~out_2[11];
assign out_3[12] = ~out_2[12];
assign out_3[13] = ~out_2[13];
assign out_3[14] = ~out_2[14];
assign out_3[15] = ~out_2[15];
assign out_3[16] = ~out_2[16];
assign out_3[17] = ~out_2[17];
assign out_3[18] = ~out_2[18];
assign out_3[19] = ~out_2[19];
assign out_3[20] = ~out_2[20];
assign out_3[21] = ~out_2[21];
assign out_3[22] = ~out_2[22];
assign out_3[23] = ~out_2[23];
assign out_3[24] = ~out_2[24];
assign out_3[25] = ~out_2[25];
assign out_3[26] = ~out_2[26];
assign out_3[27] = ~out_2[27];
assign out_3[28] = ~out_2[28];
assign out_3[29] = ~out_2[29];
assign out_3[30] = ~out_2[30];
assign out_3[31] = ~out_2[31];


mux2v m1(out, out_1, out_3, negative_temp);

//xor x1(overflow,carryout_1[30],carryout_1[31]);

endmodule // alu32_unsigned
