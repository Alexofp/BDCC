extends Character

func _init():
	id = "inmateShemale"
	disableSerialization = true
	
func _getName():
	return "%s inmate" % NpcGender.getVisibleName(NpcGender.Shemale)

func getGender():
	return Gender.Androgynous
	
func getSmallDescription() -> String:
	return "Generic %s inmate" % NpcGender.getVisibleName(NpcGender.Shemale)

func getSpecies():
	return ["canine"]

