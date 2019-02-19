`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:18:18 02/17/2019 
// Design Name: 
// Module Name:    Decade_Counter 
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
module Decade_Counter(
	input one_hz_clk,
	input two_hz_clk,
	input sel,
	input rst,
	input adj,
	input pause,
	output [3:0] min1_count,
	output [3:0] min0_count,
	output [3:0] sec1_count,
	output [3:0] sec0_count,
    output pause_state
    );
	 
wire count_clock;



// Store counts
reg [3:0] min1 = 0;
reg [3:0] min0 = 0;
reg [3:0] sec1 = 0;
reg [3:0] sec0 = 0;

Counter_Clock cnt(
	.one_hz_clk(one_hz_clk),
	.two_hz_clk(two_hz_clk),
	.adj(adj),
	.clk_out(count_clock)
);

reg pause_st = 0;
assign pause_state = pause_st;

always @ (posedge pause)
begin
	pause_st <= ~pause_st; 
end

always @ (posedge count_clock or posedge rst) 
begin
	if(rst == 1)
	begin
		min1 <= 0;
		min0 <= 0;
		sec1 <= 0;
		sec0 <= 0;
	end
	
	else if (~pause_st)
	begin
		if (adj && ~sel) // ADJ Seconds
		begin 
			if (sec0 == 9 && sec1 == 5)
			begin
				sec0 <= 0;
				sec1 <= 0;
			end
		
			else if (sec0 == 9)
			begin
				sec0 <= 0;
				sec1 <= sec1 + 1;
			end
		
			else
				sec0 <= sec0 + 1;
		end
		
		else if (adj && sel) // ADJ Minutes
		begin
			if (min0 == 9 && min1 == 9)
			begin
				min0 <= 0;
				min1 <= 0;
			end
		
			else if (min0 == 9)
			begin
				min0 <= 0;
				min1 <= min1 + 1;
			end
		
			else
				min0 <= min0 + 1;
		end
		
		else if (sec0 == 9 && sec1 == 5) // at xx:59
		begin
			sec0 <= 0;
			sec1 <= 0;
		
			if (min0 < 9) // xx:59, min0 is not 9
			begin
				min0 <= min0 + 1;
			end
			else if (min0 == 9) // x9:59
			begin
				if (min1 < 9) // x9:59, min1 is not 9
				begin
					min1 <= min1 + 1;
					min0 <= 0;
				end
				else if (min1 == 9) //99:59
				begin
					min1 <= 0;
					min0 <= 0;
				end
			end
		end
	
		else if (sec0 == 9) // xx:x9, sec1 is not 5
		begin
			sec0 <= 0;
			sec1 <= sec1 + 1;
		end
	
		else
			sec0 <= sec0 + 1;
	end
	
	else
	begin
		sec0 <= sec0;
		sec1 <= sec1;
		min0 <= min0;
		min1 <= min1;
	end
		
end

assign min1_count = min1;
assign min0_count = min0;
assign sec1_count = sec1;
assign sec0_count = sec0;

endmodule
