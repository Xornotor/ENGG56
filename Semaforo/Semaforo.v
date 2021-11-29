module Semaforo (a, b, c, d, clk, n_s, l_o);
input a, b, c, d, clk;
output reg n_s, l_o;

always @ (negedge clk)
	begin
		n_s <= (a || b) && c && d;
		l_o <= !((a || b) && c && d);
	end

endmodule