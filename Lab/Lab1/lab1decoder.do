vlog -reportprogress 300 -work work alu.v
vsim -voptargs="+acc" testDecoder
add wave -position insertpoint  \
sim:/testMultiplexer/addr[0] \
sim:/testMultiplexer/addr[1] \
sim:/testMultiplexer/addr[2] \
sim:/testMultiplexer/out[0] \
sim:/testMultiplexer/out[1] \
sim:/testMultiplexer/out[2] \
sim:/testMultiplexer/out[3] \
sim:/testMultiplexer/out[4]
run -all
wave zoom full