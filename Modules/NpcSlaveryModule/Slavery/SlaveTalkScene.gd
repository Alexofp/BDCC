extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter
var resultText = ""

var savedWantedToDo = ""
var savedWantedToDoName = ""
var savedWantedToDoArgs = []

var lastActionID = ""

func _init():
	sceneID = "SlaveTalkScene"

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)
	
	
func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		aimCameraAndSetLocName(GM.pc.getLocation())
		addCharacter(npcID)
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery == null):
			saynn("Something went wrong")
			addButton("Back", "Enough interactions", "endthescene")
			return
		npcSlavery.checklevelUp()
		
		if(npcSlavery.isDoingActivity()):
			var activity:SlaveActivityBase = npcSlavery.getActivity()
			
			var animInfo = activity.getCustomInteractAnimInfo()
			if(animInfo != null):
				playAnimation(animInfo[0], animInfo[1], animInfo[2])
			else:
				playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
			
			if(activity.preventsNormalInteractions()):
				addButtonAt(14, "Back", "Enough interactions", "endthescene")

				saynn(activity.getActivityText())
				
				addActivityButtons()
				return
		else:
			playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		
		saynn(npc.getName()+" is a level "+str(npcSlavery.slaveLevel)+" {npc.slave} ("+npcSlavery.getExperienceStr()+" exp)")
		#saynn("{npc.He} {npc.isAre} standing still, {npc.his} collar leashed to the floor.")
		saynn(npcSlavery.getPerfectIdleMessage())
		
		if(!npcSlavery.isMindBroken()):
			if(npcSlavery.getDespair() > 0.5):
				saynn("{npc.name} is feeling depressed. Perfect for breaking {npc.his} spirit but it might lead to {npc.him} snapping if you keep it up.")
			elif(npcSlavery.getDespair() > 0.8):
				saynn("[b]{npc.name} looks extremely depressed.[/b] {npc.He} {npc.isAre} close to snapping.")
			
			if(npcSlavery.getWorkEfficiency() < 0.2):
				saynn("{npc.name} looks very tired.")
			
			if(npcSlavery.getObedience() < 0.9 && npc.getInventory().hasRemovableRestraints()):
				var restraintAmount = npc.getInventory().getEquppedRemovableRestraints().size()
				if(restraintAmount > 0):
					if(npcSlavery.getAwareness() < 0.8):
						saynn("{npc.He} {npc.isAre} wearing "+str(restraintAmount)+" restraint"+("s" if restraintAmount != 1 else "")+" which will help {npc.him} understand {npc.his} place.")
					else:
						saynn("{npc.He} {npc.isAre} wearing "+str(restraintAmount)+" restraint"+("s" if restraintAmount != 1 else "")+" which helps remind {npc.him} of {npc.his} place.")
			
			saynn("{npc.name} "+npcSlavery.getRewardBalanceString())
		
		if(getFlag("NpcSlaveryModule.debugSlaveInfo", false)):
			sayn("[b]DEBUG INFO:[/b]")
			saynn(npcSlavery.getDebugInfo())
			
		if(false):
			sayn("[b]Personality:[/b]")
			var personality: Personality = npc.getPersonality()
			if(personality != null):
				var texts = []
				for statID in PersonalityStat.getAll():
					var value = personality.getStat(statID)
					var statName = PersonalityStat.getVisibleName(statID)
					var statValue = PersonalityStat.getVisibleDesc(statID, value)
					
					texts.append(statName+": "+statValue)
				saynn(Util.join(texts, "\n"))
		
		sayn("[b]Skills:[/b]")
		for skillID in npcSlavery.slaveSpecializations:
			var slaveType:SlaveTypeBase = GlobalRegistry.getSlaveType(skillID)
			if(slaveType == null):
				continue
			var gradeLetter = npcSlavery.rankToLetter(npcSlavery.slaveSpecializations[skillID])
			
			sayn(""+slaveType.getVisibleName()+": "+gradeLetter)
		sayn("")
		
		if(npcSlavery.isReadyToBeLeveledUp()):
			sayn("In order to level {npc.name} up to slave level "+str(npcSlavery.getLevel()+1)+", make these things happen to {npc.him}:")
			sayn(npcSlavery.getLevelUpHintText())
			saynn("Leveling your slave up makes training {npc.him} easier and also unlocks new actions.")
		
		addButtonAt(12, "Leash", "Leash your slave and see what you can with them around the station", "start_walkies")
		addButtonWithChecksAt(13, "Forced sex" if npcSlavery.isActivelyResisting() else "Sex", "Start sex with your slave", "do_forced_sex", [], [ButtonChecks.CanStartSex])
		addButtonAt(14, "Back", "Enough interactions", "endthescene")
		
		addButton("Talk", "Tell something to your slave", "talk_menu")
		addButtonWithChecks("Train", "Train your slave", "do_train", [], [[ButtonChecks.NotLate], [ButtonChecks.NotGagged], [ButtonChecks.NotBlindfolded]])
		addButton("Reward", "Show a list of rewards", "rewards_menu")
		addButton("Punish", "Show a list of punishments", "punishments_menu")
		addButton("Activities", "See what else you can do with this slave", "actions_menu")
		
		if(npcSlavery.isDoingActivity()):
			var activity:SlaveActivityBase = npcSlavery.getActivity()
			
			if(!activity.preventsNormalInteractions()):
				var theText = activity.getActivityText()
				if(theText != ""):
					saynn(theText)
				addActivityButtons()
		
	if(state == "actions_menu"):
		saynn("What do you want to do with your slave?")
		
		addButtonsForActionsOfType(SlaveActionBase.Action)
		addButton("Back", "You changed your mind!", "")

	if(state == "talk_menu"):
		saynn("What do you want to tell your slave?")
		
		addButtonsForActionsOfType(SlaveActionBase.Talk)
		addButton("Back", "You changed your mind!", "")

	if(state == "rewards_menu"):
		saynn("How do you want to reward your slave?")
		
		addButtonsForActionsOfType(SlaveActionBase.Reward)
		addButton("Back", "You changed your mind!", "")

	if(state == "punishments_menu"):
		saynn("How do you want to punish your slave?")
		
		addButtonsForActionsOfType(SlaveActionBase.Punishment)
		addButton("Back", "You changed your mind!", "")

	if(state == "do_action"):
		saynn(resultText)
		
		addButton("Continue", "See what happens next", "")

		var theAction:SlaveActionBase = GlobalRegistry.getSlaveAction(lastActionID)
		if(theAction != null):
			var extraActions = theAction.getExtraActions(npcID, {})
			for actionInfo in extraActions:
				var args = []
				if(actionInfo.has("args")):
					args = actionInfo["args"]
				var buttonChecks = []
				if(actionInfo.has("buttonChecks")):
					buttonChecks = actionInfo["buttonChecks"]
				addButtonWithChecks(actionInfo["name"], actionInfo["desc"], "do_extra_action", [theAction, actionInfo, args], buttonChecks)

	if(state == "do_train"):
		saynn(resultText)
		
		addButton("Continue", "See what happens next", "")
	
	if(state == "resisting_action"):
		saynn("Your slave is actively resisting any attempts to do anything with {npc.him}!")
		
		addButton("Okay", "You changed your mind", "forced_sex_let_resist")
		addButton("Fight them", "Force them through fighting", "resisting_start_fight")
	
	if(state == "resisting_scratch"):
		saynn("Your slave scratched you!")
		
		addAfterForceButton()
		addButton("Fight them", "Force them through fighting", "resisting_start_fight")
		addButton("Punish", "Show a list of punishments", "punishments_menu")
	
	if(state == "forced_sex_resist"):
		saynn("Your slave is trying to resist! You will have to force them by beating them up first!")
		
		addButton("Never mind", "You changed your mind", "forced_sex_let_resist")
		addButton("Fight", "Force them through fighting", "forced_sex_startfight")
		
	if(state == "won_forcedsex"):
		saynn("You won!")
		
		addButtonWithChecks("Fuck them", "Do what you wanted to do with them", "start_forced_sex_forced", [], [ButtonChecks.CanStartSex])
		addButton("Never mind", "You don't want to fuck them anymore", "")
	
	if(state == "won_resistaction"):
		saynn("You won!")
		
		addAfterForceButton()
		addButton("Cancel", "They should resist less at least", "")
	
	if(state == "lost_forcedsex"):
		saynn("You lost. Aw.")
		
		addButton("Never mind", "You don't want to fuck with them anymore", "forced_sex_let_resist")

