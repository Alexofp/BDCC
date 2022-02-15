extends Character

func _init():
	id = "rahi"
	
func _getName():
	return "Rahi"

func getGender():
	return Character.Gender.Female
	
func getSmallDescription() -> String:
	return "Wears a general block uniform with number P-12406. She is of medium height, has brown fur and a ponytail. Her naive eyes are blue."

func getSpecies():
	return ["feline"]
