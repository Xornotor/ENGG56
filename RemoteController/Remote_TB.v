/*TESTBENCH DO ACUMULADOR*/

`timescale 1us/1us
module Remote_TB;
reg clk, rst, serial;
reg [5:0] cont_bit;
wire [7:0] tecla;
wire ready;

reg ir1 [0:63];
reg ir2 [0:63];
reg ir3 [0:63];
reg ir4 [0:63];
reg [2:0] cont_aux;
reg [7:0] data_check;
reg [7:0] data_inv_check;
wire [7:0] checksum;
wire data_valida, soma_valida, tecla_valida;
wire cont_bit_condition_a, cont_bit_condition_b, cont_bit_condition_c, cont_bit_condition_d;
wire cont_data_condition, cont_data_inv_condition;

assign checksum = data_check + data_inv_check;
assign data_valida = (data_check <= 8'h1F && (data_check != 8'h0a && data_check != 8'h0b && data_check != 8'h0d && data_check != 8'h0e && data_check != 8'h15 && data_check != 8'h19 && data_check != 8'h1c && data_check != 8'h1d));
assign soma_valida = (checksum == 8'hFF);
assign tecla_valida = (tecla <= 8'h1F && (tecla != 8'h0a && tecla != 8'h0b && tecla != 8'h0d && tecla != 8'h0e && tecla != 8'h15 && tecla != 8'h19 && tecla != 8'h1c && tecla != 8'h1d));
assign cont_bit_condition_a = (cont_bit == 0);
assign cont_bit_condition_b = (cont_bit <= 33);
assign cont_bit_condition_c = (cont_bit == 35 && tecla == 8'hFF);
assign cont_bit_condition_d = (cont_bit >= 37);
assign cont_data_condition = (cont_bit >= 17 && cont_bit <= 24);
assign cont_data_inv_condition = (cont_bit >= 25 && cont_bit <= 32);

RemoteController rem(.clk(clk), .rst(rst), .serial(serial), .tecla(tecla), .ready(ready));

initial begin
	$readmemb("tecla1.txt", ir1); //Tecla 0x09
	$readmemb("tecla2.txt", ir2); //Tecla Inválida, soma de Data + DataInv != 0xFF
	$readmemb("tecla3.txt", ir3); //Tecla fora da tabela
	$readmemb("tecla4.txt", ir4); //Tecla 0x1F
	rst = 0;
	serial = 1;
	cont_bit = 0;
	cont_aux = 0;
	clk = 1;
	#13 rst = 1;
	#13 clk = 0;	
end

always begin
	#13 clk <= ~clk;
end

always @ (negedge clk) begin
	if(cont_bit_condition_a) begin
		data_check <= 0;
		data_inv_check <= 0;
	end
	if(cont_bit_condition_b) begin
		case(cont_aux)
			3'b000: #8 serial = ir1[cont_bit];
			3'b001: #8 serial = ir2[cont_bit];
			3'b010: #8 serial = ir3[cont_bit];
			3'b011: #8 serial = ir4[cont_bit];
			3'b100: begin
				$display("Simulacao finalizada com sucesso.");
				$stop;
			end
		endcase
	end
	else
		#8 serial = 1;
	#18 cont_bit <= cont_bit + 1; 
	if(cont_data_condition) data_check <= (data_check*2) + serial;
	if(cont_data_inv_condition) data_inv_check <= (data_inv_check*2) + serial;
	if(cont_bit_condition_c) begin
		if(soma_valida) begin
			if(data_valida) begin
				$display("ERRO - Ready deveria estar ativo e tecla deveria ser igual a %h", data_check);
				$display("Simulacao finalizada com erros.");
				$stop;
			end
			else $display("Valor de tecla fora da tabela");
		end
		else $display("Data + Data_Inv == %h != 0xff, comportamento correto", checksum);
	end
	if(cont_bit_condition_d) begin
		cont_bit <= 0;
		cont_aux <= cont_aux + 1;
	end
end

always @ (posedge ready) begin
	if(tecla_valida) $display("Tecla %h", tecla);
	else begin
		$display("ERRO - Retornado valor de tecla invalido");
		$display("Simulacao finalizada com erros.");
		$stop;
	end
end

endmodule