func addActivityButtons():
	var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
	if(npcSlavery.isDoingActivity()):
		var activity:SlaveActivityBase = npcSlavery.getActivity()
	
		var extraActions = activity.getInteractActions()
		for actionInfo in extraActions:
			var args = []
			if(actionInfo.has("args")):
				args = actionInfo["args"]
			var buttonChecks = []
			if(actionInfo.has("buttonChecks")):
				buttonChecks = actionInfo["buttonChecks"]
			addButtonWithChecks(actionInfo["name"], actionInfo["desc"], "do_activity_action", [activity, actionInfo, args], buttonChecks)


static func sortSlaveActions(a, b):
	if a.buttonPriority > b.buttonPriority:
		return true
	return false
		
func addButtonsForActionsOfType(actionsType):
	var theActionIDs = GlobalRegistry.getSlaveActionIDsOfType(actionsType)
	var actionsSorted = []
	for theActionID in theActionIDs:
		var theAction:SlaveActionBase = GlobalRegistry.getSlaveAction(theActionID)
		if(theAction == null):
			continue
		actionsSorted.append(theAction)
	actionsSorted.sort_custom(self, "sortSlaveActions")
	
	for theAction in actionsSorted:
		#var theAction:SlaveActionBase = GlobalRegistry.getSlaveAction(actionID)
		if(!theAction.isActionVisible(npcID)):
			continue
		
		if(theAction.extraSlaves.empty()):
			var canDoInfo = theAction.checkCanDoFinal(npcID)
			if(canDoInfo[0]):
				addButton(theAction.getVisibleName(), theAction.getFinalVisibleDesc(), "do_action", [theAction.id])
			elif(canDoInfo.size() > 1):
				addDisabledButton(theAction.getVisibleName(), "[color=red]"+canDoInfo[1]+"[/color]\n\n"+theAction.getFinalVisibleDesc())
		else:
			addButton(theAction.getVisibleName(), theAction.getFinalVisibleDesc(), "do_action", [theAction.id])

