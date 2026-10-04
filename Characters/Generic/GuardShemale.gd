extends Character

func _init():
	id = "shemaleguard"
	
func _getName():
	return "%s Guard" % NpcGender.getVisibleName(NpcGender.Shemale)

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Generic %s guard" % NpcGender.getVisibleName(NpcGender.Shemale)

func getSpecies():
	return ["canine"]

func createBodyparts():
	var penis:BodypartPenis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 21
	giveBodypartUnlessSame(penis)
