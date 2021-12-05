/*TESTBENCH DO TOP*/

`define periodo 20
`define meioperiodo (`periodo/2)

`timescale 1ns/1ns
module TOP_TB;

reg clk, reset;
wire [15:0] datain;
wire [15:0] dataout;
wire [4:0] address_mem;

wire [4:0] address_top;
wire wren, ready;
wire rden_mem;
wire rden_top;
wire clk_top;

reg rden_tb;
reg [15:0] r_mem [0:31];
reg [4:0] cont_mem_read;
reg ativa_clk_top;

reg [13:0] time_addr, time_datain, time_dataout;
reg [13:0] time_pos_rden, time_neg_rden;
reg [13:0] time_pos_wren, time_neg_wren;
reg [13:0] time_pos_ready, time_neg_ready;

assign clk_top = ativa_clk_top && clk;
assign address_mem = address_top | cont_mem_read;
assign rden_mem = rden_top || rden_tb;

TOP top_teste(.clk(clk_top), .reset(reset), .address(address_top), .rden(rden_top), .wren(wren), .ready(ready), .datain(datain), .dataout(dataout));
Mem ram(.address(address_mem), .clock(clk), .data(dataout), .rden(rden_mem), .wren(wren), .q(datain));

initial begin
	ativa_clk_top = 1;
	rden_tb = 0;
	cont_mem_read = 0;
	reset = 0;
	#`meioperiodo clk = 0;
	#`meioperiodo clk = 1;
	#`meioperiodo clk = 0;
	ativa_clk_top = 0;
	reset = 1;
	#`meioperiodo clk = 1;
	#`meioperiodo clk = 0;
	repeat(32) begin
		rden_tb = 1;
		#`meioperiodo clk = 1;
		#`meioperiodo clk = 0;
		rden_tb = 0;
		#`meioperiodo clk = 1;
		#`meioperiodo clk = 0;
		#`meioperiodo clk = 1;
		#(`meioperiodo/2) r_mem[cont_mem_read] = datain;
		cont_mem_read = cont_mem_read + 1;
		#(`meioperiodo/2) clk = 0;
		#`meioperiodo clk = 1;
		#`meioperiodo clk = 0;
	end
	$display("Memoria RAM Clonada.");
	ativa_clk_top = 1;
end

always begin
	#`meioperiodo clk <= ~clk;
end

always @ (posedge wren) begin
	r_mem[address_mem] = dataout;
end

always @ (address_top) begin
	time_addr = $time;
end

always @ (datain) begin
	time_datain = $time;
	if(time_datain - time_pos_rden > (2)*`periodo) begin
		$display("ERRO - Input do acumulador nao estavel antes do proximo load.");
		$display("Simulacao encerrada com erros.");
		$stop;
	end
end

always @ (dataout) begin
	time_dataout = $time;
	if(time_dataout - time_pos_rden < `periodo) begin
		$display("ERRO - Input do acumulador nao estavel antes do proximo load.");
		$display("Simulacao encerrada com erros.");
		$stop;
	end
end

always @ (wren) begin
	if(wren) begin
		time_pos_wren = $time;
		if(time_pos_wren - time_addr < `periodo) begin
			$display("ERRO - Diferenca entre posedge de WREN e alteracao de ADDRESS");
			$display("menor que um pulso de clock.");
			$display("Simulacao encerrada com erros.");
			$stop;
		end
	end
	else begin
		time_neg_wren = $time;
		if(time_neg_wren - time_addr < time_pos_wren - time_addr) begin
			$display("ERRO - ADDRESS alterado durante WREN ativado.");
			$display("Simulacao encerrada com erros.");
			$stop;
		end
	end
end

always @ (rden_top) begin
	if(rden_top) begin
		time_pos_rden = $time;
	end
	else begin
		time_neg_rden = $time;
		if(time_neg_rden - time_pos_rden < 4*`periodo) begin
			$display("ERRO - RDEN nao ficou ativo por tempo suficiente para");
			$display("garantir a correta leitura de DATAIN pelo Acumulador.");
			$display("Simulacao encerrada com erros.");
			$stop;
		end
	end
end

always @ (ready) begin
	if(ready) begin
		time_pos_ready = $time;
	end
	else begin
		time_neg_ready = $time;
		if(time_neg_ready > 0) begin
			#200 $display("Simulacao concluida com sucesso.");
			$stop;
		end
	end
end

endmodule