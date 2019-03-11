`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2019 10:42:35 PM
// Design Name: 
// Module Name: Debouncer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Debouncer(
    input bouncy_signal,
    input debclk,
    output stable_signal
    );
    reg ff1;
    reg ff2;
    
    reg stable;
    assign stable_signal = stable;
    
    always @ (posedge debclk)
    begin
        ff1 <= bouncy_signal;
        ff2 <= ff1;
        stable <= ff2;
    end
endmodule
