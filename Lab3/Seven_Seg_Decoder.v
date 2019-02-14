
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:34 02/07/2019 
// Design Name: 
// Module Name:    Seven_Seg_Decoder 
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
module Seven_Seg_Decoder(
    input [3:0] digit0,
    input [3:0] digit1,
    input [3:0] digit2,
    input [3:0] digit3,
    input clk,
    output seg[7:0],
    output an[3:0]
    );
    
    reg [1:0] count = 0;
    
    assign seg[7] = 0;
    
   
    
    always @ (posedge clk)
    begin
        case(count)
            0: ;
            1: ;
            2: ;
            3: ;
        endcase
    end


endmodule