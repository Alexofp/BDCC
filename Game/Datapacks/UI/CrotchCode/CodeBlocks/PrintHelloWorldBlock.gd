extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func _init():
	id = "PrintHelloWorldBlock"

func execute():
	print("Hello world!!!")

func getTemplate():
	return [
		{
			type = "label",
			text = "Print(HELLO WORLD)",
		},
	]
