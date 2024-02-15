extends "res://Inventory/RestraintTypes/RestraintMuzzle.gd"
class_name RestraintRingGag

func _init():
	restraintType = RestraintType.Gag

func canBeCut():
	return tightness < 0.9

func calcCutDamage(_pc, mult = 1.0):
	return .calcCutDamage(_pc, mult) / 1.2

func getResistAnimation():
	return "struggle_gag"
