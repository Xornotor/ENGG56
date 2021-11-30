## Generated SDC file "Acumulador.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

## DATE    "Mon Nov 29 22:52:26 2021"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 10.000 -waveform { 0.000 5.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {clear}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {clk}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[8]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[9]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[10]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[11]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[12]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[13]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[14]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {in[15]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {load}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {transf}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[12]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[13]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[14]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {out[15]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

