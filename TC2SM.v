`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:30 01/29/2019 
// Design Name: 
// Module Name:    TC2SM 
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
module TC2SM(
    input [11:0] D,
    output reg S,
    output reg [10:0] M
    );

reg MSB;
reg [11:0] Mag;


always @ *
begin
    MSB = D[11];
    S = MSB;
    
    
    case (MSB)
        0: M = D[10:0]; 
        1: begin 
            case (D)
                'b100000000000: M = 'b11111111111; // This edge case eventually gets rounded to the most negative floating point value possible
                default: begin
                Mag = (~D) + 1;
                M = Mag[10:0];
                end
            endcase
        end
    endcase
end

endmodule