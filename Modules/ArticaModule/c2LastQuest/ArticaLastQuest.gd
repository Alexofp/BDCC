extends QuestBase

func _init():
	id = "ArticaLastQuest"

func getVisibleName():
	return "Catching Dreams"

func getProgress():
	var result = []
	
	result.append("Someone stole Artica's dreamcatcher while you weren't looking. Find out who did it by beating inmates up and interogating them!\n\nAlternatively, you pay doctor Quinn a visit, maybe she can help cure Artica's sadness through alternative means..")

	var clueNumber = getFlag("ArticaModule.lqClues", 0)
	var allClues = GlobalRegistry.getModule("ArticaModule").getLastQuestHints()
	
	if(clueNumber > 0):
		var learnedClues = []
		
		var _i = 0
		for clue in allClues:
			if(_i < clueNumber):
				learnedClues.append(clue)
			else:
				break
			_i += 1
		
		result.append("Here are all the hints that you know about Artica's dreamcatcher:\n"+Util.join(learnedClues, "\n"))

	if(getFlag("ArticaModule.LQArticaGotDreamCatcher")):
		result.append("Artica has her dreamcatcher back! She is forever grateful..")

	if(getFlag("ArticaModule.LQArticaGotBrainwashed")):
		result.append("Artica doesn't even remember that she used to have a dreamcatcher. She is now happy to be your obedient slut!")

	return result

func isVisible():
	return getFlag("ArticaModule.lastQuestStarted")

func isCompleted():
	return getFlag("ArticaModule.LQArticaGotDreamCatcher") || getFlag("ArticaModule.LQArticaGotBrainwashed")

func isMainQuest():
	return false
