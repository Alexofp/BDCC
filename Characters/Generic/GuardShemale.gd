extends Character

func _init():
	id = "shemaleguard"
	
func _getName():
	return "Shemale Guard"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Generic shemale guard"

func getSpecies():
	return ["canine"]

func createBodyparts():
	var penis:BodypartPenis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 21
	giveBodypartUnlessSame(penis)
