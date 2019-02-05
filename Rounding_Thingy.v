`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:56 01/31/2019 
// Design Name: 
// Module Name:    Rounding_Thingy 
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
module Rounding_Thingy(
    input [2:0] exp,
    input [3:0] sig,
    input fifth,
    output reg [2:0] E,
    output reg [3:0] F
    );

always @ *
begin
    case(fifth)
    0: begin //Fifth bit is zero, so truncate
        E = exp;
        F = sig;
    end
    1: begin // Fifth bit is one, so must perform some rounding
        case (sig)
        'b1111: begin // In this case, there will be overflow
		  case (exp)
					default: begin // Divide the mantissa (16, which overflowed) to 8 and increase exponent by 1
						E = exp + 1;
						F = 'b1000;
					end
					'b111: begin // This would round the exponent to 8, so we want the maximum possible floating point number
						E = 'b111;
						F = 'b1111;
					end
				endcase
            end
        default: begin // default case where the mantissa is incremented without overflow
                E = exp;
                F = sig + 1;
            end
        endcase
    end
    endcase
end

endmodule