extends PerkBase

func _init():
	id = "NewSkillPerk"
	skillGroup = "TestSkill"

func getVisibleName():
	return "New test skill perk"

func getVisibleDescription():
	return "New test skill perk"

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityBetterOvulation.png"
