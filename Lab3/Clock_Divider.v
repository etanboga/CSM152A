`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:49 02/07/2019 
// Design Name: 
// Module Name:    Clock_Divider 
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
module Clock_Divider(
    input master_clk,
    output reg one_hz_clk,
    output reg two_hz_clk,
    output reg faster_clk,
    output reg blinky_clk
    );

reg [25:0] one_hz;

always @ (posedge master_clk)
begin
    
    if (one_hz == 50000000)
    begin
        one_hz <= 0;
        one_hz_clk = ~one_hz_clk;
    end
    else
        one_hz <= one_hz + 1;
        
    two_hz_clk <= 1;
    faster_clk <= 1;
    blinky_clk <= 1;
end

endmodule
