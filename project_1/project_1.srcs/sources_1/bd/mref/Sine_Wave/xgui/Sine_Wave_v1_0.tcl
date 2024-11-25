# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "IP_INPUT_FREQUENCY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAX_OUTPUT_SIGNAL_FRQ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OUTPUT_SIGNAL_FREQUENCY" -parent ${Page_0}


}

proc update_PARAM_VALUE.IP_INPUT_FREQUENCY { PARAM_VALUE.IP_INPUT_FREQUENCY } {
	# Procedure called to update IP_INPUT_FREQUENCY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IP_INPUT_FREQUENCY { PARAM_VALUE.IP_INPUT_FREQUENCY } {
	# Procedure called to validate IP_INPUT_FREQUENCY
	return true
}

proc update_PARAM_VALUE.MAX_OUTPUT_SIGNAL_FRQ { PARAM_VALUE.MAX_OUTPUT_SIGNAL_FRQ } {
	# Procedure called to update MAX_OUTPUT_SIGNAL_FRQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_OUTPUT_SIGNAL_FRQ { PARAM_VALUE.MAX_OUTPUT_SIGNAL_FRQ } {
	# Procedure called to validate MAX_OUTPUT_SIGNAL_FRQ
	return true
}

proc update_PARAM_VALUE.OUTPUT_SIGNAL_FREQUENCY { PARAM_VALUE.OUTPUT_SIGNAL_FREQUENCY } {
	# Procedure called to update OUTPUT_SIGNAL_FREQUENCY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUTPUT_SIGNAL_FREQUENCY { PARAM_VALUE.OUTPUT_SIGNAL_FREQUENCY } {
	# Procedure called to validate OUTPUT_SIGNAL_FREQUENCY
	return true
}


proc update_MODELPARAM_VALUE.IP_INPUT_FREQUENCY { MODELPARAM_VALUE.IP_INPUT_FREQUENCY PARAM_VALUE.IP_INPUT_FREQUENCY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IP_INPUT_FREQUENCY}] ${MODELPARAM_VALUE.IP_INPUT_FREQUENCY}
}

proc update_MODELPARAM_VALUE.OUTPUT_SIGNAL_FREQUENCY { MODELPARAM_VALUE.OUTPUT_SIGNAL_FREQUENCY PARAM_VALUE.OUTPUT_SIGNAL_FREQUENCY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUTPUT_SIGNAL_FREQUENCY}] ${MODELPARAM_VALUE.OUTPUT_SIGNAL_FREQUENCY}
}

proc update_MODELPARAM_VALUE.MAX_OUTPUT_SIGNAL_FRQ { MODELPARAM_VALUE.MAX_OUTPUT_SIGNAL_FRQ PARAM_VALUE.MAX_OUTPUT_SIGNAL_FRQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_OUTPUT_SIGNAL_FRQ}] ${MODELPARAM_VALUE.MAX_OUTPUT_SIGNAL_FRQ}
}

