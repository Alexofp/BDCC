extends QuestBase

func _init():
	id = "Ch2ElizaQuest"

func getVisibleName():
	return "Mind-melting Drugs"

func getProgress():
	var result = []
	
	result.append("You must go to the medical and find a way to steal the mind-melting drugs before they use them on Tavi. Talk to Eliza.")
	
	if(GM.main.getFlag("TaviModule.ch2PCFailedToStealDuringCheckup")):
		result.append("Your only way to steal the drugs now is to find the room they are stored in. Should be somewhere in the medical.")

	return result

func isVisible():
	return GM.main.getFlag("TaviModule.ch1ApproachedAfterQuest2")

func isCompleted():
	return GM.main.getFlag("TaviModule.ch2PCStoleDrugs")

func isMainQuest():
	return true
