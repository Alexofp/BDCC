extends Reference
class_name CrotchBlock

var id = "base"
var blockType = "call" #call, cond, var
var template = [
	["label", "Do meow?"],
	["slot", "howmany", "var", "Meow"],
	["slot", "howmany2", "var", "Mewww"],
	["label", "YEAH???"],
]
var data = {
	# Could reference other blocks?
}

func initWithDefaultData():
	for templateLine in template:
		if(templateLine[0] == "slot"):
			data[templateLine[1]] = templateLine[3]

func getVisualScenePath():
	return "res://Game/Datapacks/UI/CrotchCode/CrotchBlockVisual.tscn"

func createVisualScene():
	return load(getVisualScenePath()).instance()
