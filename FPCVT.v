`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:47 01/29/2019 
// Design Name: 
// Module Name:    FPCVT 
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
module FPCVT(
    input [11:0] D,
    output S,
    output reg [2:0] E,
    output reg [3:0] F
    );
    
wire [10:0] mag;
wire [2:0] exp;
wire [3:0] sig;
wire fifth;

wire [3:0] sigOut;
wire [2:0] expOut;
    
TC2SM translator(.D(D), .S(S), .M(mag));

Priority_Encoder pEncoder(.Mag(mag), .Exp(exp), .Sig(sig), .Fifth(fifth));

Rounding_Thingy rThingy(.exp(exp), .sig(sig), .fifth(fifth), .E(expOut), .F(sigOut));

always @ *
begin
	E = expOut;
	F = sigOut;
end

endmodule