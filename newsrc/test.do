project compileall
vsim work.multiplierpipe

add wave -position insertpoint  \
sim:/multiplierpipe/clock \
sim:/multiplierpipe/image \
sim:/multiplierpipe/filter \
sim:/multiplierpipe/inverted_filter \
sim:/multiplierpipe/result \
sim:/multiplierpipe/P_7
force -freeze sim:/multiplierpipe/clock 0 0, 1 {50 ps} -r 100
force -freeze sim:/multiplierpipe/filter 10101010 0
force -freeze sim:/multiplierpipe/inverted_filter 01010110 0

force -freeze sim:/multiplierpipe/image 00000111 0
run 100 ps 

force -freeze sim:/multiplierpipe/image 00000110 0
run 100 ps

force -freeze sim:/multiplierpipe/image 00000101 0
run 100 ps

force -freeze sim:/multiplierpipe/image 00000100 0
run 100 ps

force -freeze sim:/multiplierpipe/image 00000011 0
run 100 ps

force -freeze sim:/multiplierpipe/image 00000010 0
run 100 ps

force -freeze sim:/multiplierpipe/image 00000001 0
run 100 ps

force -freeze sim:/multiplierpipe/image 00000000 0
run 100 ps