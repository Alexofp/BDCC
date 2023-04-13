extends Character

func _init():
	id = "inmateCrowd"
	disableSerialization = true
	
func _getName():
	return "Many inmates"

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "A dense crowd of inmates"

func getSpecies():
	return ["canine"]

