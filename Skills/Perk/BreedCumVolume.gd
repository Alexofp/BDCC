extends PerkBase

func _init():
	id = Perk.BreedCumVolume
	skillGroup = Skill.Breeder

func getVisibleName():
	return "Cum Tank"

func getVisibleDescription():
	return "You feel your balls becoming heavier after so much cumming. They now hold 50% more seed!"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/cumtruck.png"

func getBuffs():
	return [
		buff(Buff.PenisBallsVolumeBuff, [50]),
	]
