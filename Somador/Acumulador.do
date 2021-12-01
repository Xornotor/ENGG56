onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label CLK -radix binary /Acumulador_TB/clk
add wave -noupdate -label LOAD -radix binary /Acumulador_TB/load
add wave -noupdate -label TRANSFER -radix binary /Acumulador_TB/transf
add wave -noupdate -label CLEAR -radix binary /Acumulador_TB/clear
add wave -noupdate -label INPUT -radix unsigned /Acumulador_TB/in
add wave -noupdate -label OUTPUT -radix unsigned /Acumulador_TB/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ns} {1404 ns}
