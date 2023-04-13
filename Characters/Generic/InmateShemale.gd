extends Character

func _init():
	id = "inmateShemale"
	disableSerialization = true
	
func _getName():
	return "Shemale inmate"

func getGender():
	return Gender.Androgynous
	
func getSmallDescription() -> String:
	return "Generic shemale inmate"

func getSpecies():
	return ["canine"]

