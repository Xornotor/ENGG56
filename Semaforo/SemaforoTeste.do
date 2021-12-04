onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -label A -radix binary /Semaforo_TB/a
add wave -noupdate -label B -radix binary /Semaforo_TB/b
add wave -noupdate -label C -radix binary /Semaforo_TB/c
add wave -noupdate -label D -radix binary /Semaforo_TB/d
add wave -noupdate -divider Outputs
add wave -noupdate -label N_S -radix binary /Semaforo_TB/n_s
add wave -noupdate -label L_O -radix binary /Semaforo_TB/l_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {80 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 83
configure wave -valuecolwidth 56
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
WaveRestoreZoom {0 ns} {332 ns}
run -all
