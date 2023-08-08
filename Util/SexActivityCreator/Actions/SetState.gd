extends "res://Util/SexActivityCreator/Actions/BaseAction.gd"

var newState = ""

func _init():
	id = "setState"

func getName():
	return "Set State"

func getVisibleText():
	return generateCode()

func getArgs():
	return {
		"newState": {
			"type": "string",
			"value": newState,
			"text": "New state",
		},
	}

func applyArgs(_data):
	newState = _data["newState"]

func generateCode():
	return "state = \""+newState+"\""

func saveData():
	return {
		newState = newState,
	}

func loadData(_data):
	if(_data.has("newState")):
		newState = _data["newState"]
