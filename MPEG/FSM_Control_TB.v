/*TESTBENCH DO FSM_CONTROL*/

`timescale 1ns/1ns
module FSM_Control_TB;
reg start, clk, rst_in;
wire ready, act_mac, rd_en, rst_out;
wire [2:0] u, v, x, y;
wire [5:0] address;

FSM_Control fsm_teste(start, clk, rst_in, ready, u, v, x, y, act_mac, rd_en, address, rst_out);

initial begin
	start = 0;
    rst_in = 0;
    #10 clk = 1;
    #10 clk = 0;
    rst_in = 1;
    start = 1;
    #10 clk = 1;
    #10 clk = 0;
    start = 0;
end

always begin
	#13 clk <= ~clk;
end

endmodule
