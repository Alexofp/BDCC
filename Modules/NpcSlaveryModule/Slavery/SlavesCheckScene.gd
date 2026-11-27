extends "res://Scenes/SceneBase.gd"

var resultText = ""
var savedCharID = ""

func _init():
	sceneID = "SlavesCheckScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return savedCharID

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")

		if(getFlag("SlaveAuctionModule.s1hap")):
			addButtonAt(13, "Blacktail Market", "Place where you can sell your slaves", "go_market")
		addButtonAt(14, "CLOSE", "Enough interactions", "endthescene")

		var slaves = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)
		var veryAngry := []
		var uncomfortableAndShouldTalkTo := []
		var expectingRewardOrPunishment := []
		var readyForTraining := []
		var readyToLevelUp := []

		for charID in slaves:
			var character:DynamicCharacter = getCharacter(charID)
			var npcSlavery:NpcSlave = character.getNpcSlavery()
			if(npcSlavery == null):
				continue

			var absent:bool = false
			if(npcSlavery.hasRandomEventToTrigger()):
				var randomEvent:SlaveEventBase = GlobalRegistry.getSlaveEvent(npcSlavery.randomEventWillHappenID)
				if(randomEvent != null):
					if(randomEvent.isSlaveAbsentAtStart()):
						absent = true
					else:
						var eventMessage = randomEvent.getSlavesCheckMessage(npcSlavery)
						if(eventMessage != null):
							saynn(eventMessage)

			if(npcSlavery.isBusyWithActivity()):
				absent = true
			elif(GM.main.IS.hasPawn(charID)):
				absent = true

			if(!absent):
				if(npcSlavery.isMindBroken()):
					pass
				elif(npcSlavery.isResistingSuperActively()):
					veryAngry.append(charID)
				else:
					if(npcSlavery.rewardBalance != 0):
						expectingRewardOrPunishment.append(charID)
					if(npcSlavery.getDespair() > 0.6):
						uncomfortableAndShouldTalkTo.append(charID)
					elif(npcSlavery.getNeediness() >= 25.0):
						uncomfortableAndShouldTalkTo.append(charID)
					if(!npcSlavery.isReadyToBeLeveledUp() && ((npcSlavery.canLearnNewSkillAndHasAvailable() || npcSlavery.getCurrentSpecializationLevel() < 15) && npcSlavery.getTiredEffect() < 0.5)):
						readyForTraining.append(charID)
				if(npcSlavery.isReadyToBeLeveledUp()):
					readyToLevelUp.append(charID)

			addButton(("(!) " if npcSlavery.hasRandomEventToTrigger() else "")+character.getName(), character.getSmallDescription(), "do_check", [character])

		if(!veryAngry.empty()):
			if(veryAngry.size() == 1):
				saynn("{" + veryAngry[0] + ".name} is fuming with rage!");
			else:
				for i in veryAngry.size():
					veryAngry[i] = "{" + veryAngry[i] + ".name}"
				saynn(Util.humanReadableList(veryAngry) + " are fuming with rage!")

		if(!uncomfortableAndShouldTalkTo.empty()):
			if(uncomfortableAndShouldTalkTo.size() == 1):
				saynn("{" + uncomfortableAndShouldTalkTo[0] + ".name} looks uncomfortable. You should talk to {" + uncomfortableAndShouldTalkTo[0] + ".himHer} and see what's wrong.");
			else:
				for i in uncomfortableAndShouldTalkTo.size():
					uncomfortableAndShouldTalkTo[i] = "{" + uncomfortableAndShouldTalkTo[i] + ".name}"
				saynn(Util.humanReadableList(uncomfortableAndShouldTalkTo) + " look uncomfortable. You should talk to them and see what's wrong.")

		if(!expectingRewardOrPunishment.empty()):
			if(expectingRewardOrPunishment.size() == 1):
				saynn("{" + expectingRewardOrPunishment[0] + ".name} looks like {" + expectingRewardOrPunishment[0] + ".heShe} {" + expectingRewardOrPunishment[0] + ".isAre} expecting you to do something to {" + expectingRewardOrPunishment[0] + ".himHer}.");
			else:
				for i in expectingRewardOrPunishment.size():
					expectingRewardOrPunishment[i] = "{" + expectingRewardOrPunishment[i] + ".name}"
				saynn(Util.humanReadableList(expectingRewardOrPunishment) + " look like they are expecting you to do something.")

		if(!readyForTraining.empty() && !GM.main.isVeryLate()):
			if(readyForTraining.size() == 1):
				saynn("{" + readyForTraining[0] + ".name} is ready for more training.");
			else:
				for i in readyForTraining.size():
					readyForTraining[i] = "{" + readyForTraining[i] + ".name}"
				saynn(Util.humanReadableList(readyForTraining) + " are ready for more training.")

		if(!readyToLevelUp.empty()):
			for i in readyToLevelUp.size():
				readyToLevelUp[i] = "{" + readyToLevelUp[i] + ".name}"
			saynn(Util.humanReadableList(readyToLevelUp) + " can be levelled up!")

		saynn("Who do you want to check on?")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "go_market"):
		endScene()
		
		if(!getFlag("SlaveAuctionModule.s2hap")):
			runScene("MirriS2FirstSellScene")
		else:
			var noMirri = getModule("SlaveAuctionModule").noMirri()
			if(noMirri):
				GM.pc.setLocation("market_market")
			else:
				GM.pc.setLocation("market_intro")
			#GM.pc.setLocation("market_intro")
			addMessage("You use your bluespace relay-tag to teleport to the Blacktail Market.")
			
		return
	
	if(_action == "do_check"):
		var character:DynamicCharacter = _args[0]
		var npcSlavery:NpcSlave = character.getNpcSlavery()
		
		if(!npcSlavery.isDoingActivity() || (npcSlavery.isDoingActivity() && npcSlavery.getActivity().shouldTriggerEventsOnTalk())):
			if(GM.ES.triggerReact("TalkedWithSlave", [character.getID(), "SlaveTalkScene"])):
				endScene()
				return
		
		runScene("SlaveTalkScene", [character.getID()])
		endScene()
		return

	if(_action == "do_just_talk"):
		var character:DynamicCharacter = _args[0]
		runScene("SlaveTalkScene", [character.getID()])
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["resultText"] = resultText
	data["savedCharID"] = savedCharID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	resultText = SAVE.loadVar(data, "resultText", "")
	savedCharID = SAVE.loadVar(data, "savedCharID", "")
