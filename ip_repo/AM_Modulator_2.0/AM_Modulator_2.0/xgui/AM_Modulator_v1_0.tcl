# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set BYPASS_MODULATION [ipgui::add_param $IPINST -name "BYPASS_MODULATION" -parent ${Page_0}]
  set_property tooltip {when BYPASS_MODULATION=true Tx_1 and Tx_2 will be on the output when slv_reg0(0) = 1 when BYPASS_MODULATION=false the modulated signal of the Tx_1 will be on the output and Tx_2 input will be ignored.} ${BYPASS_MODULATION}

  ipgui::add_param $IPINST -name "S_AXIS_ACLK_FRQ"
  ipgui::add_param $IPINST -name "CARRIER_FRQ"
  ipgui::add_param $IPINST -name "MAX_CARRIER_FRQ"

}

proc update_PARAM_VALUE.BYPASS_MODULATION { PARAM_VALUE.BYPASS_MODULATION } {
	# Procedure called to update BYPASS_MODULATION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BYPASS_MODULATION { PARAM_VALUE.BYPASS_MODULATION } {
	# Procedure called to validate BYPASS_MODULATION
	return true
}

proc update_PARAM_VALUE.CARRIER_FRQ { PARAM_VALUE.CARRIER_FRQ } {
	# Procedure called to update CARRIER_FRQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CARRIER_FRQ { PARAM_VALUE.CARRIER_FRQ } {
	# Procedure called to validate CARRIER_FRQ
	return true
}

proc update_PARAM_VALUE.MAX_CARRIER_FRQ { PARAM_VALUE.MAX_CARRIER_FRQ } {
	# Procedure called to update MAX_CARRIER_FRQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_CARRIER_FRQ { PARAM_VALUE.MAX_CARRIER_FRQ } {
	# Procedure called to validate MAX_CARRIER_FRQ
	return true
}

proc update_PARAM_VALUE.S_AXIS_ACLK_FRQ { PARAM_VALUE.S_AXIS_ACLK_FRQ } {
	# Procedure called to update S_AXIS_ACLK_FRQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S_AXIS_ACLK_FRQ { PARAM_VALUE.S_AXIS_ACLK_FRQ } {
	# Procedure called to validate S_AXIS_ACLK_FRQ
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.S_AXIS_ACLK_FRQ { MODELPARAM_VALUE.S_AXIS_ACLK_FRQ PARAM_VALUE.S_AXIS_ACLK_FRQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S_AXIS_ACLK_FRQ}] ${MODELPARAM_VALUE.S_AXIS_ACLK_FRQ}
}

proc update_MODELPARAM_VALUE.CARRIER_FRQ { MODELPARAM_VALUE.CARRIER_FRQ PARAM_VALUE.CARRIER_FRQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CARRIER_FRQ}] ${MODELPARAM_VALUE.CARRIER_FRQ}
}

proc update_MODELPARAM_VALUE.BYPASS_MODULATION { MODELPARAM_VALUE.BYPASS_MODULATION PARAM_VALUE.BYPASS_MODULATION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BYPASS_MODULATION}] ${MODELPARAM_VALUE.BYPASS_MODULATION}
}

proc update_MODELPARAM_VALUE.MAX_CARRIER_FRQ { MODELPARAM_VALUE.MAX_CARRIER_FRQ PARAM_VALUE.MAX_CARRIER_FRQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_CARRIER_FRQ}] ${MODELPARAM_VALUE.MAX_CARRIER_FRQ}
}

