extends QuestBase

func _init():
	id = "RahiSlaveryQuest"

func getVisibleName():
	return "Rahi's Wet Whiskers"

func getProgress():
	var result = []
	
	result.append("Rahi seems to have problems with alcohol. You should talk with her about that.")

	return result

func isVisible():
	return getFlag("RahiModule.rahi1ElizaSceneHappened")

func isCompleted():
	return false

func isMainQuest():
	return false
