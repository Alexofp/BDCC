extends TFEffect

func _init():
	id = "SpeciesCalculate"

func initArgs(_args:Array):
	pass

func applyEffect(_data:Dictionary) -> Dictionary:
	_data["species"] = getChar().calculateSpeciesBasedOnParts()
	call_deferred("doCalc", getChar(), _data) # Huge hack, I'm sorry
	return {
		success = true,
	}

func doCalc(_char, _data):
	if(_char == null || !is_instance_valid(_char)):
		return
	if(!_char.has_method("setSpecies")):
		return
	_data["species"] = _char.calculateSpeciesBasedOnParts()
	_char.setSpecies(_data["species"])
