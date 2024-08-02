extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/ToString.gd"

func doThing(val):
	return val == null

func getThingLabel():
	return "isNull"

func getType():
	return CrotchBlocks.LOGIC
