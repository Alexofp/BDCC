extends Reference
class_name CreatedInteraction

var id:String = ""

var states: Dictionary = {}

func getEditVars():
	return {
		"id": {
			name = "ID",
			type = "string",
			value = id,
		},
	}

func applyEditVar(varid, value):
	if(varid == "id"):
		id = value
		return true
	
	return false
