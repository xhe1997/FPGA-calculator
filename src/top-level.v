`timescale 1ns / 1ps
module top_level(
	input [15:0] sw,
	input clk,
	input btnC,
	//output led,
	output [6:0]  seg,
	output [3:0]  an
);

reg first_flag=0;
reg last;
reg consecutive;

reg [15:0] out_put_reg=0;
wire [15:0] out_put;
reg [31:0] B_reg;


reg operate = 0;
reg swap_stop = 0;
reg out_put_flag=1;
reg negative_reg=0;
    wire [1:0] clk_out;
    wire negative_wire;
	wire [15:0] result,add,sub,mul,div,rem,result1,final_result,result2;
	wire negative,negAdd,negSub,negMul,error,negDiv,negative1,err,negative2;                                                                                                                       
	wire [7:0] remainder;
	wire [31:0] A, B,AA;
    wire Asign, Bsign;
    wire [2:0] control_ori;
	
	wire [6:0] segOne,segTen,segHud,segThs,segThNg,segO,segT,segH;
	wire [3:0] thousands,hundreds,tens,ones;
	
	
	
	
	     


        always @ (posedge(clk))
        begin
            B_reg <= sw[4:0];
            if (btnC == 1 && swap_stop == 0)
            begin
                operate <= ~operate;
                /**
                out_put_last=out_put_reg;
                out_put_reg0=out_put_last+B_reg;
                out_put_reg1=out_put_last-B_reg;
                out_put_reg2=out_put_last*B_reg;
                out_put_reg3=out_put_last/B_reg;
                */
                if(sw[13:12]==2'b00)begin
                   out_put_reg=out_put_reg+B_reg;
                end
                else if(sw[13:12]==2'b01)begin
                   out_put_reg=out_put_reg-B_reg;                
                end
                else if(sw[13:12]==2'b10)begin
                   out_put_reg=out_put_reg*B_reg;                
                end
                else if(sw[13:12]==2'b11)begin
                   out_put_reg=out_put_reg/B_reg;                
                end
                
                if(out_put_reg<0)begin
                    negative_reg=1;
                end
                

                
                swap_stop <= 1;
            end
            else if (btnC == 0)
            begin
                swap_stop <= 0;
            end
            last = consecutive;
            consecutive <= sw[15];
            if (consecutive==0)
            begin
                //out_put <=0 ; //clear
                out_put_flag<=0;//consecutive mode
                out_put_reg=0;
            end    
            else if (consecutive==1 && ~(last==consecutive))
            begin
                first_flag<=1;
                out_put_reg=0;
            end
        end
    


    //mux2v #(16) ini(out_put,result,0,fisrt_flag);
   // mux2v #(16) mdsfds(out_put,0,result,out_put_flag);
   
   
   /**
    assign out_put0 =out_put_reg0;
    assign out_put1=out_put_reg1;
    assign out_put2=out_put_reg2;
    assign out_put3=out_put_reg3;
    mux4v m4(out_put,out_put0,out_put1,out_put2,out_put3,sw[13:12]);
   */
   
    assign out_put =out_put_reg;
    assign negative_wire=negative_reg;
    
    mux2v #(1) erwrw(negative,negative2,negative_wire,sw[15]);
    
	assign AA = {27'b0,sw[10:6]};
	assign Asign = sw[11];
	
    mux2v bb(A,AA, {16'b0,out_put} ,consecutive);


	assign B = {27'b0,sw[4:0]};
	assign Bsign = sw[5];      //on is positive

    assign control_ori = sw[14:12];



    alu32_unsigned aadd(add,negAdd,A,B,3'b010,Asign,Bsign);          //000 add
    
    alu32_unsigned addd(sub,negSub,A,B,3'b011,Asign,Bsign);         //001 sub
    wallace_8 multi(mul,negMul,Asign,Bsign,A,B);                    //010 mul
    division divide(A,B,Asign,Bsign,negDiv,error,div,remainder);  //011 div
    assign rem = {8'b0,remainder};                                  //100 remainder
 
    mux4v #(16) m1(result1,add,sub,mul,div,sw[13:12]);
    mux4v #(1) m2(negative1,negAdd,negSub,negMul,negDiv,sw[13:12]);

    mux2v #(16) m1m(result2,result1,rem,sw[14]);//on is subtract
    mux2v #(1) m2m(negative2,negative1,1'b0,sw[14]);

    mux2v #(16) ffffff(result,result2,out_put,consecutive);

    //assign out_put=result;
   // mux2v #(16) mdsfds(out_put,0,result,out_put_flag);
    
  //  mux2v #(16) fff(final_result,result,out_put,consecutive);
    
	DecimalDigitDecoder d1(result, , thousands,hundreds,tens,ones);

	BCDToLED b1(ones,segO);
	BCDToLED b2(tens,segT);
	BCDToLED b3(hundreds,segH);
	BCDToLED b4(thousands,segThs);	
	
	assign err = error & (sw[14]|sw[13:12]==2'b11) & ~consecutive;
	
    mux2v #(7) th(segThNg,7'b1111111,7'b0111111,negative); //set negative sign
	mux2v #(7) th0(segOne,segO,7'b0101111,err);//r
	mux2v #(7) th1(segTen,segT,7'b0101111,err);//r
	mux2v #(7) th2(segHud,segH,7'b0000110,err);//E
	
	clock_divider  c1(clk,clk_out[0]);
	clock_divider2 c2(clk,clk_out[1]);
	
	//BCDToLED b1(out1,seg,an);
	mux4v #(4) m(an,4'b1110,4'b1101,4'b1011,4'b0111,clk_out);
	mux4v #(7) u(seg,segOne,segTen, segHud, segThNg, clk_out);

     

endmodule

