onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Inputs TB}
add wave -noupdate -label CLK /TOP_TB/clk
add wave -noupdate -label RESET /TOP_TB/reset
add wave -noupdate -divider Top
add wave -noupdate -label {ADDRESS (TOP)} -radix unsigned /TOP_TB/address_top
add wave -noupdate -label DATA_IN -radix unsigned /TOP_TB/top_teste/datain
add wave -noupdate -label DATA_OUT -radix unsigned /TOP_TB/dataout
add wave -noupdate -label {RDEN (TOP)} /TOP_TB/top_teste/rden
add wave -noupdate -label WREN -radix binary /TOP_TB/wren
add wave -noupdate -label READY -radix binary /TOP_TB/ready
add wave -noupdate -divider {Memory Check & Debug}
add wave -noupdate -label R_MEM -radix unsigned -childformat {{{/TOP_TB/r_mem[0]} -radix unsigned} {{/TOP_TB/r_mem[1]} -radix unsigned} {{/TOP_TB/r_mem[2]} -radix unsigned} {{/TOP_TB/r_mem[3]} -radix unsigned} {{/TOP_TB/r_mem[4]} -radix unsigned} {{/TOP_TB/r_mem[5]} -radix unsigned} {{/TOP_TB/r_mem[6]} -radix unsigned} {{/TOP_TB/r_mem[7]} -radix unsigned} {{/TOP_TB/r_mem[8]} -radix unsigned} {{/TOP_TB/r_mem[9]} -radix unsigned} {{/TOP_TB/r_mem[10]} -radix unsigned} {{/TOP_TB/r_mem[11]} -radix unsigned} {{/TOP_TB/r_mem[12]} -radix unsigned} {{/TOP_TB/r_mem[13]} -radix unsigned} {{/TOP_TB/r_mem[14]} -radix unsigned} {{/TOP_TB/r_mem[15]} -radix unsigned} {{/TOP_TB/r_mem[16]} -radix unsigned} {{/TOP_TB/r_mem[17]} -radix unsigned} {{/TOP_TB/r_mem[18]} -radix unsigned} {{/TOP_TB/r_mem[19]} -radix unsigned} {{/TOP_TB/r_mem[20]} -radix unsigned} {{/TOP_TB/r_mem[21]} -radix unsigned} {{/TOP_TB/r_mem[22]} -radix unsigned} {{/TOP_TB/r_mem[23]} -radix unsigned} {{/TOP_TB/r_mem[24]} -radix unsigned} {{/TOP_TB/r_mem[25]} -radix unsigned} {{/TOP_TB/r_mem[26]} -radix unsigned} {{/TOP_TB/r_mem[27]} -radix unsigned} {{/TOP_TB/r_mem[28]} -radix unsigned} {{/TOP_TB/r_mem[29]} -radix unsigned} {{/TOP_TB/r_mem[30]} -radix unsigned} {{/TOP_TB/r_mem[31]} -radix unsigned}} -subitemconfig {{/TOP_TB/r_mem[0]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[1]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[2]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[3]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[4]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[5]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[6]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[7]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[8]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[9]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[10]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[11]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[12]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[13]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[14]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[15]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[16]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[17]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[18]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[19]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[20]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[21]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[22]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[23]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[24]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[25]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[26]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[27]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[28]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[29]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[30]} {-height 15 -radix unsigned} {/TOP_TB/r_mem[31]} {-height 15 -radix unsigned}} /TOP_TB/r_mem
add wave -noupdate -label {VALORES ESPERADOS} -radix unsigned -childformat {{{/TOP_TB/esperado[0]} -radix unsigned} {{/TOP_TB/esperado[1]} -radix unsigned} {{/TOP_TB/esperado[2]} -radix unsigned} {{/TOP_TB/esperado[3]} -radix unsigned}} -subitemconfig {{/TOP_TB/esperado[0]} {-height 15 -radix unsigned} {/TOP_TB/esperado[1]} {-height 15 -radix unsigned} {/TOP_TB/esperado[2]} {-height 15 -radix unsigned} {/TOP_TB/esperado[3]} {-height 15 -radix unsigned}} /TOP_TB/esperado
add wave -noupdate -divider Acumulador
add wave -noupdate -label LOAD -radix binary /TOP_TB/top_teste/acc/load
add wave -noupdate -label TRANSF -radix binary /TOP_TB/top_teste/acc/transf
add wave -noupdate -label CLEAR -radix binary /TOP_TB/top_teste/acc/clear
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9234 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 168
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
WaveRestoreZoom {0 ns} {28640 ns}
