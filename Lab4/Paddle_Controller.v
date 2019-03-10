`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 04:26:27 PM
// Design Name: 
// Module Name: Paddle_Controller
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


module Paddle_Controller(
    input clk,
    input up,
    input down,
    output [8:0] paddleY
    );
    
    reg [8:0] posY = 9;
    assign paddleY = posY;
    
    always @ (posedge clk)
    begin
        if (up == 1)
        begin
            posY <= posY - 1;
        end
        else if (down == 1)
        begin
            posY <= posY + 1;
        end
        else
        begin
            posY <= posY;
        end
    end
endmodule
