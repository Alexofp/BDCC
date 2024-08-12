extends Reference
class_name CreatedInteractionState

var id:String = ""

var name:String = ""

func getEditVars():
	return {
		"name": {
			name = "Name",
			type = "string",
			value = name,
		},
	}

func applyEditVar(varid, value):
	if(varid == "name"):
		name = value
	
	return false
