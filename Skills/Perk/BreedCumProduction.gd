extends PerkBase

func _init():
	id = Perk.BreedCumProduction
	skillGroup = Skill.Breeder

func getVisibleName():
	return "Prolific Seeder"

func getVisibleDescription():
	return "Your balls begin to adapt to your breeder lifestyle and are now filling up 25% faster"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/sperm1.png"

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [25]),
	]
