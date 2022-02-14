extends Character

func _init():
	id = "rahi"
	
func _getName():
	return "Rahi"

func getGender():
	return Character.Gender.Female
	
func getSmallDescription() -> String:
	return "General block inmate. A cute cat with brown fur and a ponytail"

func getSpecies():
	return ["feline"]
