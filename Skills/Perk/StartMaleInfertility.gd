extends PerkBase

func _init():
	id = Perk.StartMaleInfertility
	skillGroup = Skill.Start

func getVisibleName():
	return "Male Infertility"

func getVisibleDescription():
	return "Your cum can't get anyone pregnant no matter what"
	
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

