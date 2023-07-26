extends "res://Util/SexActivityCreator/Conditions/BaseCondition.gd"

var storedCode = ""

func _init():
	id = "codeline"

func getName():
	return "Code line"

func getVisibleText():
	return storedCode

func getArgs():
	return {
		"code": {
			"type": "string",
			"value": storedCode,
			"text": "Code",
		},
	}

func applyArgs(_data):
	storedCode = _data["code"]

func generateCode():
	return storedCode

