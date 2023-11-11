extends PerkBase

func _init():
	id = Perk.FertilityBellySize
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Maternal Intuition"

func getVisibleDescription():
	return "You got so experienced at being pregnant that you can now roughly guess how many cubs/kids are inside any pregnant belly just from its size and the frequency of baby kicks..  (Stacks with the Insight of You perk)"
	
func getRequiredPerks():
	return []

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/pregnantmother.png"

func getBuffs():
	return [
	]
