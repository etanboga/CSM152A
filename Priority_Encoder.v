`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:22 01/29/2019 
// Design Name: 
// Module Name:    Priority_Encoder 
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
module Priority_Encoder(
    input  [10:0] Mag,
    output reg [2:0] Exp,
    output reg [3:0] Sig,
    output reg Fifth
    );

reg [10:0] magnitude;    

// Want an 8-to-3 priority encoder for the exponent output
always @ *
begin
    casex(Mag)
         'b1xxxxxxxxxx: begin
         Exp = 'b111;
         magnitude = Mag >> (Exp- 1);
         Sig = magnitude[4:1];
         Fifth = magnitude[0];
         end
         'b01xxxxxxxxx: begin
         Exp = 'b110;
         magnitude = Mag >> (Exp- 1);
         Sig = magnitude[4:1];
         Fifth = magnitude[0];
         end
         'b001xxxxxxxx: begin
         Exp = 'b101;
         magnitude = Mag >> (Exp- 1);
         Sig = magnitude[4:1];
         Fifth = magnitude[0];
         end
         'b0001xxxxxxx: begin
         Exp = 'b100;
         magnitude = Mag >> (Exp- 1);
         Sig = magnitude[4:1];
         Fifth = magnitude[0];
         end
         'b00001xxxxxx: begin
         Exp = 'b011;
         magnitude = Mag >> (Exp- 1);
         Sig = magnitude[4:1];
         Fifth = magnitude[0];
         end
         'b000001xxxxx: begin
         Exp = 'b010;
         magnitude = Mag >> (Exp- 1);
         Sig = magnitude[4:1];
         Fifth = magnitude[0];
         end
         'b0000001xxxx: begin
         Exp = 'b001;
         magnitude = Mag >> (Exp- 1);
         Sig = magnitude[4:1];
         Fifth = magnitude[0];
         end
        default: begin
        Exp = 0;
        Sig = Mag[3:0];
        Fifth= 0;
        end
    endcase
end

endmodule