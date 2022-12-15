extends "res://Inventory/RestraintTypes/RestraintMuzzle.gd"
class_name RestraintRingGag

func _init():
	restraintType = RestraintType.Gag

func getResistAnimation():
	return "struggle_gag"
