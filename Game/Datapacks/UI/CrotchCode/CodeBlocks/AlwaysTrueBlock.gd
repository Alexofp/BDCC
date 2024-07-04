extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "TRUE",
		},
	]
