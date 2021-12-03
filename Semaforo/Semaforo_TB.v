/*TESTBENCH DO SEMAFORO*/

`timescale 1ns/1ns
module Semaforo_TB;
reg a, b, c, d;
wire n_s, l_o;
wire n_s_check, l_o_check, function_check;

assign n_s_check = (a || b) && (~c) && (~d);
assign l_o_check = (~n_s_check);
assign function_check = ((n_s == n_s_check) && (l_o == l_o_check));

reg [4:0] cont;

Semaforo sem(a, b, c, d, n_s, l_o);

initial begin
	d = 0;
	c = 0;
	b = 0;
	a = 0;
	#5 cont = 0;
end

always @ (cont) begin
	if(cont == 16) begin
		$display("Simulacao terminada com exito.");
		$stop;
	end
end

always begin
	#5 if(function_check) begin
		d = ~d;
		if(d == 0) begin
			c = ~c;
			if(c == 0) begin
				b = ~b;
				if(b == 0) begin
					a = ~a;
				end
			end
		end
		cont = cont + 1;
	end
	else begin
		$display("ERRO - Resultado incorreto");
		$display("Simulacao terminada com erros.");
		$stop;
	end
end

endmodule