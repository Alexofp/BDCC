extends PerkBase

func _init():
	id = Perk.StartNoHybrids
	skillGroup = Skill.Start

func getVisibleName():
	return "No hybrids"

func getVisibleDescription():
	return "You will never give birth to a hybrid. Others that are impregnated by your cum will never give birth to a hybrid either. Hybrid is a mix of two species"
	
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

