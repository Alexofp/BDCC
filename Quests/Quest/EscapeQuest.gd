extends QuestBase
class_name EscapeQuest

func _init():
	id = "EscapeQuest"

func getVisibleName():
	return "Escape from the prison"

func getProgress():
	var result = []
	
	result.append("Seems like you are stuck in this place for while. You should try and see if escaping form this space prison is even possible.")
	
	return result

func isVisible():
	return true

func isCompleted():
	return false

func isMainQuest():
	return true
