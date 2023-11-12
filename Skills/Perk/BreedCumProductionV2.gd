extends PerkBase

func _init():
	id = Perk.BreedCumProductionV2
	skillGroup = Skill.Breeder

func getVisibleName():
	return "Seed Factory"

func getVisibleDescription():
	return "You just can't breed them enough. Your balls are now generating cum 75% faster."

func getRequiredPerks():
	return [Perk.BreedCumProduction]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/sperm3.png"

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [75]),
	]
