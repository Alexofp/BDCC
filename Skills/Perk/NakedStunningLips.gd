extends PerkBase

func _init():
	id = Perk.NakedStunningLips
	skillGroup = Skill.Exhibitionism

func getVisibleName():
	return "Stunning lips"

func getVisibleDescription():
	return "Licking your lips when the opponent is above 30% lust may cause them to be distracted with lewd thoughts, stunning them with 10% chance! Chance scales up with your sexiness"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/lips.png"

