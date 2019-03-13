`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:16 03/05/2019 
// Design Name: 
// Module Name:    joystick 
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
module joystick(
    clk,
    rst,
    miso,
    ss,
    mosi,
    sclk,
    upRead,
    downRead
    );
    
    input clk;
    input rst;
    input miso;
    output ss;
    output mosi;
    output sclk;
    output upRead;
    output downRead; 

    wire ss; //spi?
    wire mosi;
    wire sclk; //not sure what clk's for

    wire [7:0] sndData;
    
    
    // Signal to send/receive data to/from PmodJSTK
    wire sndRec;

    // Data read from PmodJSTK
    wire [39:0] jstkData;

    // Signal carrying output data that user selected
    wire [9:0] posData;
    
            
            
            
            //-----------------------------------------------
			//  	  			PmodJSTK Interface
			//-----------------------------------------------
			PmodJSTK PmodJSTK_Int(
					.CLK(clk),
					.RST(rst),
					.sndRec(sndRec),
					.DIN(sndData),
					.MISO(miso),
					.SS(ss),
					.SCLK(sclk),
					.MOSI(mosi),
					.DOUT(jstkData)
			);
            

			
            
      //----------IMPLEMENTATION--------------------------
    //up down
    
    //450 = 0111000010
    //570 = 1000111010
    //up down left right
    
        
    reg sendUp;
    reg sendDown;
    assign upRead  = sendUp;// ({jstkData[25:24], jstkData[39:32]} > 10'b1000111010); //arbitrary threshold 450-520
    assign downRead =   sendDown; //({jstkData[25:24], jstkData[39:32]} < 10'b0111000010);

    
    always @ (posedge clk) 
    begin
        if ({jstkData[25:24], jstkData[39:32]} > 10'b1000111010)
        begin
            sendUp <= 1;
            sendDown <= 0;
        end
        else if ({jstkData[25:24], jstkData[39:32]} < 10'b0111000010)
        begin
            sendUp <= 0;
            sendDown <= 1;
        end
        else
        begin
            sendUp <= 0;
            sendDown <= 0;
        end
    end
endmodule