extends SceneBase

func _init():
	sceneID = "rahiSlaveryTalkScene"

func _run():
	if(state == ""):
		saynn("Rahi stands near her bed.")
		
		saynn("[say=rahi]Yes, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"?..[/say]")
		
		sayn("Rahi's stats:")
		sayn("Relationship stage: "+str(getFlag("RahiModule.rahiSlaveryStage", 0)))
		sayn("Obedience: "+str(getFlag("RahiModule.rahiObedience", 0)))
		sayn("Affection: "+str(getFlag("RahiModule.rahiAffection", 0)))
		sayn("Alcohol addiction: "+str(getFlag("RahiModule.rahiAddiction", 0)))
		sayn("Unfairness: "+str(getFlag("RahiModule.rahiUnfair", 0)))
		sayn("Spoildness: "+str(getFlag("RahiModule.rahiSpoiled", 0)))
		sayn("Tiredness: "+str(getFlag("RahiModule.rahiTired", 0)))
		sayn("")
		sayn("Punishment points: "+str(getFlag("RahiModule.rahiPunishPoints", 0)))
		sayn("Reward points: "+str(getFlag("RahiModule.rahiRewardPoints", 0)))
		
		addButton("Talk", "Talk about stuff", "talk")
		addButton("Reward", "Reward Rahi", "reward")
		addButton("Punish", "Punish Rahi", "punish")
		addButton("Activities", "See what else you can do with Rahi", "activities")
		addButton("Relationship", "See where your relationship is headed", "relationship")
		addButton("Leave", "Enough talking", "endthescene")
		
	if(state == "talk"):
		saynn("What do you wanna talk about with Rahi.")
		
		addButton("Task", "Talk about the completed task", "talk_task")
		addButton("Anything", "Talk about anything", "talk_anything")
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
	
	if(_action == "set_title"):
		if(_args[0] == GM.pc.getName()):
			GM.main.clearFlag("RahiModule.rahiPCName")
		else:
			setFlag("RahiModule.rahiPCName", _args[0])
		setState("")
		return

	setState(_action)
