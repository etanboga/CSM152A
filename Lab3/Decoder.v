`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:15 02/14/2019 
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
//////////////////////////////////////////////////////////////////////////////////
module Decoder(
    input [3:0] digit,
    output [6:0] segment
    );

always @ *
begin
    case (digit)
        0: assign segment = 'b0111111;
        1: assign segment = 'b0000110;
        2: assign segment = 'b1011011;
        3: assign segment = 'b1001111;
        4: assign segment = 'b1100110;
        5: assign segment = 'b1101101;
        6: assign segment = 'b1111101;
        7: assign segment = 'b0000111;
        8: assign segment = 'b1111111;
        9: assign segment = 'b1101111;
    endcase
end

endmodule
