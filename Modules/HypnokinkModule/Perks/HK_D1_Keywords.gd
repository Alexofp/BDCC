extends PerkBase

func _init():
	id = Perk.HypnosisKeywordsDrawback
	skillGroup = Skill.Hypnosis

func getVisibleName():
	return "Keyword Fixation"

func getVisibleDescription():
	return "You find your thoughts lingering on certain words as they are spoken."
	
func getMoreDescription():
	return "While in "+HypnokinkUtil.tranceIcon()+"Trance, hearing one of the keywords slightly deepens your hypnosis and increases your [color="+DamageType.getColorString(DamageType.Lust)+"]lust[/color] and arousal by a small amount."

func getSkillTier():
	return 0

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
	return "res://Modules/HypnokinkModule/Icons/Perks/speech.png"

