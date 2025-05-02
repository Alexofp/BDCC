extends TFEffect

var newSpecies:Array = []

func _init():
	id = "SpeciesReplace"

func initArgs(_args:Array):
	if(_args.size() > 0):
		newSpecies = _args[0]

func applyEffect(_data:Dictionary) -> Dictionary:
	_data["species"] = newSpecies
	return {
		success = true,
	}
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["species"] = newSpecies
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	newSpecies = SAVE.loadVar(_data, "species", [])
