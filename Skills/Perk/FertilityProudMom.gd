extends PerkBase

func _init():
	id = Perk.FertilityProudMom
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Proud Mom"

func getVisibleDescription():
	return "AlphaCorp has noticed your efforts and wants to help you become the best mother you can be.\n" \
			+ "You can now visit the nursery to get a free apple once per day.\n" \
			+ "Chance to get into encounters with staff is lowered by 70% while you are pregnant." #base chance is 30% + exposure, this sets it to 10% + exposure 

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityProudMom.png"
	
func getBuffs():
	if(npc.getMenstrualCycle().isVisiblyPregnant()):
		return [
			buff(Buff.EncounterChanceModifierStaffBuff, [-70])
		]
	return []
