extends PerkBase

func _init():
	id = Perk.StartMaleChastity
	skillGroup = Skill.Start

func getVisibleName():
	return "Male Chastity"

func getVisibleDescription():
	return "A [b]permanent[/b] chastity cage will be forced upon you during the intake process. Only applies if you have a penis."

func hiddenWhenLocked() -> bool:
	return true

func hiddenWhenUnlocked() -> bool:
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

