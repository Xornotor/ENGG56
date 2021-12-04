module FSM (clk, reset, address, rden, wren, load, clear, transf, ready);
input clk, reset;
output reg [4:0] address;
output reg rden, wren, load, clear, transf, ready;

reg address_inc, address_zero;

reg [4:0] EstadoAtual, ProxEstado;

parameter	Inicio = 5'b00000,
				ResetInit = 5'b00001,
				TiraResetInit = 5'b00010,
				AtivaRden = 5'b00011,
				WaitRden = 5'b00100,
				AtivaLoad = 5'b00101,
				DesativaLoad = 5'b00110,
				DesativaRden = 5'b00111,
				AtivaTransf = 5'b01000,
				DesativaTransf = 5'b01001,
				IncAddress = 5'b01010,
				WaitAddress = 5'b01011,
				ConfereAddress = 5'b01100,
				AtivaWren = 5'b01101,
				DesativaWren = 5'b01110,
				AtivaReady = 5'b01111,
				DesativaReady = 5'b10000;
				
always @ (EstadoAtual) begin

	case (EstadoAtual)
	
		Inicio: ProxEstado = ResetInit;
		
		ResetInit: ProxEstado = TiraResetInit;
		
		TiraResetInit: ProxEstado = AtivaRden;
		
		AtivaRden: ProxEstado = WaitRden;
		
		WaitRden: ProxEstado = AtivaLoad;
		
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

	if(EstadoAtual == AtivaRden || EstadoAtual == WaitRden || EstadoAtual == AtivaLoad || EstadoAtual == DesativaLoad)
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