extends PerkBase

func _init():
	id = HK_Perk.LucidTrance
	skillGroup = HK_Skill.HypnosisSkill

func getVisibleName():
	return "Lucid Trance"

func getVisibleDescription():
	return "You've become so accustomed to being hypnotized that a casual observer might not even be able to tell."

func getMoreDescription():
	return "Reduces the penalties of being hypnotized by an additional 30%.\n\nWhile in "+HK_Ico.icon(HK_Ico.Trance)+"Trance, you gain a 10% chance to dodge attacks."
	

func getSkillTier():
	return 2
	
func getCost():
	return 3
	
func getRequiredPerks():
	return [HK_Perk.Detachment]

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/mask.png"
	
func getBuffs():
	if(HK_CharUtil.isInTrance(npc)):
		return [
			buff(Buff.DodgeChanceBuff, [10]),
		]
	else:
		return []
