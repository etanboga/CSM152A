`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:21:12 02/17/2019 
// Design Name: 
// Module Name:    counter_clock 
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
module Counter_Clock(
    input one_hz_clk,
    input two_hz_clk,
    input adj,
    output clk_out
    );
	 
reg clock;

assign clk_out = clock;

always @ *
begin
	if (adj)
	begin
		clock = two_hz_clk;
	end
	
	else
	begin
		clock = one_hz_clk;
	end
end

endmodule
