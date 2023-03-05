extends SceneBase

func _init():
	sceneID = "rahiSlaveryTalkScene"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		
		var statLimit = getModule("RahiModule").getStatLimit()
		if(getFlag("RahiModule.rahiObedience", 0) > statLimit):
			setFlag("RahiModule.rahiObedience", statLimit)
		if(getFlag("RahiModule.rahiAffection", 0) > statLimit):
			setFlag("RahiModule.rahiAffection", statLimit)
		
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("Rahi stands near her bed.")
		
		saynn("[say=rahi]Yes, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"?..[/say]")
		
		sayn("Rahi's stats:")
		sayn("Relationship stage: "+str(getFlag("RahiModule.rahiSlaveryStage", 0)))
		sayn("Obedience: "+str(getFlag("RahiModule.rahiObedience", 0)))
		sayn("Affection: "+str(getFlag("RahiModule.rahiAffection", 0)))
		#sayn("Alcohol addiction: "+str(getFlag("RahiModule.rahiAddiction", 0)))
		#sayn("Unfairness: "+str(getFlag("RahiModule.rahiUnfair", 0)))
		#sayn("Spoildness: "+str(getFlag("RahiModule.rahiSpoiled", 0)))
		sayn("Tiredness: "+str(getFlag("RahiModule.rahiTired", 0)))
		sayn("")
		#sayn("Punishment points: "+str(getFlag("RahiModule.rahiPunishPoints", 0)))
		#sayn("Reward points: "+str(getFlag("RahiModule.rahiRewardPoints", 0)))
		sayn("Needs punishment: "+str(getFlag("RahiModule.rahiNeedsPunishment", false)))
		sayn("Needs reward: "+str(getFlag("RahiModule.rahiNeedsReward", false)))
		
		addButton("Talk", "Talk about stuff", "talk")
		if(getFlag("RahiModule.rahiTired", 0) < 3):
			addButton("Reward", "Reward Rahi", "reward")
			addButton("Punish", "Punish Rahi", "punish")
			addButton("Activities", "See what else you can do with Rahi", "activities")
		else:
			addDisabledButton("Reward", "Rahi is too tired")
			addDisabledButton("Punish", "Rahi is too tired")
			addDisabledButton("Activities", "Rahi is too tired")
		addButton("Relationship", "See where your relationship is headed", "relationship")
		addButton("Leave", "Enough talking", "endthescene")
		
	if(state == "talk"):
		saynn("What do you wanna talk about with Rahi.")
		
		if(!getFlag("RahiModule.rahiCommentedOnTask", false)):
			addButton("Task", "Talk about the completed task", "talk_task")
		else:
			addDisabledButton("Task", "You clearly commented on her task today")
		addButton("Anything", "Talk about anything", "talk_anything")
		addButton("Back", "Go back a menu", "")
		
	if(state == "reward"):
		saynn("How do you wanna reward the kitty.")
		
		addButton("Pet", "Pet that kitty", "doreward", ["rahiRewardPetScene"])
		addButton("Back", "Go back a menu", "")
		
	if(state == "punish"):
		saynn("How do you wanna punish the kitty.")
		
		addButton("Tie up", "Tie kitty up", "dopunish", ["rahiPunishmentTyingUpScene"])
		addButton("Back", "Go back a menu", "")
		
	if(state == "activities"):
		saynn("What do you wanna do with the kitty.")
		
		addButton("Shower", "Go take a shower", "doactivity", ["RahiShowerScene"])
		addButton("Back", "Go back a menu", "")
		
	if(state == "relationship"):
		saynn("What do you wanna change about your relationship?")
		
		# Unlocks from a certain stage
		addButton("Your title", "How should kitty call you", "change_title")
		addButton("Back", "Go back a menu", "")
	
	if(state == "change_title"):
		saynn("How do you want kitty to call you?")
		var titles = [
			GM.pc.getName(), "Master", "Mistress", "Miss", "Owner", "Trainer", "Love",
		]
		for title in titles:
			addButton("'"+title+"'", "Make her call you like this", "set_title", [title])
		addButton("Never mind", "You don't wanna change it", "relationship")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "talk_anything"):
		runScene("rahiSlaveryTalkAnythingScene")
		return
		
	if(_action == "talk_task"):
		runScene("rahiTaskCommentingScene")
		setFlag("RahiModule.rahiCommentedOnTask", true)
		setState("")
		return
	
	if(_action == "set_title"):
		if(_args[0] == GM.pc.getName()):
			GM.main.clearFlag("RahiModule.rahiPCName")
		else:
			setFlag("RahiModule.rahiPCName", _args[0])
		setState("")
		return
	
	if(_action == "doreward"):
		var needsReward = getFlag("RahiModule.rahiNeedsReward", false)
		
		if(needsReward):
			increaseFlag("RahiModule.rahiAffection", 4)
			increaseFlag("RahiModule.rahiObedience", 1)
		else:
			increaseFlag("RahiModule.rahiObedience", -2)
			increaseFlag("RahiModule.rahiAffection", 2)
		increaseFlag("RahiModule.rahiTired", 1)
		
		runScene(_args[0], [needsReward])
		setState("")
		setFlag("RahiModule.rahiNeedsReward", false)
		return

	if(_action == "dopunish"):
		var needsPunishment = getFlag("RahiModule.rahiNeedsPunishment", false)
		
		if(needsPunishment):
			increaseFlag("RahiModule.rahiObedience", 4)
			increaseFlag("RahiModule.rahiAffection", 1)
		else:
			increaseFlag("RahiModule.rahiAffection", -2)
			increaseFlag("RahiModule.rahiObedience", 2)
		increaseFlag("RahiModule.rahiTired", 1)
		
		runScene(_args[0], [needsPunishment])
		setState("")
		setFlag("RahiModule.rahiNeedsPunishment", false)
		return

	if(_action == "doactivity"):
		increaseFlag("RahiModule.rahiTired", 1)
		
		runScene(_args[0], ["slavery"])
		setState("")
		return

	setState(_action)
