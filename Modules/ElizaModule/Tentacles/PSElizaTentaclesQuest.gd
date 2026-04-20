extends QuestBase

func _init():
	id = "PSElizaTentaclesQuest"

func getVisibleName():
	return "Seeds Of Desire"

func getProgress():
	var result = []
	
	result.append("Eliza wants you to bring her a single plant egg. She didn't explain why exactly she needs one.")
	
	if(getFlag("ElizaModule.tent_firstegg", false)):
		result.append("Eliza needs more plant eggs to be able to create a perfect egg! Each egg is gonna reduce the final cost. You have given her "+str(getFlag("ElizaModule.tent_eggs", 0))+" egg"+("s" if (getFlag("ElizaModule.tent_eggs", 0) != 1) else "")+".")
	
	if(getFlag("ElizaModule.tent_born", false)):
		result.append("You now have a tentacle monster in your cell. Enjoy!")
	if(getFlag("ElizaModule.tent_elizaAnnoy", false)):
		result.append("Eliza has given you one of the tentacle eggs that she laid!")
	
	return result

func isVisible():
	return getFlag("ElizaModule.tent_started")

func isCompleted():
	return getFlag("ElizaModule.tent_born")

func isMainQuest():
	return false
