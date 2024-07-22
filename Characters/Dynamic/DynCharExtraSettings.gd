extends Reference
class_name DynCharExtraSettings

# Holds datapack character settings so we don't balloon out the dynamic character class

var excludeEncounters:bool = false
var disableForget:bool = false
var disableBirth:bool = false
var disableMeet:bool = false

func saveData():
	return {
		"excludeEncounters": excludeEncounters,
		"disableForget": disableForget,
		"disableBirth": disableBirth,
		"disableMeet": disableMeet,
	}

func loadData(data):
	excludeEncounters = loadVar(data, "excludeEncounters", false)
	disableForget = loadVar(data, "disableForget", false)
	disableBirth = loadVar(data, "disableBirth", false)
	disableMeet = loadVar(data, "disableMeet", false)

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
