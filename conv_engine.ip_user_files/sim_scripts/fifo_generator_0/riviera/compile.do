vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../conv_engine.gen/sources_1/ip/fifo_generator_0/fifo_generator_0_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

