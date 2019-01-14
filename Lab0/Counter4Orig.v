`timescale 1ps / 1ps

module counter4orig(
    input rst,
    input clk, 
    output reg a0,
    output reg a1,
    output reg a2,
    output reg a3
    );


    always @ (posedge clk)
    begin
        if (rst) begin
        a0 <= 'b0;
        a1 <= 'b0;
        a2 <= 'b0;
        a3 <= 'b0;
        end
        
        else begin
            a0 <= ~a0;
            a1 <= (~a0 & a1) | (a0 & ~a1);
            a2 <= (~a0 & a2) | (~a1 & a2) | (~a2 & a1 & a0);
            a3 <= (~a1 & a3) | (~a2 & a3) | (~a0 & a3) | (~a3 & a2 & a1 & a0); 
        end
    end
endmodule
