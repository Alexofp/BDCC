extends Character

func _init():
	id = "guardCrowd"
	disableSerialization = true
	
func _getName():
	return "Many guards"

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "A dense crowd of guards"

func getSpecies():
	return ["canine"]
