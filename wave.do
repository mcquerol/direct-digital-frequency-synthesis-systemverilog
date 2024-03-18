onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Analog-Step -height 74 -max 64.0 -min -64.0 -expand /ddfs_tb/tb_q
add wave -noupdate /ddfs_tb/tb_clk
add wave -noupdate /ddfs_tb/tb_reset_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20930000 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {5250105 ns}
