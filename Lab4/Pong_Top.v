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
    input wire clk,            //master clock = 100MHz
    input wire clr,            //right-most pushbutton for reset
    output wire [6:0] seg,    //7-segment display LEDs
    output wire [3:0] an,    //7-segment display anode enable
    output wire dp,            //7-segment display decimal point
    output wire [2:0] red,    //red vga output - 3 bits
    output wire [2:0] green,//green vga output - 3 bits
    output wire [1:0] blue,    //blue vga output - 2 bits
    output wire hsync,        //horizontal sync out
    output wire vsync            //vertical sync out
    );
    
    
    // 7-segment clock interconnect
    wire segclk;
    
    // VGA display clock interconnect
    wire dclk;
    
    // disable the 7-segment decimal points
    assign dp = 1;
    
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
        .paddle1Y(paddle_one),
        .paddle2Y(paddle_two)
    );
    
    // 7-segment display controller
    segdisplay U2(
        .segclk(segclk),
        .clr(clr),
        .seg(seg),
        .an(an)
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
