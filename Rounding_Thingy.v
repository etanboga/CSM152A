`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:56 01/31/2019 
// Design Name: 
// Module Name:    Rounding_Thingy 
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
module Rounding_Thingy(
    input [2:0] exp,
    input [3:0] sig,
    input fifth,
    output reg [2:0] E,
    output reg [3:0] F
    );

always @ *
begin
    case(fifth)
    0: begin
        E = exp;
        F = sig;
    end
    1: begin
        case (sig)
        1111: begin
                E = exp + 1;
                F = sig >> 1;
            end
        default: begin
                E = exp;
                F = sig + 1;
            end
        endcase
    end
    endcase
end

endmodule