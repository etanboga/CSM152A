`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:28:42 02/17/2019 
// Design Name: 
// Module Name:    Stopwatch_Top 
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
module Stopwatch_Top(
	input sw0, // SEL
	input sw1, // ADJ
	input clk,
	input btnS, // used as reset button
	input btnR, // used as pause button
	output [6:0] seg,
	output [3:0] an
    );
	 
// Tracks minutes and seconds
wire [3:0] minute1;
wire [3:0] minute0;
wire [3:0] second1;
wire [3:0] second0;

// Wires for each clock
wire one_hz_boi;
wire two_hz_boi;
wire fast_boi;
wire blinky_boi;
wire counting_boi;

//wire annode;
//assign an = annode;

wire reset;
wire adjust;
wire select;
wire pause;

// Provide 4 separate clock signals
Clock_Divider clk_div(
	.master_clk(clk), 
	.rst(reset),
	.one_hz_clk(one_hz_boi),
	.two_hz_clk(two_hz_boi),
	.faster_clk(fast_boi),
	.blinky_clk(blinky_boi)
	);

// Drives seven segment display at 400 Hz
Seven_Seg_Controller disp(
	.digit0(second0), 
	.digit1(second1), 
	.digit2(minute0), 
	.digit3(minute1), 
	.clk(fast_boi), 
	.adj(adjust),
	.blinking_clk(blinky_boi),
	.seg(seg), 
	.an(an)
	);

// Debouncer for reset signal
Debouncer d1(
	.bouncy_boi(btnS), 
	.slow_clk(fast_boi), 
	.stable_signal(reset)
);

// Debouncer for pause button
Debouncer d2(
	.bouncy_boi(btnR),
	.slow_clk(fast_boi),
	.stable_signal(pause)
);

// Debouncer for select switch
Debouncer d3(
	.bouncy_boi(sw1),
	.slow_clk(fast_boi),
	.stable_signal(select)
);

// Debouncer for adjust switch
Debouncer d4(
	.bouncy_boi(sw0),
	.slow_clk(fast_boi),
	.stable_signal(adjust)
);

Decade_Counter dec(
	.one_hz_clk(one_hz_boi),
	.two_hz_clk(two_hz_boi),
	.sel(select),
	.rst(reset),
	.adj(adjust),
	.pause(pause),
	.min1_count(minute1),
	.min0_count(minute0),
	.sec1_count(second1),
	.sec0_count(second0)
);

endmodule
