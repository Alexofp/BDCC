extends PerkBase

func _init():
	id = Perk.BreedStudV2
	skillGroup = Skill.Breeder

func getVisibleName():
	return "Cum stud"

func getVisibleDescription():
	return "What a stud, your balls are always so heavy! They swiftly fill up by additional 20% after your every orgasm"

func getRequiredPerks():
	return [Perk.BreedStud]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/horse-head.png"

func getBuffs():
	return [
		buff(Buff.PenisCumGenerationAfterOrgasmBuff, [20]),
	]
