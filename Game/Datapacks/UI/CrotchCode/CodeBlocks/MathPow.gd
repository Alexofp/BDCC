extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/MathPlus.gd"

func thingSupportsStrings():
	return false

func doThing(a, b):
	return pow(a, b)

func getThingLabel():
	return "^"
