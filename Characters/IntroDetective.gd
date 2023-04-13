extends Character

func _init():
	id = "intro_detective"
	disableSerialization = true
	
func _getName():
	return "Jake"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Elegant-looking canine with gray fur. Black pants, white shirt and old-school reading glasses"

func getSpecies():
	return [Species.Canine]
