extends "res://Util/SexActivityCreator/Actions/BaseAction.gd"

var storedCode = ""

func _init():
	id = "code"

func getName():
	return "Code"

func getVisibleText():
	return storedCode

func getArgs():
	return {
		"code": {
			"type": "bigstring",
			"value": storedCode,
			"text": "GDScript Code",
		},
	}

func applyArgs(_data):
	storedCode = _data["code"]

func generateCode():
	return storedCode
