extends Reference
class_name CreatedInteractionState

var id:String = ""

var output:String = ""

var actions:Dictionary = {}

func getEditVars():
	return {
		"id": {
			name = "ID",
			type = "string",
			value = id,
		},
		"output": {
			name = "output",
			type = "bigString",
			value = output,
			minsize = 200,
		},
	}

func applyEditVar(varid, value):
	if(varid == "output"):
		output = value
	
	return false




func saveData():
	var actionData = []
	for actionID in actions:
		var action = actions[actionID]
		actionData.append({
			id = actionID,
			data = action.saveData(),
		})
	
	return {
		"output": output,
		"actions": actionData,
	}

func loadData(data):
	output = loadVar(data, "output", "")
	
	var actionData = loadVar(data, "actions", [])
	actions.clear()
	for actionInfo in actionData:
		var newAc = CreatedInteractionAction.new()
		newAc.id = actionInfo["id"]
		newAc.loadData(actionInfo["data"])
		actions[newAc.id] = newAc
		
		
func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
