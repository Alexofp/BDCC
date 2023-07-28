extends "res://Util/SexActivityCreator/Actions/BaseAction.gd"

var fetishes = {}
var addScore = "+0.0"
var lustMod = "0.1"
var resistanceMod = "0.0"
var fearMod = "0.0"

func _init():
	id = "AffectSub"

func getName():
	return "Affect Sub"

func getVisibleText():
	return generateCode()

func getArgs():
	return {
		"fetishes": {
			"type": "fetishesWithNumbers",
			"value": fetishes,
			"text": "Fetishes",
		},
		"addScore": {
			"type": "string",
			"value": addScore,
			"text": "extra score",
		},
		"lustMod": {
			"type": "string",
			"value": lustMod,
			"text": "lust",
		},
		"resistanceMod": {
			"type": "string",
			"value": resistanceMod,
			"text": "resistance",
		},
		"fearMod": {
			"type": "string",
			"value": fearMod,
			"text": "fear",
		},
	}

func applyArgs(_data):
	fetishes = _data["fetishes"]
	addScore = _data["addScore"]
	lustMod = _data["lustMod"]
	resistanceMod = _data["resistanceMod"]
	fearMod = _data["fearMod"]

func generateCode():
	var genFetish = []
	for fetishID in fetishes:
		genFetish.append(fetishID+": "+str(fetishes[fetishID]))
	
	var text = "affectSub(subInfo.fetishScore({"+Util.join(genFetish, ", ")+"})"+addScore+", "+lustMod+", "+resistanceMod+", "+fearMod+")"
	# affectSub(subInfo.fetishScore({fetishReceiving: 1.0})+0.5, 0.1, -0.1, -0.01)
	return text

func saveData():
	return {
		fetishes = fetishes,
		addScore = addScore,
		lustMod = lustMod,
		resistanceMod = resistanceMod,
		fearMod = fearMod,
	}

func loadData(_data):
	if(_data.has("fetishes")):
		fetishes = _data["fetishes"]
	if(_data.has("addScore")):
		addScore = _data["addScore"]
	if(_data.has("lustMod")):
		lustMod = _data["lustMod"]
	if(_data.has("resistanceMod")):
		resistanceMod = _data["resistanceMod"]
	if(_data.has("fearMod")):
		fearMod = _data["fearMod"]
