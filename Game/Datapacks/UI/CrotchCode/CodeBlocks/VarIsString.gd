extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/ToString.gd"

func doThing(val):
	return (val is String)

func getThingLabel():
	return "isString"

func getType():
	return CrotchBlocks.LOGIC
