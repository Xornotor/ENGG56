/*TESTBENCH DO TOP*/

`timescale 1ns/1ns
module TOP_TB;

reg clk, reset;
reg [15:0] mem [0:31];
reg [15:0] datain;
wire [15:0] dataout;
wire [4:0] address;
wire rden, wren, ready;

TOP top_teste(.clk(clk), .reset(reset), .address(address), .rden(rden), .wren(wren), .ready(ready), .datain(datain), .dataout(dataout));

initial begin
	$readmemb("data.txt", mem);
	reset = 0;
	#10 clk = 0;
	#10 clk = 1;
	#10 clk = 0;
	#10 clk = 1;
	reset = 1;
end

always begin
	#10 clk <= ~clk;
end

always @ (posedge clk) begin
	if(rden == 1) 
		datain <= mem[address];
	else
		datain <= 16'bzzzzzzzzzzzzzzzz;
	
	if(wren == 1)
		mem[address] <= dataout;
end

endmodule