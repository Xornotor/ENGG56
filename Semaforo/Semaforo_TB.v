/*TESTBENCH DO SEMAFORO*/

`timescale 1ns/1ns
module Semaforo_TB;
reg a, b, c, d;
wire n_s, l_o;

Semaforo sem(.a(a), .b(b), .c(c), .d(d), .n_s(n_s), .l_o(l_o));

initial begin
	a = 0;
	b = 0;
	c = 0;
	d = 0;

	#5 a = 1'b0;
	b = 0;
	c = 0;
	d = 1;

	#5 a = 0;
	b = 0;
	c = 1;
	d = 0;

	#5 a = 0;
	b = 0;
	c = 1;
	d = 1;

	#5 a = 0;
	b = 1;
	c = 0;
	d = 0;

	#5 a = 0;
	b = 1;
	c = 0;
	d = 1;

	#5 a = 0;
	b = 1;
	c = 1;
	d = 0;

	#5 a = 0;
	b = 1;
	c = 1;
	d = 1;

	#5 a = 1;
	b = 0;
	c = 0;
	d = 0;

	#5 a = 1;
	b = 0;
	c = 0;
	d = 1;

	#5 a = 1;
	b = 0;
	c = 1;
	d = 0;

	#5 a = 1;
	b = 0;
	c = 1;
	d = 1;

	#5 a = 1;
	b = 1;
	c = 0;
	d = 0;

	#5 a = 1;
	b = 1;
	c = 0;
	d = 1;

	#5 a = 1;
	b = 1;
	c = 1;
	d = 0;

	#5 a = 1;
	b = 1;
	c = 1;
	d = 1;

	#5;
end

endmodule