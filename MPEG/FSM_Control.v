module FSM_Control (start, clk, rst_in, ready, u, v, x, y, act_mac, rd_en, address, rst_out);
input start, clk, rst_in;
output reg ready, act_mac, rd_en, rst_out;
output reg [2:0] u, v, x, y;
output reg [5:0] address;

reg u_zero, u_inc;
reg v_zero, v_inc;
reg x_zero, x_inc;
reg y_zero, y_inc;
reg address_zero, address_inc;

reg [3:0] EstadoAtual, ProxEstado;

parameter 	Inicio = 4'b0000,
				ResetInit = 4'b0001,
				TiraResetInit = 4'b0010,
				AtivaRden = 4'b0011,
				WaitRden = 4'b0100,
				AtivaMac = 4'b0101,
				DesativaMac = 4'b0110,
				DesativaRden = 4'b0111,
				Inc_UV_Addr = 4'b1000,
				Wait_UV_Addr = 4'b1001,
				AtivaReady = 4'b1010,
				DesativaReady = 4'b1011,
				Compara_XY = 4'b1100,
				Inc_XY = 4'b1101;
				
always @ (EstadoAtual or start or u or v or x or y) begin

	case (EstadoAtual)
	
		Inicio: begin
			if (start == 1)
				ProxEstado = ResetInit;
			else
				ProxEstado = Inicio;
		end
		
		ResetInit: ProxEstado = TiraResetInit;
		
		TiraResetInit: ProxEstado = AtivaRden;
		
		AtivaRden: ProxEstado = WaitRden;
		
		WaitRden: ProxEstado = AtivaMac;
		
		AtivaMac: ProxEstado = DesativaMac;
		
		DesativaMac: ProxEstado = DesativaRden;
		
		DesativaRden: begin
			if(u == 7 && v == 7)
				ProxEstado = AtivaReady;
			else
				ProxEstado = Inc_UV_Addr;
		end
		
		AtivaReady: ProxEstado = DesativaReady;
		
		DesativaReady: ProxEstado = Compara_XY;
		
		Inc_UV_Addr: ProxEstado = Wait_UV_Addr;
		
		Wait_UV_Addr: ProxEstado = AtivaRden;
		
		Compara_XY: begin
			if(x == 7 && y == 7)
				ProxEstado = Inicio;
			else
				ProxEstado = Inc_XY;
		end
		
		Inc_XY: ProxEstado = ResetInit;
		
		default: ProxEstado = Inicio;
	
	endcase

end

always @ (negedge clk or negedge rst_in) begin
	if(rst_in == 0)
		EstadoAtual <= Inicio;
	else
		EstadoAtual <= ProxEstado;
end

always @ (EstadoAtual) begin

	if(EstadoAtual == AtivaMac)
		act_mac = 1;
	else
		act_mac = 0;
		
	if(EstadoAtual == AtivaReady)
		ready = 1;
	else
		ready = 0;
		
	if(EstadoAtual == Inicio || EstadoAtual == ResetInit)
		rst_out = 0;
	else
		rst_out = 1;
		
	if(EstadoAtual == AtivaRden || EstadoAtual == WaitRden || EstadoAtual == AtivaMac || EstadoAtual == DesativaMac)
		rd_en = 1;
	else
		rd_en = 0;

end

always @ (EstadoAtual) begin

	if (EstadoAtual == Inicio || EstadoAtual == AtivaReady)
		u_zero = 1'b1;
	else
		u_zero = 1'b0;

	if (EstadoAtual == Inicio || EstadoAtual == AtivaReady || (EstadoAtual == Inc_UV_Addr && v == 7))
		v_zero = 1'b1;
	else
		v_zero = 1'b0;

	if (EstadoAtual == Inicio || (EstadoAtual == Inc_XY && x == 7))
		x_zero = 1'b1;
	else
		x_zero = 1'b0;

	if (EstadoAtual == Inicio)
		y_zero = 1'b1;
	else
		y_zero = 1'b0;

	if (EstadoAtual == Inicio || EstadoAtual == AtivaReady)
		address_zero = 1'b1;
	else
		address_zero = 1'b0;

	if (EstadoAtual == Inc_UV_Addr && v == 7)
		u_inc = 1'b1;
	else
		u_inc = 1'b0;

	if (EstadoAtual == Inc_UV_Addr && v != 7)
		v_inc = 1'b1;
	else
		v_inc = 1'b0;

	if (EstadoAtual == Inc_XY && x != 7)
		x_inc = 1'b1;
	else
		x_inc = 1'b0;

	if (EstadoAtual == Inc_XY && x == 7)
		y_inc = 1'b1;
	else
		y_inc = 1'b0;

	if (EstadoAtual == Inc_UV_Addr)
		address_inc = 1'b1;
	else
		address_inc = 1'b0;
	
end

always @ (negedge clk) begin
	if (x_zero) x <= 0;
	if (x_inc) x <= x + 1;
	
	if (y_zero) y <= 0;
	if (y_inc) y <= y + 1;

	if (u_zero) u <= 0;
	if (u_inc) u <= u + 1;
	
	if (v_zero) v <= 0;
	if (v_inc) v <= v + 1;
	
	if (address_zero) address <= 0;
	if (address_inc) address <= address + 1;
end

endmodule