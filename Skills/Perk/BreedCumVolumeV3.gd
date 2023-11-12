extends PerkBase

func _init():
	id = Perk.BreedCumVolumeV3
	skillGroup = Skill.Breeder

func getVisibleName():
	return "Champion of Breeding"

func getVisibleDescription():
	return "Your balls hold so much of quality seed, it's scary. Your balls capacity and virility are increased by 25% and 10% respectively per each point in Vitality."

func getRequiredPerks():
	return [Perk.BreedCumVolumeV2]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/cumtanker.png"

func getBuffs():
	return [
		buff(Buff.PenisBallsVolumeBuff, [25 * npc.getStat(Stat.Vitality)]),
		buff(Buff.VirilityBuff, [10 * npc.getStat(Stat.Vitality)]),
	]
