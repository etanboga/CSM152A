module Counter4 (input rst, input clk, output reg [3:0] a);
	always @ (posedge clk)
	begin
		if (rst)
			a <= 4'b0000;
		else
			a <= a + 1'b1;
	end
endmodule
