extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/MathPlusBlock.gd"

func doThing(a, b):
	if(b == 0):
		return INF
	return a / b

func getThingLabel():
	return "/"
