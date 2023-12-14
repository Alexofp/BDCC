extends PerkBase

func _init():
	id = Perk.HATS
	skillGroup = Skill.Hypnosis

func getVisibleName():
	return "H.A.T.S."

func getVisibleDescription():
	return "You have become accustomed to the subliminal messaging of hypnotic visors."

func getMoreDescription():
	return "While in "+HK_Utils.tranceIcon()+"Trance, the accuracy debuff of hypnosis visors becomes a buff of equivalent value."

func getSkillTier():
	return 0
	
func getCost():
	return 1

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/visor1.png"

