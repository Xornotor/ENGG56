module FSM_Control (start, clk, rst_in, ready, u, v, x, y, act_mac, rd_en, address, rst_out);
input start, clk, rst_in;
output reg ready, act_mac, rd_en, rst_out;
output reg [2:0] u, v, x, y;
output reg [5:0] address;

reg [3:0] EstadoAtual, ProxEstado;

parameter 	Inicio = 4'b0000,
				ResetInit = 4'b0001,
				TiraResetInit = 4'b0010,
				AtivaRden = 4'b0011,
				AtivaMac = 4'b0100,
				DesativaMac = 4'b0101,
				DesativaRden = 4'b0110,
				Inc_UV_Addr = 4'b0111,
				AtivaReady = 4'b1000,
				DesativaReady = 4'b1001,
				Inc_XY = 4'b1010;

always @ (negedge clk) begin

	case (EstadoAtual)
	
		Inicio: begin
			ready <= 0;
			act_mac <= 0;
			rd_en <= 0;
			rst_out <= 0;
			u <= 0;
			v <= 0;
			x <= 0;
			y <= 0;
			address <= 0;
			if (start == 1)
				ProxEstado <= ResetInit;
			else
				ProxEstado <= Inicio;
		end
		
		ResetInit: begin
			rst_out <= 0;
			ProxEstado <= TiraResetInit;
		end
		
		TiraResetInit: begin
			rst_out <= 1;
			ProxEstado <= AtivaRden;
		end
		
		AtivaRden: begin
			rd_en <= 1;
			ProxEstado <= AtivaMac;
		end
		
		AtivaMac: begin
			act_mac <= 1;
			ProxEstado <= DesativaMac;
		end
		
		DesativaMac: begin
			act_mac <= 0;
			ProxEstado <= DesativaRden;
		end
		
		DesativaRden: begin
			rd_en <= 0;
			if(u == 7 && v == 7)
				ProxEstado <= AtivaReady;
			else
				ProxEstado <= Inc_UV_Addr;
		end
		
		Inc_UV_Addr: begin
			address <= address + 1;
			if(v == 7) begin
				u <= u + 1;
				v <= 0;
			end
			else begin
				u <= u;
				v <= v + 1;
			end
			ProxEstado <= AtivaRden;
		end
		
		AtivaReady: begin
			u <= 0;
			v <= 0;
			address <= 0;
			ready <= 1;
			ProxEstado <= DesativaReady;
		end
		
		DesativaReady: begin
			ready <= 0;
			if(x == 7 && y == 7)
				ProxEstado <= Inicio;
			else
				ProxEstado <= Inc_XY;
		end
		
		Inc_XY: begin
			if(x == 7) begin
				x <= 0;
				y <= y + 1;
			end
			else begin
				x <= x + 1;
				y <= y;
			end
			ProxEstado <= ResetInit;
		end
	
	endcase

end

always @ (posedge clk or negedge rst_in) begin
	if(rst_in == 0)
		EstadoAtual = Inicio;
	else
		EstadoAtual = ProxEstado;
end

endmodule