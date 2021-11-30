module Acumulador (clk, in, load, clear, transf, out);
input clk, load, transf, clear;
input [15:0] in;
reg [15:0] r_in;
output reg [15:0] out;

always @ (posedge clk) begin
	if(load == 1)
		r_in <= in;
	else
		r_in <= r_in;
end

always @ (posedge clk or negedge clear) begin
	if(clear == 0)
		out <= 0;
	else if(transf == 1)
		out <= out + r_in;		
	else
		out <= out;	
end

endmodule