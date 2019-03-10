`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 06:36:15 PM
// Design Name: 
// Module Name: Asset_Manager
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


module Asset_Manager(
    input clk,
    input reset,
    output [9:0] ballX,
    output [8:0] ballY,
    output [8:0] paddle1Y,
    output [8:0] paddle2Y
    );
    
    parameter MAX_X = 640;
    parameter MAX_Y = 480;
    parameter MIN_X = 0;
    parameter MIN_Y = 34;
    
    wire [9:0] ball_pos_x;
    wire [8:0] ball_pos_y;
    wire [8:0] paddle_1_pos;
    wire [8:0] paddle_2_pos;
    
    assign ballX = ball_pos_x;
    assign ballY = ball_pos_y;
    assign paddle1Y = paddle_1_pos;
    assign paddle2Y = paddle_2_pos;
    
    wire paddle1up;
    wire paddle1down;
    wire paddle2up;
    wire paddle2down;
    
    reg up1 = 1;
    reg down1 = 0;
    reg up2 = 1;
    reg down2 = 0;
    
    assign paddle1up = up1;
    assign paddle1down = down1;
    assign paddle2up = up2;
    assign paddle2down = down2;
    
    Paddle_Controller P1 (
        .clk(clk),
        .up(paddle1up),
        .down(paddle1down),
        .paddleY(paddle_1_pos)
    );
    
    Paddle_Controller P2 (
        .clk(clk),
        .up(paddle2up),
        .down(paddle2down),
        .paddleY(paddle_2_pos)
    );
    
    wire ballup;
    wire balldown;
    wire ballleft;
    wire ballright;
    
    reg up_ball = 1;
    reg down_ball = 0;
    reg left_ball = 0;
    reg right_ball = 1;
    
    assign ballup = up_ball;
    assign balldown = down_ball;
    assign ballleft = left_ball;
    assign ballright = right_ball;
    
    Ball_Controller B (
        .clk(clk),
        .up(ballup),
        .down(balldown),
        .left(ballleft),
        .right(ballright),
        .ballX(ball_pos_x),
        .ballY(ball_pos_y)
    );
    
    
    always @ (posedge clk)
    begin
        if (paddle_1_pos == MAX_Y)
        begin
            up1 <= 1;
            down1 <= 0;
        end
        else if (paddle_1_pos == MIN_Y)
        begin
            up1 <= 0;
            down1 <= 1;
        end
        else 
        begin
            up1 <= up1;
            down1 <= down1;
        end
        
        if (paddle_2_pos == MAX_Y)
        begin
            up2 <= 1;
            down2 <= 0;
        end
        else if (paddle_2_pos == MIN_Y)
        begin
            up2 <= 0;
            down2 <= 1;
        end
        else
        begin
            up2 <= up2;
            down2 <= down2;
        end
    end
endmodule
