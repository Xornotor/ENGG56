onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label CLK -radix binary /Remote_TB/clk
add wave -noupdate -label RESET -radix binary /Remote_TB/rst
add wave -noupdate -label SERIAL -radix binary /Remote_TB/serial
add wave -noupdate -label {CONT BIT} -radix unsigned /Remote_TB/cont_bit
add wave -noupdate -label TECLA -radix hexadecimal -childformat {{{/Remote_TB/tecla[7]} -radix hexadecimal} {{/Remote_TB/tecla[6]} -radix hexadecimal} {{/Remote_TB/tecla[5]} -radix hexadecimal} {{/Remote_TB/tecla[4]} -radix hexadecimal} {{/Remote_TB/tecla[3]} -radix hexadecimal} {{/Remote_TB/tecla[2]} -radix hexadecimal} {{/Remote_TB/tecla[1]} -radix hexadecimal} {{/Remote_TB/tecla[0]} -radix hexadecimal}} -subitemconfig {{/Remote_TB/tecla[7]} {-height 15 -radix hexadecimal} {/Remote_TB/tecla[6]} {-height 15 -radix hexadecimal} {/Remote_TB/tecla[5]} {-height 15 -radix hexadecimal} {/Remote_TB/tecla[4]} {-height 15 -radix hexadecimal} {/Remote_TB/tecla[3]} {-height 15 -radix hexadecimal} {/Remote_TB/tecla[2]} {-height 15 -radix hexadecimal} {/Remote_TB/tecla[1]} {-height 15 -radix hexadecimal} {/Remote_TB/tecla[0]} {-height 15 -radix hexadecimal}} /Remote_TB/tecla
add wave -noupdate -label READY -radix binary /Remote_TB/ready
add wave -noupdate -label CUSTOM -radix binary -childformat {{{/Remote_TB/rem/custom[15]} -radix binary} {{/Remote_TB/rem/custom[14]} -radix binary} {{/Remote_TB/rem/custom[13]} -radix binary} {{/Remote_TB/rem/custom[12]} -radix binary} {{/Remote_TB/rem/custom[11]} -radix binary} {{/Remote_TB/rem/custom[10]} -radix binary} {{/Remote_TB/rem/custom[9]} -radix binary} {{/Remote_TB/rem/custom[8]} -radix binary} {{/Remote_TB/rem/custom[7]} -radix binary} {{/Remote_TB/rem/custom[6]} -radix binary} {{/Remote_TB/rem/custom[5]} -radix binary} {{/Remote_TB/rem/custom[4]} -radix binary} {{/Remote_TB/rem/custom[3]} -radix binary} {{/Remote_TB/rem/custom[2]} -radix binary} {{/Remote_TB/rem/custom[1]} -radix binary} {{/Remote_TB/rem/custom[0]} -radix binary}} -subitemconfig {{/Remote_TB/rem/custom[15]} {-height 15 -radix binary} {/Remote_TB/rem/custom[14]} {-height 15 -radix binary} {/Remote_TB/rem/custom[13]} {-height 15 -radix binary} {/Remote_TB/rem/custom[12]} {-height 15 -radix binary} {/Remote_TB/rem/custom[11]} {-height 15 -radix binary} {/Remote_TB/rem/custom[10]} {-height 15 -radix binary} {/Remote_TB/rem/custom[9]} {-height 15 -radix binary} {/Remote_TB/rem/custom[8]} {-height 15 -radix binary} {/Remote_TB/rem/custom[7]} {-height 15 -radix binary} {/Remote_TB/rem/custom[6]} {-height 15 -radix binary} {/Remote_TB/rem/custom[5]} {-height 15 -radix binary} {/Remote_TB/rem/custom[4]} {-height 15 -radix binary} {/Remote_TB/rem/custom[3]} {-height 15 -radix binary} {/Remote_TB/rem/custom[2]} {-height 15 -radix binary} {/Remote_TB/rem/custom[1]} {-height 15 -radix binary} {/Remote_TB/rem/custom[0]} {-height 15 -radix binary}} /Remote_TB/rem/custom
add wave -noupdate -label DATA -radix binary -childformat {{{/Remote_TB/rem/data[7]} -radix binary} {{/Remote_TB/rem/data[6]} -radix binary} {{/Remote_TB/rem/data[5]} -radix binary} {{/Remote_TB/rem/data[4]} -radix binary} {{/Remote_TB/rem/data[3]} -radix binary} {{/Remote_TB/rem/data[2]} -radix binary} {{/Remote_TB/rem/data[1]} -radix binary} {{/Remote_TB/rem/data[0]} -radix binary}} -subitemconfig {{/Remote_TB/rem/data[7]} {-height 15 -radix binary} {/Remote_TB/rem/data[6]} {-height 15 -radix binary} {/Remote_TB/rem/data[5]} {-height 15 -radix binary} {/Remote_TB/rem/data[4]} {-height 15 -radix binary} {/Remote_TB/rem/data[3]} {-height 15 -radix binary} {/Remote_TB/rem/data[2]} {-height 15 -radix binary} {/Remote_TB/rem/data[1]} {-height 15 -radix binary} {/Remote_TB/rem/data[0]} {-height 15 -radix binary}} /Remote_TB/rem/data
add wave -noupdate -label DATA_INV -radix binary -childformat {{{/Remote_TB/rem/data_inv[7]} -radix binary} {{/Remote_TB/rem/data_inv[6]} -radix binary} {{/Remote_TB/rem/data_inv[5]} -radix binary} {{/Remote_TB/rem/data_inv[4]} -radix binary} {{/Remote_TB/rem/data_inv[3]} -radix binary} {{/Remote_TB/rem/data_inv[2]} -radix binary} {{/Remote_TB/rem/data_inv[1]} -radix binary} {{/Remote_TB/rem/data_inv[0]} -radix binary}} -subitemconfig {{/Remote_TB/rem/data_inv[7]} {-height 15 -radix binary} {/Remote_TB/rem/data_inv[6]} {-height 15 -radix binary} {/Remote_TB/rem/data_inv[5]} {-height 15 -radix binary} {/Remote_TB/rem/data_inv[4]} {-height 15 -radix binary} {/Remote_TB/rem/data_inv[3]} {-height 15 -radix binary} {/Remote_TB/rem/data_inv[2]} {-height 15 -radix binary} {/Remote_TB/rem/data_inv[1]} {-height 15 -radix binary} {/Remote_TB/rem/data_inv[0]} {-height 15 -radix binary}} /Remote_TB/rem/data_inv
add wave -noupdate -label {CONT (INTERNO REMOTECONTROLLER)} -radix unsigned /Remote_TB/rem/cont
add wave -noupdate -label {CASO TESTE 1} -radix binary /Remote_TB/ir1
add wave -noupdate -label {CASO TESTE 2} -radix binary /Remote_TB/ir2
add wave -noupdate -label {CASO TESTE 3} -radix binary /Remote_TB/ir3
add wave -noupdate -label {CASO TESTE 4} -radix binary /Remote_TB/ir4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2926 us} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 161
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
configure wave -timelineunits us
update
WaveRestoreZoom {2468 us} {3392 us}
