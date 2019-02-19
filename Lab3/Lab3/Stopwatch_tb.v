`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:31:32 02/17/2019 
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
    
reg clk = 0;
//reg reset;
//wire one;
//wire two;
//wire fast;
//wire blinky;

//wire[6:0] segments;
//wire[3:0] annode;

reg switch0;
reg switch1;
reg buttonS;
reg  buttonR;

wire bounce;

//reg [3:0] min1;
//reg [3:0] min0;
//reg [3:0] sec1;
//reg [3:0] sec0;


//Stopwatch_Top _UUT(
//	.sw0(switch0),
//	.sw1(switch1),
//	.clk(clk),
//	.btnS(buttonS),
//	.btnR(buttonR),
//	.seg(segments),
//	.an(annode)
//);

Debouncer _UUT(
    
);

initial begin
//#1000
//reset = 1;
//clk = 0;
//#50 reset = 0;
//
//#1000000000 
//#1000000000 $finish;

//#50
//	buttonS = 0;
//	buttonR = 0;
//	switch0 = 'b0;
//	switch1 = 'b0;
//#1000000000 
//#1000000000
//	buttonS = 'b1;
//	#5000
//	buttonS = 'b0;
//	
//#1000000000 $finish;	

bounce = 0;
#50000 bounce = 1;
# 50000 bounce = 0;
end

always
begin
    #5 clk = ~clk; // Generate 100MHz clock
end

endmodule