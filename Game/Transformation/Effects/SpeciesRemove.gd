extends TFEffect

var newSpecies:String = ""

func _init():
	id = "SpeciesRemove"

func initArgs(_args:Array):
	if(_args.size() > 0):
		newSpecies = _args[0]

func applyEffect(_data:Dictionary) -> Dictionary:
	if(_data.has("species") && _data["species"].has(newSpecies)):
		_data["species"].erase(newSpecies)
	return {
		success = true,
	}
	