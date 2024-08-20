extends Reference
class_name CreatedInteractionInterruption

var id:String = ""

var name:String = ""
var desc:String = ""
#var disabledDesc:String = ""
var score:String = "1.0"
var scoreType:String = "default"
var scoreRole:String = "inmate"
var args:String = ""
var states:Array = []
var cond:String = ""
var code:String = "setState(\"meow\", \"inmate\")"

func getEditVars(allStates:Array):
	var allStatesFancy:Array = []
	for stateID in allStates:
		if(stateID == ""):
			allStatesFancy.append([stateID, "--init--"])
		else:
			allStatesFancy.append([stateID, stateID])
	
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
#		"disabledDesc": {
#			name = "Disabled desc",
#			type = "bigString",
#			value = disabledDesc,
#		},
		"scoreType": {
			name = "Score type",
			type = "selector",
			value = scoreType,
			values = CreatedInteractionAction.allScoreTypes,
		},
		"scoreRole": {
			name = "Score type role check",
			type = "string",
			value = scoreRole,
		},
		"score": {
			name = "Score",
			type = "string",
			value = score,
		},
		"args": {
			name = "Args",
			type = "string",
			value = args,
		},
		"states": {
			name = "States",
			type = "addRemoveList",
			value = states,
			values = allStatesFancy,
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
	if(varid == "cond"):
		cond = value
	if(varid == "code"):
		code = value
	if(varid == "scoreType"):
		scoreType = value
	if(varid == "states"):
		states = value
	if(varid == "scoreRole"):
		scoreRole = value
	
	return false


func saveData():
	return {
		"name": name,
		"desc": desc,
		"score": score,
		"scoreType": scoreType,
		"scoreRole": scoreRole,
		"args": args,
		"cond": cond,
		"code": code,
		"states": states,
	}

func loadData(data):
	name = loadVar(data, "name", "No name")
	desc = loadVar(data, "desc", "No desc")
	score = loadVar(data, "score", "1.0")
	scoreType = loadVar(data, "scoreType", "default")
	scoreRole = loadVar(data, "scoreRole", "inmate")
	args = loadVar(data, "args", "")
	cond = loadVar(data, "cond", "")
	code = loadVar(data, "code", "")
	states = loadVar(data, "states", [])
		
		
func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
