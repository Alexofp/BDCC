extends PerkBase

func _init():
	id = HK_Perk.FamousDrawback
	skillGroup = HK_Skill.HypnosisSkill

func getVisibleName():
	return "Famously Suggestible"

func getVisibleDescription():
	return "Word is getting around about your hypnotic experiences."

func getMoreDescription():
	return 	"You can now encounter inmates that know your mind is vulnerable to suggestion (the chance inceases the more you are hypnotized)."+"\n\n"+\
			"Keyword Fixation is now in effect whenever you are "+HK_Ico.hypnosisIcon()+"Hypnotised."

func getSkillTier():
	return 1

func getCost():
	return 0
	
func unlockable() -> bool:
	return false

func toggleable() -> bool:
	return false

func hiddenWhenLocked() -> bool:
	return true;
	
func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/obey.png"

