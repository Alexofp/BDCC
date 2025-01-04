extends TFEffect

var newGender:int = Gender.Male

func _init():
	id = "GenderChange"

func initArgs(_args:Array):
	if(_args.size() > 0):
		newGender = _args[0]

func applyEffect(_data:Dictionary) -> Dictionary:
	_data["gender"] = newGender
	_data["pronounsGender"] = null
	
	return {
		success = true,
	}
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["gender"] = newGender
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	newGender = SAVE.loadVar(_data, "gender", Gender.Male)
