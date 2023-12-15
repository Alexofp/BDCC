extends PerkBase

func _init():
	id = Perk.HypnosisDeepTranceDrawback
	skillGroup = Skill.Hypnosis

func getVisibleName():
	return "Deep Trance"

func getVisibleDescription():
	return "You now fall into deeper hypnotic trances and do not snap out of them nearly as easily."
	
func getMoreDescription():
	return 	"Suffering pain now reduces your hypnosis level by 25% of the pain taken, instead of 150%."+"\n\n"+ \
			"Additionaly, your hypnosis level can stack up to 125%." +"\n\n"+\
			"Keyword Fixation is now [b]always[/b] in effect."

func getSkillTier():
	return 2

func getCost():
	return 0
	
func unlockable() -> bool:
	return false

func toggleable() -> bool:
	var ch = npc if npc != null else GM.pc
	return !(ch.getSkillsHolder().hasPerk(self.id))

func hiddenWhenLocked() -> bool:
	return true;
	
func getPicture():
	return "res://Modules/HypnokinkModule/Icons/Perks/deep.png"

