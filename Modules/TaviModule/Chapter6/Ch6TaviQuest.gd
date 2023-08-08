extends QuestBase

func _init():
	id = "Ch6TaviQuest"

func getVisibleName():
	return "Consequences"

func getProgress():
	var result = []
	
	result.append("Find Tavi.")
	
	if(getFlag("TaviModule.Ch5FoundPunishedTavi")):
		result.append("Tavi got broken and became your pet. Treat her well or turn her into an even bigger slut. (( Story will continue in the next update ))")

	return result

func isVisible():
	return getFlag("TaviModule.Ch5BigSceneStarted")

func isCompleted():
	return false#getFlag("TaviModule.Ch5BigSceneStarted")

func isMainQuest():
	return true
