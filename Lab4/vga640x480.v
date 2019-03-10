`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 12:38:50 PM
// Design Name: 
// Module Name: vga640x480
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


module vga640x480(
	input wire dclk,			//pixel clock: 25MHz
	input wire clr,			//asynchronous reset
	input wire [9:0] ballX,
	input wire [8:0] ballY,
	input wire [8:0] paddle1Y,
	input wire [8:0] paddle2Y,
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
	output reg [2:0] red,	//red vga output
	output reg [2:0] green, //green vga output
	output reg [1:0] blue	//blue vga output
	);

// video structure constants
parameter hpixels = 800;

// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// end of horizontal back porch
parameter hfp = 784; 	// beginning of horizontal front porch
parameter vbp = 31; 		// end of vertical back porch
parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

// Horizontal & vertical counters --
// this is how we keep track of where we are on the screen.
// ------------------------
// Sequential "always block", which is a block that is
// only triggered on signal transitions or "edges".
// posedge = rising edge  &  negedge = falling edge
// Assignment statements can only be used on type "reg" and need to be of the "non-blocking" type: <=
always @(posedge dclk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
		
	end
end

// generate sync pulses (active low)
// ----------------
// "assign" statements are a quick way to
// give values to variables of type: wire
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

// display 100% saturation colorbars
// ------------------------
// Combinational "always block", which is a block that is
// triggered when anything in the "sensitivity list" changes.
// The asterisk implies that everything that is capable of triggering the block
// is automatically included in the sensitivty list.  In this case, it would be
// equivalent to the following: always @(hc, vc)
// Assignment statements can only be used on type "reg" and should be of the "blocking" type: =

reg ball = 0;
reg paddle1 = 0;
reg paddle2 = 0;

always @(*)
begin
	// first check if we're within vertical active video range
	ball <= (hc >= (ballX - 8) && hc <= (ballX + 8) && vc >= (ballY-8) && vc <= (ballY + 8));
    paddle1 <= (hc >= (hbp+16) && hc <= (hbp + 24) && vc >= (paddle1Y - 32) && vc <= (paddle1Y + 32));
    paddle2 <= (hc >= (hbp + 632) && hc <= (hbp+640) && vc >= (paddle2Y - 32) && vc <= (paddle2Y + 32));
	if (vc >= vbp && vc < vfp)
	begin
		if (ball)
		begin
		  red = 3'b000;
		  green = 3'b111;
		  blue = 2'b11;
		end
		
		if (paddle1)
		begin
		  red = 'b111;
		  green = 'b000;
		  blue = 'b11;
		end
		
		if (paddle2)
        begin
          red = 'b111;
          green = 'b000;
          blue = 'b11;
        end
        if (!ball && !paddle1 && !paddle2)
        begin
            red = 0;
            green = 0;
            blue = 0;
        end
    end
	// we're outside active vertical range so display black
	else
	begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule