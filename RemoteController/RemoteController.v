module RemoteController (clk, rst, serial, tecla, ready);
input clk, rst, serial;
output reg [7:0] tecla;
output reg ready;

reg [15:0] custom;
reg [7:0] data, data_inv;
reg [5:0] cont;

always @ (posedge clk) begin
	if(rst == 0)
		begin
			ready <= 0;
			cont <= 0;
			tecla <= 8'hFF;
			custom <= 16'h0000;
			data <= 8'h00;
			data_inv <= 8'h00;
		end
	else
		begin
			if(serial == 0 && cont == 0) begin
				cont <= 1;
			end
		end
	if (cont >= 1 && cont <= 16) begin
		custom <= (custom * 2) + serial;
		cont <= cont + 1;
	end
	else if (cont >= 17 && cont <= 24) begin
		data <= (data * 2) + serial;
		cont <= cont + 1;
	end
	else if (cont >= 25 && cont <= 32) begin
		data_inv <= (data_inv * 2) + serial;
		cont <= cont + 1;
	end
	else if (cont == 33) begin
		if(data + data_inv == 8'hFF) begin
			if(data <= 8'h1F && (data != 8'h0a && data != 8'h0b && data != 8'h0d && data != 8'h0e && data != 8'h15 && data != 8'h19 && data != 8'h1c && data != 8'h1d)) begin
				ready <= 1;
				tecla <= data;
			end
		end
		cont <= cont + 1;
	end
	else if (cont >= 34 && cont <= 35)
		cont <= cont + 1;
	else if (cont >= 36) begin
		cont <= 0;
		ready <= 0;
		tecla <= 8'hFF;
		custom <= 16'h0000;
		data <= 8'h00;
		data_inv <= 8'h00;
	end
end

endmodule