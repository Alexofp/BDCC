extends QuestBase

func _init():
	id = "AvyArenaQuest"

func getVisibleName():
	return "The Fallen Champion"

func getProgress():
	var result = []
	
	result.append("Doctor Quinn has asked to steal a special plant with aphrodisiac properties. She said you can find them in the Green Houses.")

	if(getFlag("FightClubModule.StolePlantForEliza")):
		result.append("You stole the plant. Time to return to doctor Quinn. You can find her in the lobby of the medical wing.")

	if(getFlag("FightClubModule.ReturnedPlantToEliza")):
		result.append("Doctor Quinn has prepared the drug and gave it to Risha, meaning that Avy should now have it. Go back to Avy and challenge her!")

	return result

func isVisible():
	return getFlag("FightClubModule.GotTaskToStealPlant")

func isCompleted():
	return getFlag("FightClubModule.AvyGotRekt")

func isMainQuest():
	return false
