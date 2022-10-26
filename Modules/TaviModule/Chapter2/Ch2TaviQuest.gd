extends QuestBase

func _init():
	id = "Ch2TaviQuest"

func getVisibleName():
	return "Tavi's Revenge"

func getProgress():
	var result = []
	
	result.append("(( This quest is not yet completed, the story ends here for now. But go give drugs to Tavi if you didn't do it yet ))")
	
	if(GM.QS.isCompleted("Ch2ElizaQuest") && !GM.main.getFlag("TaviModule.ch2DrugsGaveToTavi")):
		result.append("You have the drugs. Go give them to Tavi.")

	return result

func isVisible():
	return GM.QS.isCompleted("Ch2ElizaQuest") && GM.QS.isCompleted("Ch2AlexQuest")

func isCompleted():
	return false

func isMainQuest():
	return true
