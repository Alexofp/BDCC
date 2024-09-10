extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/MathPlus.gd"

func doThing(a, b):
	return fmod(a, b)

func getThingLabel():
	return "fmod"
