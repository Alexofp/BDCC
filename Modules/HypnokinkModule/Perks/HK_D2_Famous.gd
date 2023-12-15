extends PerkBase

func _init():
	id = Perk.HypnosisFamousDrawback
	skillGroup = Skill.Hypnosis

func getVisibleName():
	return "Famously Suggestible"

func getVisibleDescription():
	return "Word is getting around about your hypnotic experiences."

func getMoreDescription():
	return 	"You can now encounter inmates that know your mind is vulnerable to suggestion (the chance inceases the more you are hypnotized)."+"\n\n"+\
			"Keyword Fixation is now in effect whenever you are "+HypnokinkUtil.hypnosisIcon()+"Hypnotised."

func getSkillTier():
	return 1

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
	return "res://Modules/HypnokinkModule/Icons/Perks/obey.png"

