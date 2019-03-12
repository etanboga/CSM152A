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
    input rst,
    input hard,
    output [8:0] paddleY
    );
    
    reg [8:0] posY = 271;
    assign paddleY = posY;
    
    always @ (posedge clk or posedge rst)
    begin
    if (rst == 0)
    begin
        posY <= 271;
    end
    else begin
        if (up == 1 && hard == 1)
        begin
            posY <= posY - 1;
        end
        else if (down == 1 && hard == 1)
        begin
            posY <= posY + 1;
        end
        else if (up == 1 && hard == 0)
        begin
            posY <= posY - 2;
        end
        else if (down == 1 && hard == 0)
        begin
            posY <= posY + 2;
        end
        else
        begin
            posY <= posY;
        end
        end
    end
endmodule
