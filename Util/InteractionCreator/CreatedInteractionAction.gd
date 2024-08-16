extends Reference
class_name CreatedInteractionAction

var id:String = ""

var name:String = ""
var desc:String = ""
var score:String = "1.0"
var scoreType:String = "default"
var args:String = ""
var time:String = "60"
var start_sex:String = ""
var start_fight:String = ""
var cond:String = ""
var code:String = "setState(\"meow\", \"inmate\")"

func getEditVars():
	return {
		"name": {
			name = "Name",
			type = "string",
			value = name,
		},
		"desc": {
			name = "Desc",
			type = "bigString",
			value = desc,
		},
		"scoreType": {
			name = "Score type",
			type = "selector",
			value = scoreType,
			values = [
				"default",
				"fight",
				"surrender",
				"punish",
				"punishMean",
				"sexDom",
				"sexSub",
				"slut",
				"hatefuck",
				"resist",
			],
		},
		"score": {
			name = "Score [def,like,hate,lust]",
			type = "string",
			value = score,
		},
		"args": {
			name = "Args",
			type = "string",
			value = args,
		},
		"time": {
			name = "Time",
			type = "string",
			value = time,
		},
		"start_sex": {
			name = "start_sex",
			type = "string",
			value = start_sex,
		},
		"start_fight": {
			name = "start_fight",
			type = "string",
			value = start_fight,
		},
		"cond": {
			name = "Condition",
			type = "string",
			value = cond,
		},
		"code": {
			name = "Code",
			type = "bigString",
			value = code,
			minsize = 300,
		},
	}

func applyEditVar(varid, value):
	if(varid == "name"):
		name = value
	if(varid == "desc"):
		desc = value
	if(varid == "score"):
		score = value
	if(varid == "args"):
		args = value
	if(varid == "time"):
		time = value
	if(varid == "start_sex"):
		start_sex = value
	if(varid == "start_fight"):
		start_fight = value
	if(varid == "cond"):
		cond = value
	if(varid == "code"):
		code = value
	if(varid == "scoreType"):
		scoreType = value
	
	return false


func saveData():
	return {
		"name": name,
		"desc": desc,
		"score": score,
		"scoreType": scoreType,
		"args": args,
		"time": time,
		"start_sex": start_sex,
		"start_fight": start_fight,
		"cond": cond,
		"code": code,
	}

func loadData(data):
	name = loadVar(data, "name", "No name")
	desc = loadVar(data, "desc", "No desc")
	score = loadVar(data, "score", "1.0")
	scoreType = loadVar(data, "scoreType", "default")
	args = loadVar(data, "args", "")
	time = loadVar(data, "time", "")
	start_sex = loadVar(data, "start_sex", "")
	start_fight = loadVar(data, "start_fight", "")
	cond = loadVar(data, "cond", "")
	code = loadVar(data, "code", "")
		
		
func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
