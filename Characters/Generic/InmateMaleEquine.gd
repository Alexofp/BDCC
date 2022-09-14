extends Character

func _init():
	id = "inmateMaleEquine"
	
func _getName():
	return "Male inmate"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Generic male inmate"

func getSpecies():
	return ["equine"]

func getPenisSize():
	return 30.0
