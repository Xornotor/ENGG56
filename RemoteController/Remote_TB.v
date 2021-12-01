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
reg [1:0] cont_aux;

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
	if(cont_bit <= 33) begin
		case(cont_aux)
			2'b00: #8 serial = ir1[cont_bit];
			2'b01: #8 serial = ir2[cont_bit];
			2'b10: #8 serial = ir3[cont_bit];
			2'b11: #8 serial = ir4[cont_bit];
		endcase
	end
	else
		#8 serial = 1;
	#18 cont_bit <= cont_bit + 1; 
	if(cont_bit >= 37) begin
		cont_bit <= 0;
		cont_aux <= cont_aux + 1;
	end
end

endmodule