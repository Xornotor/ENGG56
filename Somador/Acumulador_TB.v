/*TESTBENCH DO ACUMULADOR*/

`timescale 1ns/1ns
module Acumulador_TB;
reg clk, load, transf, clear;
reg [15:0] in;
wire [15:0] out;

reg [16:0] esperado;
reg [6:0] cont;
reg control;

Acumulador acc(.clk(clk), .load(load), .transf(transf), .clear(clear), .in(in), .out(out));

initial begin
	esperado = 0;
	control = 0;
	cont = 0;
	clk = 1'b0;
	load = 1'b1;
	transf = 1'b0;
	clear = 1'b0;
	in = 16'b0000000000000000;
	#33 clear = 1'b1;
end

always begin
	#10 clk <= ~clk;
end

always @ (posedge clk) begin
	case({load, transf})
		2'b00: begin
			if(control) begin
				transf = 1;
				esperado = esperado + in;
			end
			else begin
				load = 1;
			end
		end

		2'b01: begin
			transf = 0;
			control = 0;
			cont <= cont + 1;
			if(esperado[15:0] != out) begin
				$display("ERRO - Soma com resultado diferente do esperado.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
			else begin
				if(esperado[16] == 1) begin
					$display("Esperado = %d, Resultado: %d (Carry ativado)", esperado, out);
					esperado[16] = 0;
				end
				else
					$display("Esperado = %d, Resultado: %d", esperado, out);
			end
			if(cont == 20 || cont == 40 || cont == 60 || cont == 80) begin
				#3 clear = 0;
				esperado = 0;
				#3 clear = 1;
				cont <= cont + 1;
			end
			#5 in = $random;
		end

		2'b10: begin
			load = 0;
			control = 1;
		end

		2'b11: begin
			$display("ERRO - Load e Transf nao podem ser ativados ao mesmo tempo");
			$display("Simulacao encerrada com erros.");
			$stop;
		end
	endcase

	if(cont == 101) begin
		$display("Simulacao concluida com exito.");
		$stop;
	end
end

endmodule