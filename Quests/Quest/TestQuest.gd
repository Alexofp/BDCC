extends QuestBase
class_name TestQuest

const Flag_something = "testFlag"

func _init():
	id = "TestQuest"

func getVisibleName():
	return "Test Quest"

func getProgress():
	var result = []
	
	result.append("Test test")
	result.append("mew mew")
	
	return result

func isVisible():
	return false

func isCompleted():
	return true

func isMainQuest():
	return false
