vsim work.multiplier
add wave -position insertpoint  \
sim:/multiplier/clock \
sim:/multiplier/f \
sim:/multiplier/image \
sim:/multiplier/filter

force -freeze sim:/multiplier/clock 1 0, 0 {50 ps} -r 100
force -freeze sim:/multiplier/f 1 0
force -freeze sim:/multiplier/image 00000000000000010000001000000011000001000000010100000110000001110000100000001001000010100000101100001100000011010000111000001111000100000001000100010010000100110001010000010101000101100001011100011000 0
force -freeze sim:/multiplier/filter 00000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001 0
