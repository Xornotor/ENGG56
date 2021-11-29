module Semaforo (a, b, c, d, n_s, l_o);
input a, b, c, d;
output n_s, l_o;

assign n_s = (a || b) && (!(c || d));
assign l_o = !n_s;

endmodule