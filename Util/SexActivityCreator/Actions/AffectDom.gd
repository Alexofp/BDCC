extends "res://Util/SexActivityCreator/Actions/BaseAction.gd"

var fetishes = {}
var addScore = "+0.0"
var lustMod = "0.1"
var angerMod = "0.0"

func _init():
	id = "AffectDom"

func getName():
	return "Affect Dom"

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
		"angerMod": {
			"type": "string",
			"value": angerMod,
			"text": "anger",
		},
	}

func applyArgs(_data):
	fetishes = _data["fetishes"]
	addScore = _data["addScore"]
	lustMod = _data["lustMod"]
	angerMod = _data["angerMod"]

func generateCode():
	var genFetish = []
	for fetishID in fetishes:
		genFetish.append(fetishID+": "+str(fetishes[fetishID]))
	
	var text = "affectDom(domInfo.fetishScore({"+Util.join(genFetish, ", ")+"})"+addScore+", "+lustMod+", "+angerMod+")"
	# affectDom(domInfo.fetishScore({fetishGiving: 1.0})+0.3, 0.1*domSensitivity(), 0.0)
	return text

func saveData():
	return {
		fetishes = fetishes,
		addScore = addScore,
		lustMod = lustMod,
		angerMod = angerMod,
	}

func loadData(_data):
	if(_data.has("fetishes")):
		fetishes = _data["fetishes"]
	if(_data.has("addScore")):
		addScore = _data["addScore"]
	if(_data.has("lustMod")):
		lustMod = _data["lustMod"]
	if(_data.has("angerMod")):
		angerMod = _data["angerMod"]
