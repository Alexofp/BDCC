extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter
var resultText = ""

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
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery == null):
			saynn("Something went wrong")
			addButton("Back", "Enough interactions", "endthescene")
			return
		npcSlavery.checklevelUp()
		
		saynn(npc.getName()+" is a level "+str(npcSlavery.slaveLevel)+" slave")
		saynn("{npc.He} {npc.isAre} standing still, {npc.his} collar leashed to the floor.")
		
		if(true):
			sayn("[b]DEBUG INFO:[/b]")
			saynn(npcSlavery.getDebugInfo())
			
		if(true):
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
		
		addButton("Train", "Train your slave", "do_train")
		addButton("Forced sex", "Start sex with your slave", "do_forced_sex")
		addButton("Reward", "Show a list of rewards", "rewards_menu")
		addButton("Punish", "Show a list of punishments", "punishments_menu")
		addButton("Back", "Enough interactions", "endthescene")

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

	if(state == "do_train"):
		saynn(resultText)
		
		addButton("Continue", "See what happens next", "")
	
	if(state == "resisting_action"):
		saynn("Your slave is actively resisting any attempts to do anything with {npc.him}!")
		
		addButton("Okay", "You changed your mind", "forced_sex_let_resist")
		addButton("Fight them", "Force them through fighting", "resisting_start_fight")
	
	if(state == "forced_sex_resist"):
		saynn("Your slave is trying to resist! You will have to force them by beating them up first!")
		
		addButton("Never mind", "You changed your mind", "forced_sex_let_resist")
		addButton("Fight", "Force them through fighting", "forced_sex_startfight")
		
	if(state == "won_forcedsex"):
		saynn("You won!")
		
		addButton("Fuck them", "Do what you wanted to do with them", "start_forced_sex_forced")
		addButton("Never mind", "You don't want to fuck them anymore", "")
	
	if(state == "won_resistaction"):
		saynn("You won!")
		
		addButton("Continue", "They should resist less", "")
	
	if(state == "lost_forcedsex"):
		saynn("You lost. Aw.")
		
		addButton("Never mind", "You don't want to fuck with them anymore", "forced_sex_let_resist")
		
func addButtonsForActionsOfType(actionsType):
	for actionID in GlobalRegistry.getSlaveActionIDsOfType(actionsType):
		var theAction:SlaveActionBase = GlobalRegistry.getSlaveAction(actionID)
		
		if(theAction.extraSlaves.empty()):
			var canDoInfo = theAction.checkCanDoFinal(npcID)
			if(canDoInfo[0]):
				addButton(theAction.getVisibleName(), theAction.getVisibleDesc(), "do_action", [theAction])
			elif(canDoInfo.size() > 1):
				addDisabledButton(theAction.getVisibleDesc(), canDoInfo[1])
		else:
			addButton(theAction.getVisibleName(), theAction.getVisibleDesc(), "do_action", [theAction])
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "do_action"):
		var theAction:SlaveActionBase = _args[0]
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		# Resisting!
		var resistChance = (100.0*float(npcSlavery.isResistingSuperActively()) + 40.0*float(npcSlavery.isActivelyResisting())) * theAction.slaveResistChanceMult
		if(RNG.chance(resistChance)):
			# Various resisting actions here?
			# Like scratching/biting/shoving/kicking (if no restraints)
			npcSlavery.deservesPunishment(1)
			setState("resisting_action")
			return
		
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
		var result = theAction.doActionSimple(npcID)
		if(result.has("text")):
			resultText = result["text"]
		else:
			resultText = "An action happened!"

	if(_action == "do_train"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		var resistChance = max(80.0*float(npcSlavery.isResistingSuperActively()), 30.0*float(npcSlavery.isActivelyResisting()))
		if(RNG.chance(resistChance)):
			# Various resisting actions here?
			# Like scratching/biting/shoving/kicking (if no restraints)
			npcSlavery.deservesPunishment(1)
			setState("resisting_action")
			return
		
		var result = npcSlavery.doTrain()
		resultText = Util.join(result["texts"], "\n\n")

	if(_action == "forced_sex_startfight"):
		runScene("FightScene", [npcID], "forcedsexfight")
		return

	if(_action == "resisting_start_fight"):
		runScene("FightScene", [npcID], "antiresistancefight")
		return

	if(_action == "do_forced_sex"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.isResistingSuperActively() || (RNG.chance(40) && npcSlavery.isActivelyResisting())):
			setState("forced_sex_resist")
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
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)

	resultText = SAVE.loadVar(data, "resultText", "")
