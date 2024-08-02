extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func getCategories():
	return ["Scene"]

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	return _contex.getState()

func getTemplate():
	return [
		{
			type = "label",
			text = "Get state",
		},
	]
