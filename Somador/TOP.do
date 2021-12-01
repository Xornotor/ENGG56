onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label CLK -radix binary /TOP_TB/clk
add wave -noupdate -label RESET -radix binary /TOP_TB/reset
add wave -noupdate -label {DATA IN} -radix unsigned /TOP_TB/datain
add wave -noupdate -label {DATA OUT} -radix unsigned /TOP_TB/dataout
add wave -noupdate -label ADDRESS -radix unsigned /TOP_TB/address
add wave -noupdate -label {RD ENABLE} -radix binary /TOP_TB/rden
add wave -noupdate -label {WR ENABLE} -radix binary /TOP_TB/wren
add wave -noupdate -label READY -radix binary /TOP_TB/ready
add wave -noupdate -label {RAM MEMORY} -radix unsigned -childformat {{{/TOP_TB/mem[0]} -radix unsigned} {{/TOP_TB/mem[1]} -radix unsigned} {{/TOP_TB/mem[2]} -radix unsigned} {{/TOP_TB/mem[3]} -radix unsigned} {{/TOP_TB/mem[4]} -radix unsigned} {{/TOP_TB/mem[5]} -radix unsigned} {{/TOP_TB/mem[6]} -radix unsigned} {{/TOP_TB/mem[7]} -radix unsigned} {{/TOP_TB/mem[8]} -radix unsigned} {{/TOP_TB/mem[9]} -radix unsigned} {{/TOP_TB/mem[10]} -radix unsigned} {{/TOP_TB/mem[11]} -radix unsigned} {{/TOP_TB/mem[12]} -radix unsigned} {{/TOP_TB/mem[13]} -radix unsigned} {{/TOP_TB/mem[14]} -radix unsigned} {{/TOP_TB/mem[15]} -radix unsigned} {{/TOP_TB/mem[16]} -radix unsigned} {{/TOP_TB/mem[17]} -radix unsigned} {{/TOP_TB/mem[18]} -radix unsigned} {{/TOP_TB/mem[19]} -radix unsigned} {{/TOP_TB/mem[20]} -radix unsigned} {{/TOP_TB/mem[21]} -radix unsigned} {{/TOP_TB/mem[22]} -radix unsigned} {{/TOP_TB/mem[23]} -radix unsigned} {{/TOP_TB/mem[24]} -radix unsigned} {{/TOP_TB/mem[25]} -radix unsigned} {{/TOP_TB/mem[26]} -radix unsigned} {{/TOP_TB/mem[27]} -radix unsigned} {{/TOP_TB/mem[28]} -radix unsigned} {{/TOP_TB/mem[29]} -radix unsigned} {{/TOP_TB/mem[30]} -radix unsigned} {{/TOP_TB/mem[31]} -radix unsigned}} -expand -subitemconfig {{/TOP_TB/mem[0]} {-radix unsigned} {/TOP_TB/mem[1]} {-radix unsigned} {/TOP_TB/mem[2]} {-radix unsigned} {/TOP_TB/mem[3]} {-radix unsigned} {/TOP_TB/mem[4]} {-radix unsigned} {/TOP_TB/mem[5]} {-radix unsigned} {/TOP_TB/mem[6]} {-radix unsigned} {/TOP_TB/mem[7]} {-radix unsigned} {/TOP_TB/mem[8]} {-radix unsigned} {/TOP_TB/mem[9]} {-radix unsigned} {/TOP_TB/mem[10]} {-radix unsigned} {/TOP_TB/mem[11]} {-radix unsigned} {/TOP_TB/mem[12]} {-radix unsigned} {/TOP_TB/mem[13]} {-radix unsigned} {/TOP_TB/mem[14]} {-radix unsigned} {/TOP_TB/mem[15]} {-radix unsigned} {/TOP_TB/mem[16]} {-radix unsigned} {/TOP_TB/mem[17]} {-radix unsigned} {/TOP_TB/mem[18]} {-radix unsigned} {/TOP_TB/mem[19]} {-radix unsigned} {/TOP_TB/mem[20]} {-radix unsigned} {/TOP_TB/mem[21]} {-radix unsigned} {/TOP_TB/mem[22]} {-radix unsigned} {/TOP_TB/mem[23]} {-radix unsigned} {/TOP_TB/mem[24]} {-radix unsigned} {/TOP_TB/mem[25]} {-radix unsigned} {/TOP_TB/mem[26]} {-radix unsigned} {/TOP_TB/mem[27]} {-radix unsigned} {/TOP_TB/mem[28]} {-radix unsigned} {/TOP_TB/mem[29]} {-radix unsigned} {/TOP_TB/mem[30]} {-radix unsigned} {/TOP_TB/mem[31]} {-radix unsigned}} /TOP_TB/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {7252 ns}
