extends Character

func _init():
	id = "angel"
	
func _getName():
	return "Nova"

func getGender():
	return Character.Gender.Androgynous
	
func getSmallDescription() -> String:
	return "Gray husky that wears hi-tech guard armor. Medium height, fit body"

func getSpecies():
	return ["canine"]
