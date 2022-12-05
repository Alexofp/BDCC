extends PerkBase

func _init():
	id = Perk.CombatDoubleDown
	skillGroup = Skill.Combat

func getVisibleName():
	return "Doubling down"

func getVisibleDescription():
	return "Your reflexes are insane, you get the ability to react to the enemy's attack by doing your basic physical attack a second time while spending 10 stamina"

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/revolt.png"

