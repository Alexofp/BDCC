extends QuestBase

func _init():
	id = "TaviQuest2"

func getVisibleName():
	return "The Syndicate"

func getProgress():
	var result = []
	
	result.append("Tavi told you to meet her near the checkpoint so you can get to the captain's office and try to call 'Tavi's friends'")

	return result

func isVisible():
	return GM.main.getModuleFlag("TaviModule", "Tavi_Quest2Started")

func isCompleted():
	return GM.main.getModuleFlag("TaviModule", "Tavi_Quest2Completed")

func isMainQuest():
	return true
