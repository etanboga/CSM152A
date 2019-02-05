`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:01 01/29/2019 
// Design Name: 
// Module Name:    FPCVT_tb 
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
module FPCVT_tb(
    );
    
// Registers
reg [11:0] encoding;
wire S;
//wire [10:0] mag;
wire [2:0] exp;
wire [3:0] sig;
//wire fifth;


// Instantiate UUT
FPCVT _UUT(.D(encoding), .S(S), .E(exp), .F(sig));

initial begin

encoding = 'b000000000000; // 0

#10 encoding = 'b000000000001; // 1

#10 encoding = 'b000000000010; // 2

#10 encoding = 'b000001111101; // 125

#10 encoding = 'b001000000000; // 512

#10 encoding = 'b111001011010; // -422

#10 encoding = 'b011111111110; // 2046

#10 encoding = 'b100000000000; // -2048

#10 encoding = 'b011111111111; // 2047 
end

endmodule