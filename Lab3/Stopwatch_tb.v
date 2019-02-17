`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:12 02/07/2019 
// Design Name: 
// Module Name:    Stopwatch_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Stopwatch_tb(
    );
    
reg clk;
reg reset;
wire one;
wire two;
wire fast;
wire blinky;

wire[7:0] segments;
wire[3:0] annode;

Clock_Divider _UUT(.master_clk(clk), .rst(reset), .one_hz_clk(one), .two_hz_clk(two), .faster_clk(fast), .blinky_clk(blinky));
Seven_Seg_Controller _UUT2(.clk(fast), .digit0('b0000), .digit1('b0000), .digit2('b0000), .digit3('b0000), .seg(segments), .an(annode));
initial begin
#1000
reset = 1;
clk = 0;
#50 reset = 0;

#1000000000 
#1000000000 $finish;
end

always
begin
    #5 clk = ~clk; // Generate 100MHz clock
end

endmodule
