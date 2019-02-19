`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:30:39 02/17/2019 
// Design Name: 
// Module Name:    Seven_Seg_Controller 
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
	 input adj,
     input pause,
	 input blinking_clk,
    output [6:0] seg,
    output reg [3:0] an
    );
    
    reg [1:0] count = 0;
	 reg [3:0] digit_displayed = 0;
	
    reg blink = 0; 
    
	Decoder cth_pattern(.digit(digit_displayed), .segment(seg[6:0]));
    
    always @ (posedge clk)
	 if (blink)
	 begin
		an <= 'b1111;
	 end
	 else
    begin
        case(count)
            0: begin
					digit_displayed <= digit0;
					an <= 'b1110;
				end
            1: begin
					digit_displayed <= digit1;
					an <= 'b1101;
				end
            2: begin
					digit_displayed <= digit2;
					an <= 'b1011;
				end
            3: begin
					digit_displayed <= digit3;
					an <= 'b0111; 
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
	 
	 always @ (posedge blinking_clk)
	 begin
		if (adj && ~pause)
		begin
			blink <= ~blink;
		end
		else
		begin
			blink <= 0;
		end
	 end


endmodule