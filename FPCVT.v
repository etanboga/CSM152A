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
    output [2:0] E,
    output [3:0] F
    );
    
reg [10:0] mag;
reg [2:0] exp;
reg [3:0] sig;
reg fifth;
    
TC2SM translator(.D(D), .S(S), .M(mag));

Priority_Encoder pEncoder(.Mag(mag), .Exp(exp), .Sig(sig), .Fifth(fifth));

Rounding_Thingy rThingy(.exp(exp), .sig(sig), .fifth(fifth), .E(E), .F(F));


endmodule