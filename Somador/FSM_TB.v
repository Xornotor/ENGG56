/*TESTBENCH DO FSM*/

`define periodo 20
`define meioperiodo 10

`timescale 1ns/1ns
module FSM_TB;
reg clk, reset;
wire [4:0] address;
wire rden, wren, load, transf, clear, ready;

reg [12:0] time_pos_rden, time_neg_rden;
reg [12:0] time_pos_wren, time_neg_wren;
reg [12:0] time_pos_load, time_neg_load;
reg [12:0] time_pos_transf, time_neg_transf;
reg [12:0] time_addr;
reg endpoint;

FSM fsm_test(.clk(clk), .reset(reset), .address(address), .rden(rden), .wren(wren), .load(load), .transf(transf), .clear(clear), .ready(ready));

initial begin
	endpoint = 0;
	time_pos_rden = 0;
	time_neg_rden = 0;
	time_pos_wren = 0;
	time_neg_wren = 0;
	time_pos_load = 0;
	time_neg_load = 0;
	time_pos_transf = 0;
	time_neg_transf = 0;
	time_addr = 0;
	reset = 0;
	#`meioperiodo clk = 0;
	#`meioperiodo clk = 1;
	#`meioperiodo clk = 0;
	#`meioperiodo clk = 1;
	reset = 1;
end

always begin
	#`meioperiodo clk <= ~clk;
end

always @ (address) begin
	if($time >= 40) begin
		time_addr = $time;
		if(time_addr - time_neg_rden < `periodo || time_addr - time_pos_rden < `periodo) begin
			$display("ERRO - Distancia entre alteracao de ADDRESS e alteracao de RDEN");
			$display("deve ser de pelo menos um ciclo.");
			$display("Simulacao encerrada com erros.");
			$stop;
		end
	end
	if(address == 31) begin
		endpoint = 1;
	end
	if(address == 0 && endpoint == 1) begin
		#120 $display("Simulacao completada com sucesso.");
		$stop;
	end
end

always @ (rden) begin
	if($time >= 40) begin
		if(rden) begin
			time_pos_rden = $time;
			if(time_pos_rden - time_addr < `periodo) begin
				$display("ERRO - Distancia entre alteracao de ADDRESS e posedge de RDEN");
				$display("deve ser de pelo menos um ciclo.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
		end
		else begin
			time_neg_rden = $time;
			if(time_neg_rden - time_neg_load < `periodo) begin
				$display("ERRO - Distancia entre negedges de RDEN e LOAD deve ser de pelo menos um ciclo de clock.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
			if(time_neg_rden - time_addr < `periodo) begin
				$display("ERRO - Distancia entre alteracao de ADDRESS e negedge de RDEN");
				$display("deve ser de pelo menos um ciclo.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
		end
	end
end

always @ (wren) begin
	if($time >= 40) begin
		if(wren) begin
			time_pos_wren = $time;
			if(time_pos_wren - time_pos_transf < `periodo || time_pos_wren - time_neg_transf < `periodo) begin
				$display("ERRO - Distancia entre posedge de WREN e alteracao de TRANSF");
				$display("deve ser de pelo menos um ciclo.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
			if(transf) begin
				$display("ERRO - TRANSF nao pode estar habilitado durante posedge de WREN.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
		end
		else begin
			time_neg_wren = $time;
			if(time_neg_wren - time_pos_transf < `periodo || time_neg_wren - time_neg_transf < `periodo) begin
				$display("ERRO - Distancia entre negedge de WREN e alteracao de TRANSF");
				$display("deve ser de pelo menos um ciclo.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
			if(transf) begin
				$display("ERRO - TRANSF nao pode estar habilitado durante negedge de WREN.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
		end
	end
end

always @ (load) begin
	if($time >= 40) begin
		if(load) begin
			time_pos_load = $time;
			if(time_pos_load - time_pos_rden < `periodo) begin
				$display("ERRO - Distancia entre posedges de LOAD e RDEN deve ser de pelo menos um ciclo de clock.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
			if(transf) begin
				$display("ERRO - LOAD e TRANSF nao podem estar ativos ao mesmo tempo.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
		end
		else begin
			time_neg_load = $time;
			if(transf) begin
				$display("ERRO - LOAD e TRANSF nao podem estar ativos ao mesmo tempo.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
		end
	end
end

always @ (transf) begin
	if($time >= 40) begin
		if(transf) begin
			time_pos_transf = $time;
			if(load) begin
				$display("ERRO - LOAD e TRANSF nao podem estar ativos ao mesmo tempo.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
		end
		else begin
			time_neg_transf = $time;
			if(load) begin
				$display("ERRO - LOAD e TRANSF nao podem estar ativos ao mesmo tempo.");
				$display("Simulacao encerrada com erros.");
				$stop;
			end
		end
	end
end

endmodule