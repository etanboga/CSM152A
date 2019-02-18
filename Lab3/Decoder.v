`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:30:13 02/17/2019 
// Design Name: 
// Module Name:    Decoder 
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
//////////////////////////////////////////////////////////////////////////////////module Decoder(
module Decoder (    
	 input [3:0] digit,
    output reg [6:0] segment
    );

always @ *
begin
    case (digit)
        0: segment = 'b0111111;
        1: segment = 'b0000110;
        2: segment = 'b1011011;
        3: segment = 'b1001111;
        4: segment = 'b1100110;
        5: segment = 'b1101101;
        6: segment = 'b1111101;
        7: segment = 'b0000111;
        8: segment = 'b1111111;
        9: segment = 'b1101111;
		  default : segment = 'b0111111;
	endcase
end

endmodule