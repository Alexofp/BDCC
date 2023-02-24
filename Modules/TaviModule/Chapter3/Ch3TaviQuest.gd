extends QuestBase

func _init():
	id = "Ch3TaviQuest"

func getVisibleName():
	return "Tavi's Revenge"

func getProgress():
	var result = []
	
	result.append("You got everything you need. Time to go talk with Tavi.")
	
	if(GM.QS.isCompleted("Ch2ElizaQuest") && !GM.main.getFlag("TaviModule.ch2DrugsGaveToTavi")):
		result.append("You have the drugs. Go give them to Tavi.")

	if(GM.main.getFlag("TaviModule.ch3StartedInfiltration")):
		result.append("You need to find the control room and initiate a maintenance protocol in order to open the door to the bluespace transmitter.")

	if(GM.main.getFlag("TaviModule.ch3CompletedDoorHack")):
		result.append("You enabled the maintenance protocol. Return back to Tavi")

	if(GM.main.getFlag("TaviModule.Ch4ServedPunishment")):
		result.append("You're free! But you gotta get your revenge on the cat who told about your plans to the captain. Find Kait in the lilac block during mornings.")

	if(GM.main.getFlag("TaviModule.Ch4KaitSceneHappened")):
		result.append("(( This is where Tavi's route ends for now ))")

	return result

func isVisible():
	return GM.QS.isCompleted("Ch2ElizaQuest") && GM.QS.isCompleted("Ch2AlexQuest")

func isCompleted():
	return false # GM.main.getFlag("TaviModule.Ch4KaitSceneHappened")

func isMainQuest():
	return true
