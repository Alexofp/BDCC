extends SceneBase

func _init():
	sceneID = "rahiSlaveryTalkScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		
		var rahiModule = getModule("RahiModule")
		
		var statLimit = getModule("RahiModule").getStatLimit()
		if(getFlag("RahiModule.rahiObedience", 0) > statLimit):
			setFlag("RahiModule.rahiObedience", statLimit)
		if(getFlag("RahiModule.rahiAffection", 0) > statLimit):
			setFlag("RahiModule.rahiAffection", statLimit)
		
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("Rahi stands near her bed.")
		
		saynn("[say=rahi]Yes, {rahiMaster}?..[/say]")
		
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
		sayn("")
		
		sayn("Rahi's skills:")
		var skills = rahiModule.getSkillsInfo()
		for skillID in skills:
			var skillInfo = skills[skillID]
			
			if(!rahiModule.isSkillLearned(skillID)):
				continue
			
			sayn(skillInfo["name"]+": "+rahiModule.getSkillScoreText(skillID))
		if(getModule("RahiModule").canLearnNewSkill() && getFlag("RahiModule.rahiSlaveryShowNewSkill")):
			setFlag("RahiModule.rahiSlaveryShowNewSkill", false)
			sayn("(You can pick a new skill for Rahi to train in Relationship menu)")
		
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
		var slaveryStage = getModule("RahiModule").getSlaveryStage()
		saynn("How do you wanna reward the kitty.")
		
		addButton("Pet", "Pet that kitty", "doreward", ["rahiRewardPetScene"])
		if(slaveryStage >= 1):
			addButton("Give treat", "Give your kitty a treat", "doreward", ["rahiRewardTreatScene"])
		addButton("Back", "Go back a menu", "")
		
	if(state == "punish"):
		saynn("How do you wanna punish the kitty.")
		
		addButton("Tie up", "Tie kitty up", "dopunish", ["rahiPunishmentTyingUpScene"])
		if(getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			addButton("Piss toilet", "(Watersports) Make Rahi into a piss toilet for you", "dopunish", ["rahiPunishmentPissToiletScene"])
		addButton("Back", "Go back a menu", "")
		
	if(state == "activities"):
		saynn("What do you wanna do with the kitty.")
		
		addButton("Shower", "Go take a shower", "doactivity", ["RahiShowerScene"])
		if(getModule("RahiModule").isSkillLearned("rahiSkillDominance")):
			addButton("Dominance", "Teach Rahi to be more dominant", "doactivity", ["rahiActivityDominanceScene"])
		addButton("Back", "Go back a menu", "")
		
	if(state == "relationship"):
		saynn("What do you wanna change about your relationship?")
		
		# Unlocks from a certain stage
		if(getModule("RahiModule").getSlaveryStage() >= 1):
			addButton("Your title", "How should kitty call you", "change_title")
		else:
			addDisabledButton("Your title", "Advance your relationship further before you can choose your title")
		if(getModule("RahiModule").canLearnNewSkill()):
			if(getFlag("RahiModule.rahiTired", 0) < 3):
				addButton("Teach new skill", "Start training kitty a new skill", "train_new_skill")
			else:
				addDisabledButton("Teach new skill", "Rahi is too tired for that")
		addButton("Back", "Go back a menu", "")
	
	if(state == "train_new_skill"):
		saynn("What skill do you wanna start teaching to Rahi?")
		
		saynn("(If you don't want Rahi to learn a certain skill you don't have to teach it to her, story will progress regardless)")
		
		var rahiModule = getModule("RahiModule")
		var skills = rahiModule.getSkillsInfo()
		for skillID in skills:
			var skillInfo = skills[skillID]
			
			if(rahiModule.isSkillLearned(skillID)):
				continue
			
			if(skillInfo.has("requiredContent")):
				var hasBadContent = false
				for thecontent in skillInfo["requiredContent"]:
					if(!OPTIONS.isContentEnabled(thecontent)):
						hasBadContent = true
				if(hasBadContent):
					continue
			
			sayn("- [b]"+skillInfo["name"]+"[/b]: "+skillInfo["desc"])
			addButton(skillInfo["name"], skillInfo["desc"], "do_teach_new_skill", [skillID])
		
		addButton("Back", "Never mind", "relationship")
	
	if(state == "change_title"):
		saynn("How do you want kitty to call you?")
		
		saynn("(You will unlock more as your relationship progresses)")
		var titles = [
			GM.pc.getName(), "Master", "Mistress",
		]
		var currentRank = getModule("RahiModule").getSlaveryStage()
		if(currentRank >= 3):
			titles.append_array(["Miss", "Mister", "Owner", "Trainer"])
		if(currentRank >= 4):
			titles.append_array(["Lady", "Goddess", "Lord", "Sir"])
		if(currentRank >= 5):
			titles.append_array(["Queen", "Ma’am", "King", "Prince"])
		if(currentRank >= 6):
			titles.append_array(["Mommy", "Madam", "Daddy", "Alpha"])
		if(currentRank >= 7):
			titles.append_array(["Handler", "Your Highness", "Boss", "Kitty's Keeper"])
		
		if(currentRank >= 8):
			titles.append_array(["Rahi's Handler", "my love", "my Lord", "my Queen", "my Miss", "Bitch"])
		
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

	if(_action == "do_teach_new_skill"):
		increaseFlag("RahiModule.rahiTired", 1)
		setState("")
		
		getModule("RahiModule").learnSkill(_args[0])
		runScene("rahiSlaverySkillLearnScene", [_args[0]])
		return

	setState(_action)

func getDebugActions():
	return [
		{
			"id": "raiseObedience",
			"name": "Raise obedience",
			"args": [
			],
		},
		{
			"id": "raiseAffection",
			"name": "Raise affection",
			"args": [
			],
		},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "raiseObedience"):
		increaseFlag("RahiModule.rahiObedience", 10)
	if(_id == "raiseAffection"):
		increaseFlag("RahiModule.rahiAffection", 10)
