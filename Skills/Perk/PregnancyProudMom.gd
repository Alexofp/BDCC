extends PerkBase

func _init():
	id = Perk.PregnancyProudMom
	skillGroup = Skill.Pregnancy

func getVisibleName():
	return "Proud mom"

func getVisibleDescription():
	return "You are looked from the better side by the prison staff. \n" \
			+ "Get a free apple from the Nurse once per day. \n" \
			+ "While pregnant gain some lust protection and have a lesser chance of the prison personnel to confront you." #base chance is 30% + exposure, this sets it to 10% + exposure 

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/Skill_Icon_PregnancyProudMom.png"
	
#func runOnceWhenLearned():
#	GM.main.setModuleFlag("MedicalModule", "Nursery_hadFreeAppleFromPerkToday", false)

#func getBuffs():
#	if(npc.menstrualCycle.isVisiblyPregnant()):
#		return [
#			buff(Buff.LustArmorBuff, [20])
#		]
#	return []
