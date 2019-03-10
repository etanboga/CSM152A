`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 02:28:30 PM
// Design Name: 
// Module Name: Clock_Divider
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


module Clock_Divider(
    input clk,
	input rst, 
	output seg_clk,
    output clk_25_mhz,
    output game_clk
    );

reg clk_25 = 0;
reg clk_game = 0;
reg clk_seg = 0;

assign clk_25_mhz = clk_25;
assign game_clk = clk_game;
assign seg_clk = clk_seg;

reg [1:0] clk_25_count = 0;
reg [21:0] clk_game_count = 0;
reg [16:0] clk_seg_count = 0;

always @ (posedge clk or posedge rst)
begin
if (rst == 1)
begin
	clk_25_count <= 0;
	clk_game_count <= 0;
	clk_25 <= 0;
	clk_game <= 0;
	clk_seg <= 0;
	clk_seg_count <= 0;
end
else
	begin
		if ( clk_25_count == 3 )
		begin
			clk_25_count <= 0;
			clk_25 = ~clk_25;
		end
		else
		begin
			clk_25_count <= clk_25_count + 1;
		end
		if ( clk_game_count == 1000000 )
		begin
			clk_game_count <= 0;
			clk_game <= ~clk_game;
		end
		else
		begin
			clk_game_count <= clk_game_count + 1;
		end
		if ( clk_seg_count == 125000 )
		begin
		  clk_seg_count <= 0;
		  clk_seg <= ~clk_seg;
		end
		else
		begin
		  clk_seg_count <= clk_seg_count + 1;
		end
end
	
	
end

endmodule

