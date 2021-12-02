module RemoteController (clk, rst, serial, tecla, ready);
input clk, rst, serial;
output reg [7:0] tecla;
output reg ready;

reg [15:0] custom;
reg [7:0] data, data_inv;
reg [5:0] cont;
wire cont_init, cont_custom, cont_data, cont_data_inv, cont_validate, cont_wait, cont_end, test_validate;

assign cont_init = (serial == 0 && cont == 0);
assign cont_custom = (cont >= 1 && cont <= 16);
assign cont_data = (cont >= 17 && cont <= 24);
assign cont_data_inv = (cont >= 25 && cont <= 32);
assign cont_validate = (cont == 33);
assign cont_wait = (cont >= 34 && cont <= 35);
assign cont_end = (cont >= 36);
assign test_validate = ((data + data_inv == 8'hFF) && (data <= 8'h1F && (data != 8'h0a && data != 8'h0b && data != 8'h0d && data != 8'h0e && data != 8'h15 && data != 8'h19 && data != 8'h1c && data != 8'h1d)));

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
			if(cont_init) begin
				cont <= 1;
			end
		end
	if (cont_custom) begin
		custom <= (custom * 2) + serial;
		cont <= cont + 1;
	end
	else if (cont_data) begin
		data <= (data * 2) + serial;
		cont <= cont + 1;
	end
	else if (cont_data_inv) begin
		data_inv <= (data_inv * 2) + serial;
		cont <= cont + 1;
	end
	else if (cont_validate) begin
		if(test_validate) begin
			ready <= 1;
			tecla <= data;
		end
		cont <= cont + 1;
	end
	else if (cont_wait)
		cont <= cont + 1;
	else if (cont_end) begin
		cont <= 0;
		ready <= 0;
		tecla <= 8'hFF;
		custom <= 16'h0000;
		data <= 8'h00;
		data_inv <= 8'h00;
	end
end

endmodule