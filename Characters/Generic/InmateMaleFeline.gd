extends Character

func _init():
	id = "inmateMaleFeline"
	
func _getName():
	return "Male inmate"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Generic male inmate"

func getSpecies():
	return ["feline"]

func getPenisSize():
	return 18.0
