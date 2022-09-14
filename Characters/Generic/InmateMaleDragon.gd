extends Character

func _init():
	id = "inmateMaleDragon"
	
func _getName():
	return "Male inmate"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Generic male inmate"

func getSpecies():
	return ["dragon"]

func getPenisSize():
	return 22.0
