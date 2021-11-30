onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /FSM_TB/clk
add wave -noupdate -radix binary /FSM_TB/reset
add wave -noupdate -radix unsigned /FSM_TB/address
add wave -noupdate -radix binary /FSM_TB/rden
add wave -noupdate -radix binary /FSM_TB/wren
add wave -noupdate -radix binary /FSM_TB/load
add wave -noupdate -radix binary /FSM_TB/transf
add wave -noupdate -radix binary /FSM_TB/clear
add wave -noupdate -radix binary /FSM_TB/ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3158 ns} 0}
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
WaveRestoreZoom {0 ns} {4 us}
