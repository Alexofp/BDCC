extends PerkBase

func _init():
	id = Perk.BDSMPerfectStreak
	skillGroup = Skill.BDSM

func getVisibleName():
	return "Perfect streak"

func getVisibleDescription():
	return "Time to say RED to your restraints, you can continue the struggling minigame as long as you keep hitting the red zone perfectly. Each perfect hit makes your struggling 25% more efficient."

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/breaking-chain.png"

