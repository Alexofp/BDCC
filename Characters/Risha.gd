extends Character

func _init():
	id = "risha"
	
func _getName():
	return "Risha"

func getGender():
	return Character.Gender.Androgynous
	
func getSmallDescription() -> String:
	return "A very tall lynx with cyan fur"

func getSpecies():
	return ["feline"]

func _getAttacks():
	return ["simplepunchattack", "scratchattack", "biteattack", "simplekickattack", "shoveattack", "simplelustattack", "trygetupattack"]
