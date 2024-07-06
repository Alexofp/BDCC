extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/MathPlusBlock.gd"

func doThing(a, b):
	return fmod(a, b)

func getThingLabel():
	return "fmod"
