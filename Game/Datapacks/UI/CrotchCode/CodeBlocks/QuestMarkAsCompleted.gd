extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func getCategories():
	return ["Quest"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	_contex.markQuestAsCompleted()
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "Mark Quest as Completed",
		},
	]
