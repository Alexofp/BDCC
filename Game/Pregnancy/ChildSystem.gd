extends Node
class_name ChildSystem

var children: Array = []

func _ready():
	GM.CS = self
	name = "ChildSystem"

func addChild(child):
	children.append(child)
	
func getChildren():
	return children

func saveData():
	var data = {}

	var childData = []
	for child in children:
		childData.append(child.saveData())

	data["children"] = childData

	return data

func loadData(data):
	var childData = SAVE.loadVar(data, "children", [])
	
	for child in childData:
		var childObject = Child.new()
		childObject.loadData(child)
		children.append(childObject)
