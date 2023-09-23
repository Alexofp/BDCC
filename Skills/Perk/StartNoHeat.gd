extends PerkBase

func _init():
	id = Perk.StartNoHeat
	skillGroup = Skill.Start

func getVisibleName():
	return "No heat"

func getVisibleDescription():
	return "You don't experience a periodic desire to be bred. Only applies if you have a womb"

func hiddenWhenLocked() -> bool:
	return true

func toggleable() -> bool:
	return false
	
func unlockable() -> bool:
	return false

func getCost():
	return 0
	
func getSkillTier():
	return 0

func getPicture():
	return "res://UI/StatusEffectsPanel/images/cuffshands.png"

