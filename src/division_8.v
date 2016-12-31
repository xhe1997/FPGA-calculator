module division(A,B,Asign,Bsign,negative,error,Res,Remainder);

    //the size of input and output ports of the division module is generic.
    parameter WIDTH = 8;
    //input and output ports.
    input [WIDTH-1:0] A;
    input [WIDTH-1:0] B;

    input Asign,Bsign;
    output negative,error;
    output [WIDTH-1:0] Res;
    output [WIDTH-1:0] Remainder;
    //internal variables    
    reg [WIDTH-1:0] Res = 0;
    reg [WIDTH-1:0] Remainder = 0;
    reg [WIDTH-1:0] a1,b1;
    reg [WIDTH:0] p1;   
    integer i;

    xor x1(negative, Asign, Bsign);
    assign error=(B==0);

    always@ (A or B)
    begin
        //initialize the variables.
        a1 = A;
        b1 = B;
        p1= 0;
        for(i=0;i < WIDTH;i=i+1)    begin //start the for loop
            p1 = {p1[WIDTH-2:0],a1[WIDTH-1]};
            a1[WIDTH-1:1] = a1[WIDTH-2:0];
            p1 = p1-b1;
            if(p1[WIDTH-1] == 1)    begin
                a1[0] = 0;
                p1 = p1 + b1;   end
            else
                a1[0] = 1;
        end
        Res = a1;
	Remainder=A-a1*b1;
    end 

endmodule


/*
module con(q, d, clk, enable, reset);
   output q;
   reg    q;
   input  d;
   input  clk, enable, reset;


   always@(posedge clk or posedge reset)
     if (reset)
     begin
      q <= 1'b0;
     end
     else if (enable)
     begin
      q <= d;
     end
     
        always @ (posedge(clk))
     begin
         if (btnC == 1 && swap_stop == 0)
         begin
             operate <= ~operate;
             swap_stop <= 1;
         end
         else if (btnC == 0)
         begin
             swap_stop <= 0;
         end
         
         consecutive <= sw[15];
         if (consecutive==0)
         begin
             out_put <=0 ; //clear
         end    
     end
     
     
     
     
     
     
endmodule // dffe*/

