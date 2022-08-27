extends QuestBase

func _init():
	id = "WorkInMinesQuest"

func getVisibleName():
	return "Mineshafts"

func getProgress():
	var result = []
	
	result.append("Risha told you to go work in the mineshafts and about the lift in the main hall that can get you there. Maybe this will help you to earn some credits")
	
	return result

func isVisible():
	return true

func isCompleted():
	return GM.main.getFlag("Mining_IntroducedToMinning", false)

func isMainQuest():
	return false
