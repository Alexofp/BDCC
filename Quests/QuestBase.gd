extends Reference
class_name QuestBase

var id = "error"

func getVisibleName():
	return "Bad quest"

func getProgress():
	return ["Bad quest, let the developer know"]

func isVisible():
	return false

func isCompleted():
	return false

func isMainQuest():
	return false

func getPriority():
	return 0

func getFlag(flagID, defaultValue = null):
	return GM.main.getFlag(flagID, defaultValue)
