`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:57:09 02/17/2019 
// Design Name: 
// Module Name:    Debouncer 
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
module Debouncer(
    input bouncy_boi,
	 input slow_clk,
    output stable_signal
    );

reg ff1 = 0;
reg ff2 = 0;
reg stable = 0;

assign stable_signal = stable;

always @ (posedge slow_clk)
begin
	ff1 <= bouncy_boi;
end

always @ (posedge slow_clk)
begin
	ff2 <= ff1;
end

always @ (posedge slow_clk)
begin
	stable <= ff1 & (~ff2);
end

endmodule
