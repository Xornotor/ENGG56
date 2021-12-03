/*TESTBENCH DO FSM_CONTROL*/

`define periodo 20

`timescale 1ns/1ns
module FSM_Control_TB;
reg start, clk, rst_in;
wire ready, act_mac, rd_en, rst_out;
wire [2:0] u, v, x, y;
wire [5:0] address;

reg signed [31:0] time_pos_rden;
reg signed [31:0] time_pos_actmac;
reg signed [31:0] time_neg_actmac;
reg signed [31:0] time_neg_rden;
wire check_pos_rden_actmac, check_neg_rden_actmac;
wire [31:0] dif_pos_rden_actmac, dif_neg_rden_actmac;

reg [2:0] u_tmp, v_tmp, x_tmp, y_tmp;
reg [5:0] address_tmp;
reg start_pulse;

assign dif_pos_rden_actmac = (time_pos_actmac - time_pos_rden);
assign dif_neg_rden_actmac = (time_neg_rden - time_neg_actmac);
assign check_pos_rden_actmac = (dif_pos_rden_actmac < `periodo);
assign check_neg_rden_actmac = (dif_neg_rden_actmac < `periodo);
FSM_Control fsm_teste(start, clk, rst_in, ready, u, v, x, y, act_mac, rd_en, address, rst_out);

initial begin
    start_pulse = 0;
    u_tmp = 0;
    v_tmp = 0;
    x_tmp = 0;
    y_tmp = 0;
    address_tmp = 0;
	start = 0;
    rst_in = 0;
    clk = 1;
    #10 clk = 0;
    rst_in = 1;
    #10 clk = 1;
    #10 clk = 0;
    start = 1;
    $display("Pulso de Start", $time);
    #10 clk = 1;
    #10 clk = 0;
    start = 0;
    start_pulse = 1;
end

always begin
	#10 clk <= ~clk;
end

always @ (posedge rd_en) begin
    if(start_pulse == 1) begin
        time_pos_rden = $time;
    end
end

always @ (posedge act_mac) begin
    if(start_pulse == 1) begin
        time_pos_actmac = $time;
        //#2 $display("Diferenca subida RDEN-MAC %d ns", dif_pos_rden_actmac);
        #2 if(check_pos_rden_actmac) begin
            $display("ERRO");
            $display("Intervalo de tempo de borda de subida entre RD_EN e ACT_MAC");
            $display("menor que um ciclo de clock (%d ns)", dif_pos_rden_actmac);
            $display("Simulacao terminada com erros no tempo ", $time);
            $stop;
        end
    end
end

always @ (negedge act_mac) begin
    if(start_pulse == 1) begin
        time_neg_actmac = $time;
    end
end

always @ (negedge rd_en) begin
    if(start_pulse == 1) begin
        time_neg_rden = $time;
        //#2 $display("Diferenca descida MAC-RDEN %d ns", dif_neg_rden_actmac);
        #2 if(check_neg_rden_actmac) begin
            $display("ERRO");
            $display("Intervalo de tempo de borda de descida entre RD_EN e ACT_MAC");
            $display("menor que um ciclo de clock (%d ns)", dif_neg_rden_actmac);
            $display("Simulacao terminada com erros no tempo ", $time);
            $stop;
        end
    end
end

always @ (u) begin
    if(start_pulse == 1) begin
        if(u_tmp == 7) begin
            if(u != 0) begin
                $display("ERRO - Excursionamento da variavel U incorreto.");
                $display("Valor esperado: 0, Valor encontrado: %d", u);
                $display("Simulacao terminada com erros no tempo ", $time);
                $stop;
            end
            else u_tmp = u;
        end
        else begin
            if(u - u_tmp != 1) begin
                $display("ERRO - Excursionamento da variavel U incorreto.");
                $display("Valor esperado: %d, Valor encontrado: %d", (u_tmp + 1), u);
                $display("Simulacao terminada com erros no tempo ", $time);
                $stop;
            end
            else u_tmp = u;
        end
    end
end

always @ (v) begin
    if(start_pulse == 1) begin
        if(v_tmp == 7) begin
            if(v != 0) begin
                $display("ERRO - Excursionamento da variavel V incorreto.");
                $display("Valor esperado: 0, Valor encontrado: %d", v);
                $display("Simulacao terminada com erros no tempo ", $time);
                $stop;
            end
            else v_tmp = v;
        end
        else begin
            if(v - v_tmp != 1) begin
                $display("ERRO - Excursionamento da variavel V incorreto.");
                $display("Valor esperado: %d, Valor encontrado: %d", (v_tmp + 1), v);
                $display("Simulacao terminada com erros no tempo ", $time);
                $stop;
            end
            else v_tmp = v;
        end
    end
end

always @ (x) begin
    if(start_pulse == 1) begin
        if(x_tmp == 7) begin
            if(x != 0) begin
                $display("ERRO - Excursionamento da variavel X incorreto.");
                $display("Valor esperado: 0, Valor encontrado: %d", x);
                $display("Simulacao terminada com erros no tempo ", $time);
                $stop;
            end
            else x_tmp = x;
        end
        else begin
            if(x - x_tmp != 1) begin
                $display("ERRO - Excursionamento da variavel X incorreto.");
                $display("Valor esperado: %d, Valor encontrado: %d", (x_tmp + 1), x);
                $display("Simulacao terminada com erros no tempo ", $time);
                $stop;
            end
            else x_tmp = x;
        end
    end
end

always @ (y) begin
    if(start_pulse == 1) begin
        if(y_tmp == 7) begin
            if(y == 0) begin
                y_tmp = y;
                #1000 $display("Simulacao terminada com sucesso no tempo ", $time);
                $stop;
            end
            else begin
                $display("ERRO - Excursionamento da variavel Y incorreto.");
                $display("Valor esperado: 0, Valor encontrado: %d", y);
                $display("Simulacao terminada com erros no tempo ", $time);
                $stop;
            end
        end
        else begin
            if(y - y_tmp != 1) begin
                $display("ERRO - Excursionamento da variavel Y incorreto.");
                $display("Valor esperado: %d, Valor encontrado: %d", (y_tmp + 1), y);
                $display("Simulacao terminada com erros no tempo ", $time);
                $stop;
            end
            else y_tmp = y;
        end
    end
end

always @ (address) begin
    if(start_pulse == 1) begin
        if(address_tmp == 63) begin
            if(address != 0) begin
                $display("ERRO - Excursionamento da variavel ADDRESS incorreto.");
                $display("Valor esperado: 0, Valor encontrado: %d", address);
                $display("Simulacao terminada com erros no tempo ", $time);
                $stop;
            end
            else address_tmp = address;
        end
        else begin
            if(address - address_tmp != 1) begin
                $display("ERRO - Excursionamento da variavel ADDRESS incorreto.");
                $display("Valor esperado: %d, Valor encontrado: %d", (address_tmp + 1), address);
                $display("Simulacao terminada com erros no tempo ", $time);
                $stop;
            end
            else address_tmp = address;
        end
    end
end

always @ (posedge ready) begin
    if(start_pulse == 1) begin
        if(u != 7 || v != 7 || address != 63) begin
            $display("ERRO - Pulso de Ready disparado incorretamente");
            $display("Simulacao terminada com erros no tempo ", $time);
            $stop;
        end
    end
end

always @ (negedge rst_out) begin
    if(start_pulse == 1) begin
        if(u != 0 || v != 0 || address != 0) begin
            $display("ERRO - Pulso de Reset Out disparado incorretamente");
            $display("Simulacao terminada com erros no tempo ", $time);
            $stop;
        end
    end
end

endmodule
