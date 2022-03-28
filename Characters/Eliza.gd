extends Character

func _init():
	id = "eliza"
	
func _getName():
	return "Eliza Quinn"

func getGender():
	return Character.Gender.Female
	
func getSmallDescription() -> String:
	return "An elegant feline with pastel yellow fur. Wears a lab coat and carries quite a few medical tools on her belt"

func getSpecies():
	return ["feline"]

