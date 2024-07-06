extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func getCategories():
	return ["Logic"]

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	return false

func getTemplate():
	return [
		{
			type = "label",
			text = "FALSE",
		},
	]
