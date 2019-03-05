`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:18 03/05/2019 
// Design Name: 
// Module Name:    Pong_Top 
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
module Pong_Top(
    clk,
    rst,
    led,
    miso,
    mosi,
    ss, //slave select for spi?
    sclk //serial clock for spi communication



    );


    //---INPUTS OUTPUTS----
    input clk;
    input rst;
    input miso;					// Master In Slave Out, Pin 3, Port JA
    
    //input [2:0] SW;			// Switches 2, 1, and 0
    output led[3:0];
    output SS;					// Slave Select, Pin 1, Port JA
    output MOSI;				// Master Out Slave In, Pin 2, Port JA
    output SCLK;				// Serial Clock, Pin 4, Port JA
    
    
    
    //--------SUBMODULE DECLARATIONS-----------------
    
    
    
    
    
endmodule
