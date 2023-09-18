extends QuestBase

func _init():
	id = "Ch6TaviQuest"

func getVisibleName():
	return "Consequences"

func getProgress():
	var result = []
	
	result.append("Find Tavi.")
	
	if(getFlag("TaviModule.Ch5FoundPunishedTavi")):
		result.append("Tavi got broken and became your pet. Treat her well or turn her into an even bigger slut.")

	if(getFlag("TaviModule.Ch7PlanningSceneHappened")):
		result.append("You can try to storm the command deck alone or train Tavi enough to let her help you. You might want to tie up any loose ends before doing this..")

	return result

func isVisible():
	return getFlag("TaviModule.Ch5BigSceneStarted")

func isCompleted():
	return getFlag("TaviModule.Ch7CaptainSceneHappened")

func isMainQuest():
	return true
