extends "res://Util/SexActivityCreator/Actions/BaseAction.gd"


func _init():
	id = "elsecondition"

func getName():
	return "Else Condition"

func getVisibleText():
	return "ELSE:"

func generateCode():
	return "else:"

func preChangeFlow():
	return -1

func changesFlow():
	return 1
