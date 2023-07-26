vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../conv_engine.gen/sources_1/ip/fifo_generator_0/fifo_generator_0_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

