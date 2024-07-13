extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func getCategories():
	return ["Event"]

func getType():
	return CrotchBlocks.RETURNCALL

func execute(_contex:CodeContex):
	return false

func getTemplate():
	return [
		{
			type = "label",
			text = "Run event",
		},
	]
