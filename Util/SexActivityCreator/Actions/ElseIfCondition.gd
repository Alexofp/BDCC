extends "res://Util/SexActivityCreator/Actions/BaseAction.gd"

var storedCode = ""

func _init():
	id = "elifcondition"

func getName():
	return "Else If Condition"

func getVisibleText():
	return "ELSE IF( " +storedCode+" ):"

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
	return "elif("+storedCode+"):"

func preChangeFlow():
	return -1

func changesFlow():
	return 1

func saveData():
	return {
		storedCode = storedCode,
	}

func loadData(_data):
	if(_data.has("storedCode")):
		storedCode = _data["storedCode"]
