extends PerkBase

func _init():
	id = Perk.FertilityProudMom
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Proud mom"

func getVisibleDescription():
	return "You are looked from the better side by the prison staff. \n" \
			+ "Get a free apple from the Nurse once per day. \n" \
			+ "While pregnant you are less likely to be confronted by the prison personnel." #base chance is 30% + exposure, this sets it to 10% + exposure 

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityProudMom.png"
	
func runOnceWhenLearned():
	GM.main.setModuleFlag("MedicalModule", "Nursery_hadFreeAppleFromPerkToday", false)
