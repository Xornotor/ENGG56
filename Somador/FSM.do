onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -label CLK -radix binary /FSM_TB/clk
add wave -noupdate -label RESET -radix binary /FSM_TB/reset
add wave -noupdate -divider Outputs
add wave -noupdate -label ADDRESS -radix unsigned -childformat {{{/FSM_TB/address[4]} -radix unsigned} {{/FSM_TB/address[3]} -radix unsigned} {{/FSM_TB/address[2]} -radix unsigned} {{/FSM_TB/address[1]} -radix unsigned} {{/FSM_TB/address[0]} -radix unsigned}} -subitemconfig {{/FSM_TB/address[4]} {-height 15 -radix unsigned} {/FSM_TB/address[3]} {-height 15 -radix unsigned} {/FSM_TB/address[2]} {-height 15 -radix unsigned} {/FSM_TB/address[1]} {-height 15 -radix unsigned} {/FSM_TB/address[0]} {-height 15 -radix unsigned}} /FSM_TB/address
add wave -noupdate -label {RD ENABLE} -radix binary /FSM_TB/rden
add wave -noupdate -label {WR ENABLE} -radix binary /FSM_TB/wren
add wave -noupdate -label LOAD -radix binary /FSM_TB/load
add wave -noupdate -label TRANSFER -radix binary /FSM_TB/transf
add wave -noupdate -label CLEAR -radix binary /FSM_TB/clear
add wave -noupdate -label READY -radix binary /FSM_TB/ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {91 ns} 0}
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
WaveRestoreZoom {2440 ns} {8840 ns}
run -all