func addAfterForceButton():
	addButton(savedWantedToDoName, "Do what you wanted to do", savedWantedToDo, savedWantedToDoArgs)

func setStateResistance():
	var npcSlavery:NpcSlave = npc.getNpcSlavery()
	var possible = [["resisting_action", 1.0]]
	if(true):
		possible.append(["resisting_scratch", 1.0])
	var pickedRandom = RNG.pickWeightedPairs(possible)
	
	if(pickedRandom == "resisting_scratch"):
		GM.pc.addPain(RNG.randi_range(2, 5))
		npcSlavery.deservesPunishment(2)
	else:
		npcSlavery.deservesPunishment(1)
		
	setState(pickedRandom)
	return true
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "do_action"):
		var theAction:SlaveActionBase = GlobalRegistry.getSlaveAction(_args[0])
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		# Resisting!
		var resistChance = (100.0*float(npcSlavery.isResistingSuperActively()) + 40.0*float(npcSlavery.isActivelyResisting())) * theAction.slaveResistChanceMult
		if(RNG.chance(resistChance)):
			# Various resisting actions here?
			# Like scratching/biting/shoving/kicking (if no restraints)
			savedWantedToDo = "do_action_noresist"
			savedWantedToDoName = "Do action"
			savedWantedToDoArgs = [_args[0]]
			setStateResistance()
			return
		
	if(_action == "do_action" || _action == "do_action_noresist"):
		var theAction:SlaveActionBase = GlobalRegistry.getSlaveAction(_args[0])
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		# Multi-slave action
		if(!theAction.extraSlaves.empty()):
			runScene("SlaveStartActionScene", [theAction.id, npcID], "slaveStartAction")
			setState("")
			return
		
		# Action that launches a scene
		if(theAction.sceneID != ""):
			runScene("SlaveActionWrapperScene", [theAction.id, npcID, {}])
			if(theAction.endsTalkScene):
				endScene()
				return
			setState("")
			return
		# Simple action
		var result = theAction.doActionSimpleFinal(npcID)
		if(result.has("text")):
			resultText = result["text"]
		else:
			resultText = "An action happened!"
		lastActionID = theAction.id
		#theAction.playAnimation(npcID, {})
		setState("do_action")
		return

	if(_action == "do_train"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		var resistChance = max(80.0*float(npcSlavery.isResistingSuperActively()), 30.0*float(npcSlavery.isActivelyResisting()))
		if(RNG.chance(resistChance)):
			# Various resisting actions here?
			# Like scratching/biting/shoving/kicking (if no restraints)
			savedWantedToDo = "do_train_noresist"
			savedWantedToDoName = "Train"
			savedWantedToDoArgs = []
			setStateResistance()
			return
		
	if(_action == "do_train" || _action == "do_train_noresist"):
		processTime(30*60)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		var result = npcSlavery.doTrain()
		resultText = Util.join(result["texts"], "\n\n")
		
		setState("do_train")
		return

	if(_action == "do_activity_action"):
		#var action:SlaveActivityBase = _args[0]
		var actionInfo = _args[1]
		var theArgs = _args[2]
		
		endScene()
		runScene(actionInfo["sceneID"], [npcID, {}, theArgs])
		return

	if(_action == "do_extra_action"):
		#var action:SlaveActionBase = _args[0]
		var actionInfo = _args[1]
		var theArgs = _args[2]
		
		endScene()
		runScene(actionInfo["sceneID"], [npcID, {}, theArgs])
		return

	if(_action == "forced_sex_startfight"):
		runScene("FightScene", [npcID], "forcedsexfight")
		return

	if(_action == "resisting_start_fight"):
		runScene("FightScene", [npcID], "antiresistancefight")
		return

	if(_action == "start_walkies"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.isResistingSuperActively() || (RNG.chance(40) && npcSlavery.isActivelyResisting())):
			savedWantedToDo = "start_walkies_forced"
			savedWantedToDoName = "Leash slave"
			savedWantedToDoArgs = []
			setStateResistance()
		else:
			runScene("SlaveryWalkiesGrabScene", [npcID])
			endScene()
		return

	if(_action == "start_walkies_forced"):
		runScene("SlaveryWalkiesGrabScene", [npcID])
		endScene()
		return

	if(_action == "do_forced_sex"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.isResistingSuperActively() || (RNG.chance(40) && npcSlavery.isActivelyResisting())):
			savedWantedToDo = "start_forced_sex_forced"
			savedWantedToDoName = "Forced sex"
			savedWantedToDoArgs = []
			setStateResistance()
		else:
			startSex()
		return
	
	if(_action == "start_forced_sex_forced"):
		startSex(true)
		return
		
	if(_action == "forced_sex_let_resist"):
		# Raise the spirit here?
		setState("")
		return

	setState(_action)

func startSex(isResisting = false):
	if(isResisting):
		npc.addEffect("SexActivelyResisting")
	runScene("GenericSexScene", ["pc", npcID], "sex_with_slave")

func _react_scene_end(_tag, _result):
	if(_tag == "slaveStartAction"):
		if(_result is Array && _result.size() > 0 && _result[0]):
			endScene()
			return
			
	if(_tag in ["sex_with_slave"]):
		setState("")
	
	if(_tag == "antiresistancefight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("won_resistaction")
			addExperienceToPlayer(10)
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			npcSlavery.afterBeatenUp()
			npcSlavery.deservesPunishment(2)
			#npcSlavery.handlePunishment(2)
		else:
			setState("lost_forcedsex")
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			npcSlavery.deservesPunishment(2)
	
	if(_tag == "forcedsexfight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("won_forcedsex")
			addExperienceToPlayer(10)
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			npcSlavery.afterBeatenUp()
			#npcSlavery.handlePunishment(2)
		else:
			setState("lost_forcedsex")
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			npcSlavery.deservesPunishment(2)

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["resultText"] = resultText
	data["savedWantedToDo"] = savedWantedToDo
	data["savedWantedToDoName"] = savedWantedToDoName
	data["savedWantedToDoArgs"] = savedWantedToDoArgs
	data["lastActionID"] = lastActionID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)

	resultText = SAVE.loadVar(data, "resultText", "")
	savedWantedToDo = SAVE.loadVar(data, "savedWantedToDo", "")
	savedWantedToDoName = SAVE.loadVar(data, "savedWantedToDoName", "")
	savedWantedToDoArgs = SAVE.loadVar(data, "savedWantedToDoArgs", null)
	lastActionID = SAVE.loadVar(data, "lastActionID", "")

func getDebugActions():
	return [
		{
			"id": "levelUP",
			"name": "Slave levelup",
			"args": [
			],
		},
		{
			"id": "skillLevelup",
			"name": "Skill levelup",
			"args": [
			],
		},
		{
			"id": "addExp",
			"name": "Add exp",
			"args": [
				{
					"id": "amount",
					"name": "Amount",
					"type": "number",
					"value": 1000,
				},
			],
		},
		{
			"id": "toggleDebug",
			"name": "Toggle Debug Info",
			"args": [
			],
		},
	]

func doDebugAction(_id, _args = {}):
	var npcSlavery:NpcSlave = npc.getNpcSlavery()
	if(_id == "levelUP"):
		npcSlavery.doLevelup()
	if(_id == "skillLevelup"):
		npcSlavery.levelupCurrentSpecialization()
	if(_id == "toggleDebug"):
		setFlag("NpcSlaveryModule.debugSlaveInfo", !getFlag("NpcSlaveryModule.debugSlaveInfo", false))
	if(_id == "addExp"):
		npcSlavery.addExperience(_args["amount"])
		
