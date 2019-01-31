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
wire [10:0] mag;
wire [2:0] exp;
wire [3:0] sig;
wire fifth;


// Instantiate UUT
TC2SM _UUT(.D(encoding), .S(S), .M(mag));

Priority_Encoder P1(.Mag(mag), .Exp(exp), .Sig(sig), .Fifth(fifth));

initial begin

encoding = 'b000000000000;

#10 encoding = 'b000000000001;

#10 encoding = 'b000000000010;

#10 encoding = 'b001000000000;

#10 encoding = 'b111001011010;

#10 encoding = 'b100000000000;
end

endmodule