extends PerkBase

func _init():
	id = Perk.StartInfertile
	skillGroup = Skill.Start

func getVisibleName():
	return "Infertile"

func getVisibleDescription():
	return "No matter what you will never be able to get pregnant"

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

