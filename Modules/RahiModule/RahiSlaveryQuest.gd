extends QuestBase

func _init():
	id = "RahiSlaveryQuest"

func getVisibleName():
	return "Rahi's Wet Whiskers"

func getProgress():
	var result = []
	
	result.append("Rahi seems to have problems with alcohol. You should talk with her about that.")

	if(getFlag("RahiModule.rahi3SceneHappened")):
		result.append("Rahi had a strong case of alcohol poisoning. Visit her bench the next day to see if she is okay.")

	if(getFlag("RahiModule.rahi4SceneHappened")):
		result.append("You saved Rahi. But now you gotta help her. Visit her cell after she gets some rest.")


	return result

func isVisible():
	return getFlag("RahiModule.rahi1ElizaSceneHappened")

func isCompleted():
	return false

func isMainQuest():
	return false
