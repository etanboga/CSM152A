`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 12:22:19 PM
// Design Name: 
// Module Name: Pong_Top
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


module Pong_Top(
    input wire clk,            
    input wire clr,            // center button
    input wire start,          // top button
    output wire [6:0] seg,    
    output wire [3:0] an,    
    output wire [2:0] red,    
    output wire [2:0] green,
    output wire [1:0] blue,    
    output wire hsync,        
    output wire vsync            
    );
    
    
    // 7-segment clock interconnect
    wire segclk;
    
    // VGA display clock interconnect
    wire dclk;
    
    // Separate Clocks
    wire gclk;
    wire clk25;
    wire segclk2;
    
    // Wires to set ball direction
    wire up;
    wire down;
    wire left;
    wire right;
    
    assign up = 1;
    assign down = 0;
    assign left = 0;
    assign right = 1;
    
    // wires for ball position
    wire [9:0] posX;
    wire [8:0] posY;
    
    // wires for both paddles
    wire [8:0] paddle_one;
    wire [8:0] paddle_two;
    
    // wires for seven segment display
    wire [3:0] digit_zero;
    wire [3:0] digit_one;
    wire [3:0] digit_two;
    wire [3:0] digit_three;
    
    wire run;
    
    Debouncer D1 (
        .bouncy_signal(start),
        .debclk(segclk),
        .stable_signal(run)
    );
    
    reg isRunning = 0;
    wire runGame;
    assign runGame = isRunning;
    
    always @ (posedge run)
    begin
        isRunning <= ~isRunning;
    end

//    always @ (posedge clk or posedge start)
//    begin
//        if (start == 1 && run == 0)
//        begin
//            isRunning <= ~isRunning;
//        end
//    end
    
    
    // generate 7-segment clock & display clock
    clockdiv U1(
        .clk(clk),
        .clr(clr),
        .segclk(segclk2),
        .dclk(dclk)
        );
        
     Clock_Divider div (
        .clk(clk),
        .rst(clr),
        .seg_clk(segclk),
        .clk_25_mhz(clk25),
        .game_clk(gclk)
     ); 
    
    Asset_Manager (
        .clk(gclk),
        .reset(clr),
        .ballX(posX),
        .ballY(posY),
        .start(runGame),
        .paddle1Y(paddle_one),
        .paddle2Y(paddle_two),
        .score_one_ones(digit_two),
        .score_one_tens(digit_three),
        .score_two_ones(digit_zero),
        .score_two_tens(digit_one)
    );
    
    Seven_Seg_Controller S (
        .digit0(digit_zero),
        .digit1(digit_one),
        .digit2(digit_two),
        .digit3(digit_three),
        .clk(segclk),
        .seg(seg),
        .anode(an)
    );
    
    // VGA controller
    vga640x480 U3(
        .dclk(dclk),
        .clr(clr),
        .hsync(hsync),
        .vsync(vsync),
        .red(red),
        .green(green),
        .blue(blue),
        .paddle1Y(paddle_one),
        .paddle2Y(paddle_two),
        .ballX(posX),
        .ballY(posY)
        );

endmodule
