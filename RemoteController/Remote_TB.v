/*TESTBENCH DO ACUMULADOR*/

`timescale 1us/1us
module Remote_TB;
reg clk, rst, serial;
reg ir [0:63];
reg [5:0] cont_bit;
wire [7:0] tecla;
wire ready;

RemoteController rem(.clk(clk), .rst(rst), .serial(serial), .tecla(tecla), .ready(ready));

initial begin
	$readmemb("tecla1.txt", ir);
	rst = 0;
	serial = 1;
	cont_bit = 0;
	#13 clk = 1;
	#13 clk = 0;
	rst = 1;
	#104 serial = 1;
end

always begin
	#13 clk <= ~clk;
end

always @ (posedge clk) begin
	if(cont_bit <= 33)
		#8 serial = ir[cont_bit];
	else
		#8 serial = 1;
	#18 cont_bit <= cont_bit + 1; 
	if(cont_bit >= 36) begin
		cont_bit <= 0;
	end
end

endmodule