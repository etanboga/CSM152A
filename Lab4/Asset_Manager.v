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
    input start,
    output [9:0] ballX,
    output [8:0] ballY,
    output [8:0] paddle1Y,
    output [8:0] paddle2Y,
    output [3:0] score_one_tens,
    output [3:0] score_one_ones,
    output [3:0] score_two_tens,
    output [3:0] score_two_ones
    );
    
    parameter MAX_X = 790;
    parameter MAX_Y = 480;
    parameter MIN_X = 152;
    parameter MIN_Y = 40;
    
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
    
    reg [3:0] score_one_tens_reg = 0;
    reg [3:0] score_one_ones_reg = 0;
    reg [3:0] score_two_tens_reg = 0;
    reg [3:0] score_two_ones_reg = 0;
    
    assign score_one_tens = score_one_tens_reg;
    assign score_one_ones = score_one_ones_reg;
    assign score_two_tens = score_two_tens_reg;
    assign score_two_ones = score_two_ones_reg;
    
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
    
    reg rst = 0;
    wire rset;
    
    assign rset = rst;
    
    Ball_Controller B (
        .clk(clk),
        .rst(rset),
        .start(start),
        .up(ballup),
        .down(balldown),
        .left(ballleft),
        .right(ballright),
        .ballX(ball_pos_x),
        .ballY(ball_pos_y)
    );
    
    
    always @ (posedge clk)
    begin
        if (paddle_1_pos >= MAX_Y)
        begin
            up1 <= 1;
            down1 <= 0;
        end
        else if (paddle_1_pos <= MIN_Y)
        begin
            up1 <= 0;
            down1 <= 1;
        end
        else 
        begin
            up1 <= up1;
            down1 <= down1;
        end
        
        if (paddle_2_pos >= MAX_Y)
        begin
            up2 <= 1;
            down2 <= 0;
        end
        else if (paddle_2_pos <= MIN_Y)
        begin
            up2 <= 0;
            down2 <= 1;
        end
        else
        begin
            up2 <= up2;
            down2 <= down2;
        end
        
        if (ball_pos_y >= MAX_Y)
        begin
            up_ball <= 1;
            down_ball <= 0;
        end
        else if (ball_pos_y <= MIN_Y)
        begin
            up_ball <= 0;
            down_ball <= 1;
        end
        else
        begin
            up_ball <= up_ball;
            down_ball <= down_ball;
        end
        
        if (ball_pos_x >= MAX_X) // Hits the right of the screen; Player one score
        begin
            rst <= 1;
            right_ball <= 0;
            left_ball <= 1;

            if (score_one_ones_reg < 9)
            begin
                score_one_tens_reg <= score_one_tens_reg;
                score_one_ones_reg <= score_one_ones_reg + 1;
            end
            else
            begin
                score_one_tens_reg <= score_one_tens_reg + 1;
                score_one_ones_reg <= 0;
            end
           
        end
        else if (ball_pos_x <= MIN_X) // Hits the left of the screen; Player two score
        begin
            rst <= 1;
            right_ball <= 1;
            left_ball <= 0;
            if (score_two_ones_reg < 9)
            begin
                score_two_tens_reg <= score_two_tens_reg;
                score_two_ones_reg <= score_two_ones_reg + 1;
            end
            else
            begin
                score_two_ones_reg <= 0;
                score_two_tens_reg <= score_two_tens_reg + 1;
            end
        end
        
        else 
        begin
            rst <= 0;
            right_ball <= right_ball;
            left_ball <= left_ball;
            score_one_ones_reg <= score_one_ones_reg;
            score_one_tens_reg <= score_one_tens_reg;
            score_two_ones_reg <= score_two_ones_reg;
            score_two_tens_reg <= score_two_tens_reg;
        end
        
        if ((((ballY + 8) <= (paddle_1_pos + 40) && (ballY -8) >= (paddle_1_pos - 40)) && ((ballX - 8) <= 168))) // Ball collides with paddle 1
        begin
            left_ball <= 0;
            right_ball <= 1;
            up_ball <= 1;
            down_ball <= 0;
        end
        else if ((((ballY + 8) <= (paddle_2_pos + 40) && (ballY -8) >= (paddle_2_pos - 40)) && ((ballX + 8) >= 776))) // Ball collides with paddle 2
        begin
            left_ball <= 1;
            right_ball <= 0;
            up_ball <= 1;
            down_ball <= 0;
        end
    end
endmodule
