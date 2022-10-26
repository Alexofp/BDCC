extends PerkBase

func _init():
	id = Perk.NakedMagicHips
	skillGroup = Skill.Exhibitionism

func getVisibleName():
	return "Magic hips"

func getVisibleDescription():
	return "Swaying your hips at the oponent may make them weak for your body with 20% chance! Chance scales up with vitality"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/hips.png"

