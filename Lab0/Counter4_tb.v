`timescale 1ps/1ps

module Counter4_tb;

reg clock, r;

wire [3:0] new;
wire o0, o1, o2, o3;

Counter4 c1(.rst(r), .clk(clock), .a(new));
counter4orig c2(.rst(r), .clk(clock), .a0(o0), .a1(o1), .a2(o2), .a3(o3)); 

initial begin
	r = 0;
	clock = 1;
	#5 r = 1;
	#10 r = 0;
	#500 $finish;
end 

always
begin
	#5 clock = ~clock;
end
endmodule
