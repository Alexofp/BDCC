extends QuestBase

func _init():
	id = "SaveAlexQuest"

func getVisibleName():
	return "Trust Issues"

func getProgress():
	var result = []
	
	result.append("Alex's prosthetic spine is heavily damaged and requires parts to be repaired. Beat up engineers or raid the engineering bay storage. You need at least 10 parts. You have currently collected "+str(getFlag("AlexRynardModule.ch2FoundParts", 0))+" parts.")

	if(getFlag("AlexRynardModule.ch2FoundParts", 0) >= 10):
		result.append("You have all the parts required! Go talk to Eliza in the medical lobby!")

	if(getFlag("AlexRynardModule.ch2FinalSceneHappened")):
		result.append("Alex can walk again. Good job.")

	return result

func isVisible():
	return getFlag("AlexRynardModule.ch2CheckAlexSceneHappened")

func isCompleted():
	return getFlag("AlexRynardModule.ch2FinalSceneHappened")

func isMainQuest():
	return false
