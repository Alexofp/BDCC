extends PerkBase

func _init():
	id = Perk.BreedStud
	skillGroup = Skill.Breeder
	dungeonWeight = 0.0

func getVisibleName():
	return "Stallion"

func getVisibleDescription():
	return "You're a real stallion, your balls rapidly fill up by 10% after your orgasm to make sure that you are never empty"

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/horse.png"

func getBuffs():
	return [
		buff(Buff.PenisCumGenerationAfterOrgasmBuff, [10]),
	]
