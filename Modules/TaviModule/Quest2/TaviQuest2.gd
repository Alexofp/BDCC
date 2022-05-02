extends QuestBase

func _init():
	id = "TaviQuest2"

func getVisibleName():
	return "Syndicate"

func getProgress():
	var result = []
	
	result.append("Tavi told you to meet her near the checkpoint so you can get to the captain's office and try to call 'Tavi's friends'")

	return result

func isVisible():
	return GM.main.getFlag(TaviModule.Tavi_Quest2Started)

func isCompleted():
	return false && GM.main.getFlag(TaviModule.Tavi_GotApple)

func isMainQuest():
	return true
