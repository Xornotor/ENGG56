module FSM (clk, reset, address, rden, wren, load, clear, transf, ready);
input clk, reset;
output reg [4:0] address;
output reg rden, wren, load, clear, transf, ready;

reg address_inc, address_zero;

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
				WaitAddress = 4'b1010,
				ConfereAddress = 4'b1011,
				AtivaWren = 4'b1100,
				DesativaWren = 4'b1101,
				AtivaReady = 4'b1110,
				DesativaReady = 4'b1111;
				
always @ (EstadoAtual) begin

	case (EstadoAtual)
	
		Inicio: ProxEstado = ResetInit;
		
		ResetInit: ProxEstado = TiraResetInit;
		
		TiraResetInit: ProxEstado = AtivaRden;
		
		AtivaRden: ProxEstado = AtivaLoad;
		
		AtivaLoad: ProxEstado = DesativaLoad;
		
		DesativaLoad: ProxEstado = DesativaRden;
		
		DesativaRden: ProxEstado = AtivaTransf;
		
		AtivaTransf: ProxEstado = DesativaTransf;
		
		DesativaTransf: ProxEstado = IncAddress;
		
		IncAddress: ProxEstado = WaitAddress;
		
		WaitAddress: ProxEstado = ConfereAddress;
		
		ConfereAddress: begin
			if(address == 7 || address == 15 || address == 23 || address == 31)
				ProxEstado = AtivaWren;
			else if(address == 0 || address == 8 || address == 16 || address == 24)
				ProxEstado = ResetInit;
			else
				ProxEstado = AtivaRden;
		end
		
		AtivaWren: ProxEstado = DesativaWren;
		
		DesativaWren: begin
			if(address >= 31)
				ProxEstado = AtivaReady;
			else
				ProxEstado = IncAddress;
		end
		
		AtivaReady: ProxEstado = DesativaReady;
		
		DesativaReady: ProxEstado = ResetInit;	
		
		default: ProxEstado = Inicio;
		
		endcase
		
end

always @ (negedge clk or negedge reset) begin
	if(reset == 0)
		EstadoAtual <= Inicio;
	else
		EstadoAtual <= ProxEstado;
end

always @ (EstadoAtual) begin

	if(EstadoAtual == AtivaRden || EstadoAtual == AtivaLoad || EstadoAtual == DesativaLoad)
		rden = 1'b1;
	else
		rden = 1'b0;
		
	if(EstadoAtual == AtivaLoad)
		load = 1'b1;
	else
		load = 1'b0;
		
	if(EstadoAtual == AtivaWren)
		wren = 1'b1;
	else
		wren = 1'b0;
		
	if(EstadoAtual == Inicio || EstadoAtual == ResetInit)
		clear = 1'b0;
	else
		clear = 1'b1;
		
	if(EstadoAtual == AtivaTransf)
		transf = 1'b1;
	else
		transf = 1'b0;
		
	if(EstadoAtual == AtivaReady)
		ready = 1'b1;
	else
		ready = 1'b0;
		
	if(EstadoAtual == Inicio || EstadoAtual == AtivaReady)
		address_zero = 1'b1;
	else
		address_zero = 1'b0;
		
	if(EstadoAtual == IncAddress)
		address_inc = 1'b1;
	else
		address_inc = 1'b0;
		
end

always @ (negedge clk) begin
	if(address_zero) address <= 0;
	if(address_inc) address <= address + 1;
end

endmodule