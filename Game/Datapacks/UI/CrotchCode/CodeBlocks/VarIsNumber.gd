extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/ToString.gd"

func doThing(val):
	return (val is int) || (val is float)

func getThingLabel():
	return "isNumber"

func getType():
	return CrotchBlocks.LOGIC
