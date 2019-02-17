`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:34 02/07/2019 
// Design Name: 
// Module Name:    Seven_Seg_Decoder 
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
module Seven_Seg_Controller(
    input [3:0] digit0,
    input [3:0] digit1,
    input [3:0] digit2,
    input [3:0] digit3,
    input clk,
    output reg [7:0] seg,
    output reg [3:0] an
    );
    
    reg [1:0] count = 0;
	 reg [3:0] digit_displayed = 0;
    
	 always
	 begin
		seg[7] = 0;
	 end
    
	Decoder cth_pattern(.digit(digit_displayed), .segment(seg[6:0]));
    
    always @ (posedge clk)
    begin
        case(count)
            0: begin
					digit_displayed <= digit0;
					an <= 0;
				end
            1: begin
					digit_displayed <= digit1;
					an <= 1;
				end
            2: begin
					digit_displayed <= digit2;
					an <= 2;
				end
            3: begin
					digit_displayed <= digit3;
					an <= 3; 
				end
        endcase
    end
	 
	 always @ (posedge clk) // Determine which annode is active
	 begin
			if (count == 3)
				count <= 0;
			else
				count <= count + 1;
	 end


endmodule