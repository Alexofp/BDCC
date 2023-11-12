extends PerkBase

func _init():
	id = Perk.BreedCumVolumeV2
	skillGroup = Skill.Breeder

func getVisibleName():
	return "Godlike Endurance"

func getVisibleDescription():
	return "You have worked hard. And now it begins to pay off. You balls now hold 10% more seed for each point in Agility"

func getRequiredPerks():
	return [Perk.BreedCumVolume]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/cumstorage.png"

func getBuffs():
	return [
		buff(Buff.PenisBallsVolumeBuff, [10 * npc.getStat(Stat.Agility)]),
	]
