module FSM (clk, reset, address, rden, wren, load, clear, transf, ready);
input clk, reset;
output reg [4:0] address;
output reg rden, wren, load, clear, transf, ready;

reg [3:0] EstadoAtual, ProxEstado;

parameter	Inicio = 4'b0000,
				ResetInit = 4'b0001,
				TiraResetInit = 4'b0010,
				AtivaRden = 4'b0011,
				AtivaLoad = 4'b0100,
				DesativaLoad = 4'b0101,
				DesativaRden = 4'b0110,
				AtivaTransf = 4'b0111,
				DesativaTransf = 4'b1000,
				IncAddress = 4'b1001,
				ConfereAddress = 4'b1010,
				AtivaWren = 4'b1011,
				DesativaWren = 4'b1100,
				AtivaReady = 4'b1101,
				DesativaReady = 4'b1110;
				
always @ (negedge clk) begin

	case (EstadoAtual)
	
		Inicio: begin
			address <= 0;
			rden <= 1'b0;
			wren <= 1'b0;
			load <= 1'b0;
			clear <= 1'b0;
			transf <= 1'b0;
			ready <= 1'b0;
			ProxEstado <= ResetInit;
		end
		
		ResetInit: begin
			clear <= 1'b0;
			ProxEstado <= TiraResetInit;
		end
		
		TiraResetInit: begin
			clear <= 1'b1;
			ProxEstado <= AtivaRden;
		end
		
		AtivaRden: begin
			rden <= 1'b1;
			ProxEstado <= AtivaLoad;
		end
		
		AtivaLoad: begin
			load <= 1'b1;
			ProxEstado <= DesativaLoad;
		end
		
		DesativaLoad: begin
			load <= 1'b0;
			ProxEstado <= DesativaRden;
		end
		
		DesativaRden: begin
			rden <= 1'b0;
			ProxEstado <= AtivaTransf;
		end
		
		AtivaTransf: begin
			transf <= 1'b1;
			ProxEstado <= DesativaTransf;
		end
		
		DesativaTransf: begin
			transf <= 1'b0;
			ProxEstado <= IncAddress;
		end
		
		IncAddress: begin
			address <= address + 1;
			ProxEstado <= ConfereAddress;
		end
		
		ConfereAddress: begin
			if(address == 7 || address == 15 || address == 23 || address == 31)
				ProxEstado <= AtivaWren;
			else if(address == 0 || address == 8 || address == 16 || address == 24)
				ProxEstado <= ResetInit;
			else
				ProxEstado <= AtivaRden;
		end
		
		AtivaWren: begin
			wren <= 1'b1;
			ProxEstado <= DesativaWren;
		end
		
		DesativaWren: begin
			wren <= 1'b0;
			if(address >= 31)
				ProxEstado <= AtivaReady;
			else
				ProxEstado <= IncAddress;
		end
		
		AtivaReady: begin
			ready <= 1'b1;
			address <= 0;
			ProxEstado <= DesativaReady;
		end
		
		DesativaReady: begin
			ready <= 1'b0;
			ProxEstado <= ResetInit;
		end	
		
		default: ProxEstado <= Inicio;
		
		endcase
		
end

always @ (posedge clk or negedge reset) begin
	if(reset == 0)
		EstadoAtual = Inicio;
	else
		EstadoAtual = ProxEstado;
end

endmodule