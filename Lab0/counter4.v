`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:20 01/10/2019 
// Design Name: 
// Module Name:    counter4 
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
module counter4(
    input rst,
    input clk, 
    output a0,
    output a1,
    output a2,
    output a3
    );

    reg a0, a1, a2, a3;
    
    always @ (posedge clk)
    begin
        if (rst) begin
        a0 <= 'b0;
        a1 <= 'b0;
        a2 <= 'b0;
        a3 <= 'b0;
        end
        
        else begin
            a0 <= ~a0;
            a1 <= a0 | a1;
            a2 <= (a0 & a1) | a2;
            a3 <= a3 | (a0 & a1 & a2);
        end
    end
endmodule
