`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2016 06:27:54 PM
// Design Name: 
// Module Name: clock_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_divider(
    input clkin,
    output clkout
    );
    reg [31:0] counter = 1;
    reg temp_clk = 0 ;
    always @ (posedge(clkin))
    begin
        if(counter == 50000)
        begin
            counter <= 1;
            temp_clk <= ~temp_clk;
        end
        else
            counter <= counter + 1;
    end
    assign clkout = temp_clk;
endmodule

module clock_divider2(
    input clkin,
    output clkout
    );
    reg [31:0] counter = 1;
    reg temp_clk = 0 ;
    always @ (posedge(clkin))
    begin
        if(counter == 25000)
        begin
            counter <= 1;
            temp_clk <= ~temp_clk;
        end
        else
            counter <= counter + 1;
    end
    assign clkout = temp_clk;
endmodule
