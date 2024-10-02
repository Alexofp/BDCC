extends Character

func _init():
	id = "bidder3"
	disableSerialization = true
	
func _getName():
	return "Bidder 3"

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "A shadow figure"

func getSpecies():
	return ["unknown"]

