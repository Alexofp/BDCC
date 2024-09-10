extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/ToString.gd"

func doThing(val):
	return (val is bool)

func getThingLabel():
	return "isBool"

func getType():
	return CrotchBlocks.LOGIC
