extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func getCategories():
	return ["Event"]

func getType():
	return CrotchBlocks.RETURNCALL

func execute(_contex:CodeContex):
	if(!makeSureReactMode(_contex)):
		return
	_contex.doRunEvent()
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "Run event",
		},
	]
