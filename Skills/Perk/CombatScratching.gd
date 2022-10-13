extends PerkBase

func _init():
	id = Perk.CombatScratching
	skillGroup = Skill.Combat

func getVisibleName():
	return "Scratchy-scratchy"

func getVisibleDescription():
	return "You learned to use your claws in a fight, sometimes you will cause bleeding when punching somebody"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/grasping-claws.png"
