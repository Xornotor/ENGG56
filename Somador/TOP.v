module TOP (clk, reset, ready, address, rden, wren, datain, dataout);
input [15:0] datain;
input clk, reset;
output [15:0] dataout;
output [4:0] address;
output rden, wren, ready;
wire load, clear, transf;

Acumulador acc(clk, datain, load, clear, transf, dataout);
FSM fsm(clk, reset, address, rden, wren, load, clear, transf, ready);

endmodule 