extends PerkBase

func _init():
	id = Perk.BDSMRigger
	skillGroup = Skill.BDSM

func getVisibleName():
	return "Rigger"

func getVisibleDescription():
	return "You have quite some experience with BDSM and now want others to experience it too. You get an ability to force BDSM restraints onto others during fights! Restraints are lost if the enemy struggles out of them."

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/bdsm.png"
