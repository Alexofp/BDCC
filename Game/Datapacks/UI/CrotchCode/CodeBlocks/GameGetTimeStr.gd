extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func getCategories():
	return ["Game"]

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	if(GM.main != null && is_instance_valid(GM.main)):
		return Util.getTimeStringHHMM(GM.main.getTime())
	return "06:00"

func getTemplate():
	return [
		{
			type = "label",
			text = "Get time formatted",
		},
	]
