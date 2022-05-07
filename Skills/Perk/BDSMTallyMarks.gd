extends PerkBase

func _init():
	id = Perk.BDSMTallyMarks
	skillGroup = Skill.BDSM

func getVisibleName():
	return "Slut arithmetics"

func getVisibleDescription():
	return "You love when others leave tally marks on your body after they're done using you. Each tally mark gives you +1% [color="+DamageType.getColorString(DamageType.Lust)+"]lust[/color] damage!"

func getCost():
	return 1
func getSkillTier():
	return 0

func getPicture():
	return "res://UI/StatusEffectsPanel/images/tallymarks.png"

