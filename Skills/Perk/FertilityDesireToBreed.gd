extends PerkBase

func _init():
	id = Perk.FertilityDesireToBreed
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Desire to breed"

func getVisibleDescription():
	return "Your desire to be bred is so high that new life finds its way inside you with ease. \n" \
			+ "While not pregnant you deal +30% lust damage and become more susceptible to the lust yourself. \n" \
			+ "Significantly increases the chances of condoms breaking inside you." #450% to break results in 90% for normal and 4.5% for quality condoms 

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityDesireToBreed.png"

func getBuffs():
	if(!npc.menstrualCycle.isVisiblyPregnant()):
		return [
			buff(Buff.LustDamageBuff, [30]),
			buff(Buff.ReceivedLustDamageBuff, [20]),
		]
	return []
