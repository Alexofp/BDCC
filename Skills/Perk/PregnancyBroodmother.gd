extends PerkBase

#var isVisible: bool = true

func _init():
	id = Perk.PregnancyBroodmother
	skillGroup = Skill.Pregnancy

func getVisibleName():
	return "Broodmother"

func getVisibleDescription():
	return "You can't imagine your life without your womb being constantly full of sperm or new fetus growing inside. \n"  \
			+ "Maximum belly size increased moderately during pregnancy. \n" \
			+ "Pregnancy debuff penalty is reduced by half. \n" \
			+ "Increased cross species compatibility by 20% \n" \
			+ "Fertility reduction medication has significantly less effect on you." #by 70%
	
func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/Skill_Icon_PregnancyBroodmother.png"
	
#func isVisualToggleable():
#	return true
#
#func setVisibilty(val: bool) -> void:
#	isVisible = val
#
#func getVisibilty() -> bool:
#	return isVisible

#func getBuffs():
#	return [
#		buff(Buff.CrossSpeciesCompatibilityBuff, [20])
#	]
