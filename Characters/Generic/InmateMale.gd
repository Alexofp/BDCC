extends Character

func _init():
	id = "inmateMale"
	disableSerialization = true
	
func _getName():
	return "Male inmate"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Generic male inmate"

func getSpecies():
	return ["canine"]

