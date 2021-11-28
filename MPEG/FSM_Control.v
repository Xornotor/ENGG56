module FSM_Control (start, clk, rst, ready, u, v, x, y, act_mac, rd_en, addr);
input start, clk, rst;
output reg ready, act_mac, rd_en;
output reg [2:0] u, v, x, y;
output reg [5:0] addr;

endmodule