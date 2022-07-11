extends Character

func _init():
	id = "inmateCrowd"
	
func _getName():
	return "Many inmates"

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "A dense crowd of inmates"

func getSpecies():
	return ["canine"]

