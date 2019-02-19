`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:29:00 02/17/2019 
// Design Name: 
// Module Name:    Clock_Divider 
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
module Clock_Divider(
    input master_clk,
    input rst, 
    output one_hz_clk,
    output two_hz_clk,
    output faster_clk,
    output blinky_clk
    );


reg [26:0] one_hz = 0;
reg [26:0] two_hz = 0;
reg [26:0] fast = 0;
reg [26:0] blink = 0;

reg one_hz_boi = 0;
reg two_hz_boi = 0;
reg faster_boi = 0;
reg blinky_boi = 0;

assign one_hz_clk = one_hz_boi;
assign two_hz_clk = two_hz_boi;
assign faster_clk = faster_boi;
assign blinky_clk = blinky_boi;

always @ (posedge master_clk)
begin
    if (rst)
    begin
        one_hz <= 0;
        one_hz_boi <= 0; 
        two_hz <= 0;
        two_hz_boi <= 0;
        fast <= 0;
        faster_boi <= 0;
        blink <= 0;
        blinky_boi <= 0;
    end
    
    if (one_hz == 50000000) //1 Hz Clock
    begin
        one_hz <= 0; // Set counter register to 0
        one_hz_boi <= ~one_hz_boi; // Flip 1 Hz clock
    end
    
    else
        one_hz <= one_hz + 1;
    
    if (two_hz == 25000000) //2 Hz clock
    begin
        two_hz <= 0;
        two_hz_boi <= ~two_hz_boi;
    end
    
    else
        two_hz <= two_hz + 1;
    
    if (fast == 125000) // 400 Hz Clock, hopefully refresh rate isn't too high
    begin
        fast <= 0;
        faster_boi <= ~faster_boi;
    end
    
    else
        fast <= fast + 1;
    
    if (blink == 12500000)
    begin
        blink <= 0;
        blinky_boi <= ~blinky_boi;
    end
    
    else
        blink <= blink + 1;

end

endmodule
