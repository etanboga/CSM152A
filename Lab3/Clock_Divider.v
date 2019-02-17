`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:49 02/07/2019 
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
    output reg one_hz_clk,
    output reg two_hz_clk,
    output reg faster_clk,
    output reg blinky_clk
    );


reg [25:0] one_hz = 0;
reg [25:0] two_hz = 0;
reg [25:0] fast = 0;
reg [25:0] blink = 0;

always @ (posedge master_clk or posedge rst)
begin
    if (rst)
    begin
        one_hz <= 0;
        one_hz_clk <= 0; 
        two_hz <= 0;
        two_hz_clk <= 0;
        fast <= 0;
        faster_clk <= 0;
        blink <= 0;
        blinky_clk <= 0;
    end
    
    if (one_hz == 50000000) //1 Hz Clock
    begin
        one_hz <= 0; // Set counter register to 0
        one_hz_clk <= ~one_hz_clk; // Flip 1 Hz clock
    end
    
    else
        one_hz <= one_hz + 1;
    
    if (two_hz == 25000000) //2 Hz clock
    begin
        two_hz <= 0;
        two_hz_clk <= ~two_hz_clk;
    end
    
    else
        two_hz <= two_hz + 1;
    
    if (fast == 125000) // 400 Hz Clock, hopefully refresh rate isn't too high
    begin
        fast <= 0;
        faster_clk <= ~faster_clk;
    end
    
    else
        fast <= fast + 1;
    
    if (blink == 12500000)
    begin
        blink <= 0;
        blinky_clk <= ~blinky_clk;
    end
    
    else
        blink <= blink + 1;

end

endmodule