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
		
		if(getFlag("RahiModule.rahiMile7Proposed", false)):
			saynn("She proudly wears the ring that you gave her.")
		elif(getFlag("RahiModule.rahiMile8Branded", false)):
			saynn("She looks proud after being branded by you.")
		elif(getFlag("RahiModule.rahiMile8Pierced", false)):
			saynn("She looks proud wearing your piercing.")
		
		var currentStage = getModule("RahiModule").getSlaveryStage()
		var isEnslaved = getFlag("RahiModule.rahiMile7Enslaved", false)
		
		if(getFlag("RahiModule.rahiNeedsPunishment", false)):
			saynn("[say=rahi]"+RNG.pick([
				"She is sorry, {rahiMaster}.. She tried her best..",
				"She feels terrible for letting you down, {rahiMaster}..",
				"She will work harder next time..",
				"She is so sorry for failing you, {rahiMaster}..",
				"She will do anything to make it up to you, {rahiMaster}..",
				"She hopes you can forgive her, {rahiMaster}..",
				"She knows.. She messed up..",
				"Sorry, {rahiMaster}..",
				"She is willing to accept any punishment you see fit, {rahiMaster}..",
				"Please help her learn from her mistakes, {rahiMaster}..",
			])+"[/say]")
		# Just saved Rahi
		elif(currentStage <= 0):
			saynn("[say=rahi]"+RNG.pick([
				"Thank you.. for saving her..",
				"She hopes she isn't bothering you..",
				"Oh.. Hello..",
				"She is not really good at talking.. sorry..",
				"Oh.. She got lost in her thoughts for a second..",
				"U-um.. Do you wanna chat for a bit?..",
				"She is willing to do her best..",
				"Hello..",
			])+"[/say]")
		# Stole crate of toys
		elif(currentStage <= 1):
			saynn("[say=rahi]"+RNG.pick([
				"Yes, {rahiMaster}?..",
				"She enjoyed our last.. heist?..",
				"Hey, {rahiMaster}.. She is trying to stay out of trouble..",
				"She appretiates your company, {rahiMaster}..",
				"She hopes you're not too disappointed with her, {rahiMaster}..",
				"That was fun.. what we did.. Wasn't it, {rahiMaster}?..",
				"Wanna chat for a bit, {rahiMaster}?.. She is not much of a talker..",
				"She is very grateful to have you around, {rahiMaster}..",
			])+"[/say]")
		# Got caught drinking
		elif(currentStage <= 2):
			saynn("[say=rahi]"+RNG.pick([
				"Yes, {rahiMaster}?..",
				"She was so stupid.. Sorry, {rahiMaster}..",
				"That drinking thing.. Won't happen again, {rahiMaster}..",
				"Sorry for breaking the rules, {rahiMaster}..",
				"She will accept any punishment, {rahiMaster}.. to make things right..",
				"She will try to control herself better, {rahiMaster}.. It's just.. so hard..",
				"She feels like she is not good for anything, {rahiMaster}..",
				"Sometimes she just wants to curl up into a ball..",
				"She always lets others down..",
				"She is tired.. of being alone..",
				"Will anyone miss her if she is gonna be gone?.. Bad thoughts.. Sorry, {rahiMaster}..",
				"It feels like she is losing her mind..",
				"She is so ashamed of herself..",
				"It feels like she is drowning, {rahiMaster}..",
			])+"[/say]")
		# After wholesome scene at a waterfall
		elif(currentStage <= 3):
			saynn("[say=rahi]"+RNG.pick([
				"Yes, {rahiMaster}?..",
				"She is trying hard, {rahiMaster}.. But it's difficult..",
				"She doesn't deserve someone as kind as you, {rahiMaster}..",
				"She doesn't know how to repay you, {rahiMaster}..",
				"You bring light into her dark days, {rahiMaster}..",
				"She feels.. safe.. when you are near, {rahiMaster}..",
				"You make her want to be a better kitty, {rahiMaster}..",
				"She is glad you're here, {rahiMaster}..",
				"Splashing you with water was fun, {rahiMaster}..",
				"She feels way better after what we did near that water pond, {rahiMaster}..",
			])+"[/say]")
		# After sharing her backstory
		elif(currentStage <= 4):
			saynn("[say=rahi]"+RNG.pick([
				"Yes, {rahiMaster}?..",
				"You're the only one who understands her, {rahiMaster}..",
				"Sorry for burdening you with her problems, {rahiMaster}..",
				"Thank you for not rejecting her, {rahiMaster}..",
				"She feels.. hopeful?.. for the first time in a long time.. Thank you, {rahiMaster}..",
				"She thought she would never be able to share her story..",
				"She is grateful for your support.. Thank you for helping her through this..",
				"She doesn't know if she can forgive herself..",
				"Do you think old scars can heal, {rahiMaster}?.. She thinks no..",
				"You always make her happy, {rahiMaster}.. ",
				"She is gonna be honest with you, {rahiMaster}.. She wants to drink.. so much..",
				"Please don't give up on her, {rahiMaster}..",
			])+"[/say]")
		# After ending her alcohol addiction
		elif(currentStage <= 5):
			saynn("[say=rahi]"+RNG.pick([
				"Yes, {rahiMaster}?..",
				"She wants to never look back at her past self..",
				"She never realized how hard it would be to quit drinking, {rahiMaster}..",
				"She feels so much better, {rahiMaster}.. Now that she is sober..",
				"Still a long way for her, right, {rahiMaster}.. But we will get there..",
				"She has to face her fears and emotions head-on now.. It's.. scary..",
				"She can't thank you enough, {rahiMaster}..",
				"She wants to make you proud, {rahiMaster}..",
				"She wishes she could be as confident as you, {rahiMaster}..",
				"You're always here when she needs support, {rahiMaster}..",
				"Things are gonna get better now, right, {rahiMaster}?..",
				"Want something, {rahiMaster}?..",
				"Is she a good or a bad kitty, {rahiMaster}?..",
			])+"[/say]")
		# After getting healed in cryo
		elif(currentStage <= 6):
			saynn("[say=rahi]"+RNG.pick([
				"Yes, {rahiMaster}?..",
				"She feels like a new kitty..",
				"She is grateful for your care and attention, {rahiMaster}..",
				"She is.. kinda excited?..",
				"She feels like she can herself again.. Thank you, {rahiMaster}..",
				"She is excited to see what the future holds..",
				"She is so lucky to have you, {rahiMaster}..",
				"So strange.. to not feel that pain..",
				"She is glad she doesn't have to hide her scars anymore..",
				"Meow-meow-meow.. Oh, sorry, {rahiMaster}..",
				"Meow..",
				"She showed that doctor, didn't she?..",
				"She never wants to return to that dark place, {rahiMaster}..",
				"She never realized how much she needed you in her life, {rahiMaster}..",
				"She doesn't know where she would be without you, {rahiMaster}..",
				"She is gonna make you proud, {rahiMaster}..",
			])+"[/say]")
		# After Rahi agrees to be your slave
		elif(currentStage <= 7 && isEnslaved):
			saynn("[say=rahi]"+RNG.pick([
				"Yes, {rahiMaster}?..",
				"She will do her best to serve you, {rahiMaster}.",
				"She.. I.. want to make you happy, {rahiMaster}..",
				"She will always respect and obey you, {rahiMaster}..",
				"She.. I'm.. devoted to you, {rahiMaster}..",
				"She belongs to you, {rahiMaster}..",
				"She.. I will do anything to make you happy, {rahiMaster}..",
				"She will follow your every command, {rahiMaster}..",
				"Thank you.. for making her.. me.. your slave, {rahiMaster}..",
				"She is so honored, {rahiMaster}..",
			])+"[/say]")
		# Proposed to Rahi
		elif(currentStage <= 7 && !isEnslaved):
			saynn("[say=rahi]"+RNG.pick([
				"Yes, {rahiMaster}?..",
				"She can't wait to be your.. wife.. {rahiMaster}..",
				"Thank you for making her feel so special, {rahiMaster}..",
				"You mean everything to her.. to me, {rahiMaster}..",
				"You made me the happiest kitty in the world, {rahiMaster}..",
				"You're my everything, {rahiMaster}..",
				"She loves you, {rahiMaster}..",
				"She is so greateful to have you in her life, {rahiMaster}..",
				"Dreams do come true, don't they, {rahiMaster}?..",
				"Nya~!",
				"Meow-meow-meow!",
			])+"[/say]")
		else:
			saynn("[say=rahi]Yes, {rahiMaster}?..[/say]")
		
		sayn("Rahi's stats:")
		sayn("Relationship stage: "+str(getFlag("RahiModule.rahiSlaveryStage", 0)))
		sayn("Obedience: "+str(getFlag("RahiModule.rahiObedience", 0)))
		sayn("Affection: "+str(getFlag("RahiModule.rahiAffection", 0)))
		sayn("Tiredness: "+str(getFlag("RahiModule.rahiTired", 0)))
		sayn("")
		if(getFlag("RahiModule.rahiNeedsPunishment", false)):
			sayn("Rahi deserves to be punished")
		if(getFlag("RahiModule.rahiNeedsReward", false)):
			sayn("Rahi deserves a reward")
		if(getFlag("RahiModule.rahiNeedsPunishment", false) || getFlag("RahiModule.rahiNeedsReward", false)):
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
		if(slaveryStage >= 3):
			addButton("Cuddle", "Cuddle with your kitty", "doreward", ["rahiRewardCuddleScene"])
		if(getModule("RahiModule").isSkillLearned("rahiSkillExhibit")):
			addButton("Exhibitionism", "(Exhibitionism) Nudity can be rewarding..", "doreward", ["rahiRewardExhibitionismScene"])
		addButton("Back", "Go back a menu", "")
		
	if(state == "punish"):
		saynn("How do you wanna punish the kitty.")
		
		addButton("Tie up", "Tie kitty up", "dopunish", ["rahiPunishmentTyingUpScene"])
		if(getModule("RahiModule").isSkillLearned("rahiSkillMasochist")):
			addButton("Choke Rahi", "(Masochism) Punish Rahi with a rough breathplay session", "dopunish", ["rahiPunishmentChokingScene"])
		if(getModule("RahiModule").isSkillLearned("rahiSkillPetplay")):
			addButton("Forced petplay", "(Petplay) Force Rahi to wear puppy equipment and give her walkies", "dopunish", ["rahiPunishmentForcedPetplayScene"])
		if(getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			addButton("Piss toilet", "(Watersports) Make Rahi into a piss toilet for you", "dopunish", ["rahiPunishmentPissToiletScene"])
		addButton("Back", "Go back a menu", "")
		
	if(state == "activities"):
		saynn("What do you wanna do with the kitty.")
		
		addButton("Shower", "Go take a shower", "doactivity", ["RahiShowerScene"])
		addButton("Embrace", "Hug kitty and spend some time together", "doactivity", ["RahiEmbraceScene"])
		if(getModule("RahiModule").isSkillLearned("rahiSkillDominance")):
			addButton("Dominance", "Teach Rahi to be more dominant", "doactivity", ["rahiActivityDominanceScene"])
		if(getModule("RahiModule").isSkillLearned("rahiSkillAnal")):
			addButton("Anal training", "Train Rahi to become a buttslut", "doactivity", ["rahiActivityAnalScene"])
		if(getModule("RahiModule").isSkillLearned("rahiSkillPetplay")):
			addButton("Petplay", "Train Rahi to be a puppy/kitty", "doactivity", ["rahiActivityPetplayScene"])

		addButton("Back", "Go back a menu", "")
		
	if(state == "relationship"):
		saynn("What do you wanna change about your relationship?")
		
		saynn("Your kitty calls you: {rahiMaster}")
		
		if(getModule("RahiModule").canSleepInPlayerCell()):
			if(getModule("RahiModule").shouldSleepInPlayerCell()):
				saynn("Your kitty will sleep in your cell if possible.")
			else:
				saynn("Your kitty sleeps in her cell.")
			
			if(getModule("RahiModule").canSexThePlayerOnMornings()):
				if(getModule("RahiModule").shouldSexThePlayerOnMornings()):
					saynn("Your kitty will wake you up with sex.")
				else:
					saynn("Your kitty won't wake you up with sex.")
			
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
		
		if(getModule("RahiModule").canSleepInPlayerCell()):
			addButton("Toggle sleep", "Should the kitty sleep with you in your cell or not", "toggle_sleep")
			
			if(getModule("RahiModule").canSexThePlayerOnMornings()):
				addButton("Morning sex", "Should the kitty surprise you with morning sex", "toggle_morningsex")
			else:
				addDisabledButton("Morning sex", "(Sex) Kitty needs to be more skilled at sex to do this")
		
		if(getFlag("RahiModule.wearingPortalPanties")):
			addButton("Remove portal panties", "Take them back from Rahi", "take_portal_panties_back")
		elif(GM.pc.getInventory().hasItemID("PortalPanties")):
			addButton("Give portal panties", "Ask Rahi to wear these panties that you have", "make_rahi_wear_portal_panties")
		
		addButton("Back", "Go back a menu", "")
	
	if(state == "take_portal_panties_back"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={underwear=true}})
		
		saynn("It's probably best if Rahi doesn't wear those panties anymore.")
		
		saynn("[say=pc]About those panties that you're wearing..[/say]")
		
		saynn("[say=rahi]You want them back, {rahiMaster}?[/say]")
		
		saynn("You nod. Rahi quickly pulls them down and gives them to you.")
		
		saynn("[say=rahi]Here.. They are fun..[/say]")
		
		saynn("She blushes deeply after saying that. What a kitty.")
		
		addButton("Continue", "See what happens next", "relationship")
	
	if(state == "make_rahi_wear_portal_panties"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={underwear=true}})
		
		saynn("You show Rahi the fancy panties that you have.")
		
		saynn("[say=rahi]The heart is cute.. Where did you get those, {rahiMaster}?[/say]")
		
		saynn("You smile and offer them to the kitty. Maybe it's best if you don't tell her anything. But you make sure to set the portal panties to the 'unlocked' mode. Don't want your kitty to panic when she realizes she can't take off her panties.")
		
		saynn("[say=pc]It's a gift, enjoy.[/say]")
		
		saynn("Rahi lowers her gaze.")
		
		saynn("[say=rahi]Are you sure?..[/say]")
		
		saynn("You nod, making the feline blush. She carefully grabs them.")
		
		saynn("[say=pc]I wanna see how they look on you.[/say]")
		
		saynn("[say=rahi]Yes, {rahiMaster}, of course..")
		
		saynn("Rahi quickly strips her uniform and puts the purple panties on.")
		
		saynn("[say=rahi]A bit cold.. is that.. metal?[/say]")
		
		saynn("[say=pc]Don't worry about it, kitty.[/say]")
		
		saynn("Rahi purrs and nods.")
		
		saynn("[say=rahi]Thank you.. They're nice..[/say]")
		
		addButton("Continue", "See what happens next", "relationship")
	
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
		if(currentRank >= 2):
			titles.append_array(["Miss", "Mister", "Owner", "Trainer"])
		if(currentRank >= 3):
			titles.append_array(["Lady", "Goddess", "Lord", "Sir"])
		if(currentRank >= 4):
			titles.append_array(["Queen", "Ma’am", "King", "Prince"])
		if(currentRank >= 5):
			titles.append_array(["Mommy", "Madam", "Daddy", "Alpha"])
		if(currentRank >= 6):
			titles.append_array(["Handler", "Your Highness", "Boss", "Kitty's Keeper"])
		if(currentRank >= 7):
			titles.append_array(["Rahi's Handler", "Love"])
		if(currentRank >= 8):
			titles.append_array(["my love", "my Lord", "my Queen", "my Miss", "Bitch"])
		
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
		
	if(_action == "toggle_sleep"):
		setFlag("RahiModule.rahiShouldSleepWithPlayer", !getFlag("RahiModule.rahiShouldSleepWithPlayer", false))
		return
		
	if(_action == "toggle_morningsex"):
		setFlag("RahiModule.rahiShouldSexPlayerDuringSleep", !getFlag("RahiModule.rahiShouldSexPlayerDuringSleep", false))
		return
		
	if(_action == "make_rahi_wear_portal_panties"):
		GM.pc.getInventory().removeXOfOrDestroy("PortalPanties", 1)
		setFlag("RahiModule.wearingPortalPanties", true)
		getCharacter("rahi").resetEquipment()
		
	if(_action == "take_portal_panties_back"):
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("PortalPanties"))
		setFlag("RahiModule.wearingPortalPanties", false)
		getCharacter("rahi").getInventory().removeItemFromSlot(InventorySlot.UnderwearBottom)

	setState(_action)

func getDebugActions():
	return [
		{
			"id": "raiseObedience",
			"name": "Raise Obedience",
			"args": [
			],
		},
		{
			"id": "raiseAffection",
			"name": "Raise Affection",
			"args": [
			],
		},
		{
			"id": "setStage",
			"name": "Set Slavery Stage",
			"args": [
				{
					"id": "stage",
					"name": "Stage",
					"type": "number",
					"value": 8,
				},
			]
		},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "raiseObedience"):
		increaseFlag("RahiModule.rahiObedience", 10)
	if(_id == "raiseAffection"):
		increaseFlag("RahiModule.rahiAffection", 10)
	if(_id == "setStage"):
		setFlag("RahiModule.rahiSlaveryStage", _args["stage"])
