extends "res://Util/SexActivityCreator/Actions/BaseAction.gd"


func _init():
	id = "endcondition"

func getName():
	return "End Condition"

func getVisibleText():
	return "END_CONDITION"

func generateCode():
	return ""

func changesFlow():
	return -1
