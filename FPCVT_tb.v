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

wire [2:0] exp;
wire [3:0] sig;



// Instantiate UUT
FPCVT _UUT(.D(encoding), .S(S), .E(exp), .F(sig));

initial begin

encoding = 'b000000000000; // 0 encoded as 0

#10 encoding = 'b000000000001; // 1 encoded as 1

#10 encoding = 'b000000000010; // 2 encoded as 2

#10 encoding = 'b000001111101; // 125 encoded as 128

#10 encoding = 'b001000000000; // 512 encoded as 512

#10 encoding = 'b111001011010; // -422 encoded as -416

#10 encoding = 'b011100111111; // 1855 encoded as 1792

#10 encoding = 'b011110111111; // 1983 encoded as 1920

#10 encoding = 'b011111111110; // 2046 encoded as 1920 (max floating point representation)

#10 encoding = 'b100000000000; // -2048 encoded as -1920

#10 encoding = 'b011111111111; // 2047 encoded as 1920
end

endmodule