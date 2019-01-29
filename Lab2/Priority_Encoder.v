`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:22 01/29/2019 
// Design Name: 
// Module Name:    Priority_Encoder 
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
module Priority_Encoder(
    input [10:0] Mag,
    output [2:0] Exp,
    output [3:0] Sig,
    output Fifth
    );

// Want an 8-to-3 priority encoder for the exponent output
always @ *
begin
    
end

endmodule
