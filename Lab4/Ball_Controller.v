`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 02:15:03 PM
// Design Name: 
// Module Name: Ball_Controller
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


module Ball_Controller(
    input clk,
    input rst, 
    input up,
    input down,
    input left,
    input right,
    output [9:0] ballX,
    output [8:0] ballY
    );
    
    reg [9:0] posX = 320;
    reg [9:0] posY = 240;
    
    assign ballX = posX;
    assign ballY = posY; 
    
    always @ (posedge clk)
    begin
        if (rst == 1)
        begin
            posX <= 320;
            posY <= 240;
        end
        
        else if (up == 1 && left == 1)
        begin
            posX <= posX - 1;
            posY <= posY - 1;
        end
        
        else if (up == 1 && right == 1)
        begin
            posX <= posX + 1;
            posY <= posY - 1;
        end
        
        else if (down == 1 && left == 1)
        begin
            posX <= posX - 1;
            posY <= posY + 1;
        end
        
        else if (down == 1 && right == 1)
        begin
            posX <= posX + 1;
            posY <= posY + 1;
        end
        
        else
        begin
            posX <= posX;
            posY <= posY;
        end        
    end
endmodule
