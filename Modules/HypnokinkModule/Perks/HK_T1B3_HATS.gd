extends PerkBase

func _init():
	id = HK_Perk.HATS
	skillGroup = HK_Skill.HypnosisSkill

func getVisibleName():
	return "H.A.T.S."

func getVisibleDescription():
	return "You have become accustomed to the subliminal messaging of hypnotic visors."

func getMoreDescription():
	return "While in "+HK_Ico.icon(HK_Ico.Trance)+"Trance, the accuracy debuff of hypnosis visors becomes a buff of equivalent value."

func getSkillTier():
	return 0
	
func getCost():
	return 1

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/visor1.png"

