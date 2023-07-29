extends "res://Util/SexActivityCreator/Actions/BaseAction.gd"

var storedTexts = []

func _init():
	id = "addTextRandom"

func getName():
	return "Add Text Random"

func getVisibleText():
	return "Pick random text: " + Util.join(storedTexts, " | ")

func getArgs():
	return {
		"storedTexts": {
			"type": "strings",
			"value": storedTexts,
			"text": "Texts",
		},
	}

func applyArgs(_data):
	storedTexts = _data["storedTexts"]

func generateCode():
	if(storedTexts.size() == 0):
		return ""
	if(storedTexts.size() == 1):
		return "text += \""+storedTexts[0]+"\""
	var text = "text += RNG.pick([\n\t"+Util.joinWithBorders(processStringArray(storedTexts), ",\n\t", "\"")+"\n])"
	return text

func saveData():
	return {
		storedTexts = storedTexts,
	}

func loadData(_data):
	if(_data.has("storedTexts")):
		storedTexts = _data["storedTexts"]
