/*TESTBENCH DO ACUMULADOR*/

`timescale 1ns/1ns
module Acumulador_TB;
reg clk, load, transf, clear;
reg [15:0] in;
wire [15:0] out;

Acumulador acc(.clk(clk), .load(load), .transf(transf), .clear(clear), .in(in), .out(out));

initial begin
	clk = 1'b0;
	load = 1'b0;
	transf = 1'b1;
	clear = 1'b0;
	in = 16'b0000000000000000;
	#33 clear = 1'b1;
end

always begin
	#10 clk <= ~clk;
end

always @ (posedge clk) begin
	load <= ~load;
	transf <= ~transf;
	if(load == 1'b0)
		#4 in <= in * 2;
	if(in == 16'b0000000000000000)
		begin
			in <= 16'b0000000000000001;
			#3 clear <= 1'b0;
		end
	else
		#3 clear <= 1'b1;
end

endmodule