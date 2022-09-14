extends Character

func _init():
	id = "inmateMaleCanine"
	
func _getName():
	return "Male inmate"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Generic male inmate"

func getSpecies():
	return ["canine"]

func getPenisSize():
	return 20.0
