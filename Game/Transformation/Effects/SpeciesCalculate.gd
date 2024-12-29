extends TFEffect

func _init():
	id = "SpeciesCalculate"

func initArgs(_args:Array):
	pass

func applyEffect(_data:Dictionary) -> Dictionary:
	_data["species"] = getChar().calculateSpeciesBasedOnParts()
	return {
		success = true,
	}
