extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func _init():
	id = "AlwaysTrueBlock"

func execute():
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "TRUEEEE",
		},
	]
