extends PerkBase

func _init():
	id = HK_Perk.KeywordsDrawback
	skillGroup = HK_Skill.HypnosisSkill

func getVisibleName():
	return "Keyword Fixation"

func getVisibleDescription():
	return "You find your thoughts lingering on certain words as they are spoken."
	
func getMoreDescription():
	return "While in "+HK_Ico.icon(HK_Ico.Trance)+"Trance, hearing one of the keywords slightly deepens your hypnosis and increases your [color="+DamageType.getColorString(DamageType.Lust)+"]lust[/color] and arousal by a small amount."

func getSkillTier():
	return 0

func getCost():
	return 0
	
func unlockable() -> bool:
	return false

func toggleable() -> bool:
	return false

func hiddenWhenLocked() -> bool:
	return true;

func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/speech.png"

