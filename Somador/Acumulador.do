onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label CLK /Acumulador_TB/clk
add wave -noupdate -label LOAD /Acumulador_TB/load
add wave -noupdate -label TRANSF /Acumulador_TB/transf
add wave -noupdate -label CLEAR /Acumulador_TB/clear
add wave -noupdate -label IN -radix unsigned /Acumulador_TB/in
add wave -noupdate -label OUT -radix unsigned /Acumulador_TB/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {690 ns} 0}
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
WaveRestoreZoom {0 ns} {1 us}
