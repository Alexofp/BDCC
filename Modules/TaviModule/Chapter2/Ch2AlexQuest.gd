extends QuestBase

func _init():
	id = "Ch2AlexQuest"

func getVisibleName():
	return "Bluespace'd"

func getProgress():
	var result = []
	
	result.append("You must find Alex Rynard somewhere in the mines level and get information about the location of the bluespace transmitter.")
	
	if(GM.main.getFlag("TaviModule.ch2AlexTalkedTo")):
		result.append("Apparently the bluespace transmitter is somewhere in the engineering. Search there.")

	if(GM.main.getFlag("TaviModule.ch2EscapedSymbian")):
		result.append("There must be something in the break room that will let you get access to the secure wing of the engineering.")

	return result

func isVisible():
	return GM.main.getFlag("TaviModule.ch1ApproachedAfterQuest2")

func isCompleted():
	return GM.main.getFlag("TaviModule.ch2PCLearnedCode")

func isMainQuest():
	return true
