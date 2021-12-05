onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -label CLK -radix binary /FSM_Control_TB/clk
add wave -noupdate -label START -radix binary /FSM_Control_TB/start
add wave -noupdate -label {RESET IN} -radix binary /FSM_Control_TB/rst_in
add wave -noupdate -divider Outputs
add wave -noupdate -label {ACTIVE MAC} -radix binary /FSM_Control_TB/act_mac
add wave -noupdate -label {RD ENABLE} -radix binary /FSM_Control_TB/rd_en
add wave -noupdate -label READY -radix binary /FSM_Control_TB/ready
add wave -noupdate -label {RESET OUT} -radix binary /FSM_Control_TB/rst_out
add wave -noupdate -label V -radix unsigned /FSM_Control_TB/v
add wave -noupdate -label U -radix unsigned /FSM_Control_TB/u
add wave -noupdate -label ADDRESS -radix unsigned /FSM_Control_TB/address
add wave -noupdate -label X -radix unsigned /FSM_Control_TB/x
add wave -noupdate -label Y -radix unsigned /FSM_Control_TB/y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {644 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 172
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
WaveRestoreZoom {0 ns} {974848 ns}
