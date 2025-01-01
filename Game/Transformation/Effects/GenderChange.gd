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
	
