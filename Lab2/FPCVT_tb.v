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


// Instantiate UUT
TC2SM _UUT(.D(encoding), .S(S), .M(mag));

initial begin

encoding = 'b000000000000;

#10 encoding = 'b000000000001;

#10 encoding = 'b100000000000;
end

endmodule
