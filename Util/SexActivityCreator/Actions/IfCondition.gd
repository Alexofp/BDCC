extends "res://Util/SexActivityCreator/Actions/BaseAction.gd"

var storedCode = ""

func _init():
	id = "ifcondition"

func getName():
	return "If Condition"

func getVisibleText():
	return "IF( " +storedCode+" ):"

func getArgs():
	return {
		"code": {
			"type": "bigstring",
			"value": storedCode,
			"text": "Condition",
		},
	}

func applyArgs(_data):
	storedCode = _data["code"]

func generateCode():
	return "if("+storedCode+"):"

func changesFlow():
	return 1

func saveData():
	return {
		storedCode = storedCode,
	}

func loadData(_data):
	if(_data.has("storedCode")):
		storedCode = _data["storedCode"]
