extends PerkBase

func _init():
	id = Perk.BreedCumProductionV3
	skillGroup = Skill.Breeder

func getVisibleName():
	return "Force of Nature"

func getVisibleDescription():
	return "Embrace your role as the ultimate breeder. Your balls now produce seed 50% faster plus an additional 10% for each point in Strength! Your cum production now has no limits!"

func getRequiredPerks():
	return [Perk.BreedCumProductionV2]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/sperm5.png"

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [50 + npc.getStat(Stat.Strength) * 10]),
	]
