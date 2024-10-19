extends SceneBase

func _init():
	sceneID = "WorldScene"

func _run():
	if(runInteraction()):
		return
	
	#saynn(ModularDialogue.generate("GuardCaughtOffLimits", {guard=GM.pc,inmate=GM.pc}))
	#print(GM.main.IS.getPawnIDsNear(GM.pc.location, 2, 1))
	
	var roomID = GM.pc.location
	var _roomInfo = GM.world.getRoomByID(roomID)
	
	aimCamera(roomID)

	#say("Meow\n")
	#say(_roomInfo.getDescription())

	if(GM.world.canGoID(roomID, GameWorld.Direction.NORTH)):
		addButtonAt(6, "North", "Go north", "go", [GameWorld.Direction.NORTH, Direction.North])
	else:
		addDisabledButtonAt(6, "North", "Can't go north")
		
	if(GM.world.canGoID(roomID, GameWorld.Direction.WEST)):
		addButtonAt(10, "West", "Go west", "go", [GameWorld.Direction.WEST, Direction.West])
	else:
		addDisabledButtonAt(10, "West", "Can't go west")
		
	if(GM.world.canGoID(roomID, GameWorld.Direction.SOUTH)):
		addButtonAt(11, "South", "Go south", "go", [GameWorld.Direction.SOUTH, Direction.South])
	else:
		addDisabledButtonAt(11, "South", "Can't go south")
	
	if(GM.world.canGoID(roomID, GameWorld.Direction.EAST)):
		addButtonAt(12, "East", "Go east",  "go", [GameWorld.Direction.EAST, Direction.East])
	else:
		addDisabledButtonAt(12, "East", "Can't go east")
	#addDisabledButton("bark", "no awo")
	
	if(GM.main.IS.hasPawnsAtIgnorePC(roomID)):
		addButtonAt(7, "Look around", "See what's happening around you", "look_around")
		setCharactersEasyList(GM.main.IS.getPawnIDsAt(roomID))
	else:
		clearCharacter()
	
	if(GM.pc.getInventory().hasRemovableRestraints()):
		addButtonAt(8, "Struggle", "Struggle against your restraints", "struggle")
	addButtonAt(9, "Me", "Shows actions related to you and also your personal information", "me")
	addButtonAt(13, "Tasks", "Look at your tasks", "tasks")
	addButtonAt(14, "Inventory", "Look at your inventory", "inventory")
	#addButtonAt(5, "Sex Test", "Sex test", "sextest")
	#addButtonAt(7, "Slave Test", "Slave test", "slavetest")
	#addButtonAt(7, "Computer test", "Computer test", "comptest")
	#addButtonAt(8, "Hard Computer test", "Computer test", "comptest2")
	#addButtonAt(8, "Pc override test", "Override test", "overridetest")
	#addButtonAt(8, "Masochism minigame", "Test", "masochismminigame")
	
	_roomInfo._onPreEnter()
	setLocationName(_roomInfo.getName())
	
	if(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness()):
		saynn(_roomInfo.getBlindDescription())
	else:
		saynn(_roomInfo.getDescription())
		
	var roomMemory = GM.main.getRoomMemory(roomID)
	if(roomMemory != null && roomMemory != ""):
		saynn("[i]"+roomMemory+"[/i]")
		
	_roomInfo._onEnter()
	GM.ES.triggerRun(Trigger.EnteringRoom, [GM.pc.location])

func _react(_action: String, _args):
	# RoomAction support
	if(_action == "actionCallback"):
		var scenetorun = _args[0]
		runScene(scenetorun)
		
	# Scripted Room support
	if(_action == "roomCallback"):
		var roomid = _args[0]
		var keyid = _args[1]
		var _room = GM.world.getRoomByID(roomid)
		return _room._onButton(keyid)
	
	if(_action == "go"):
		playAnimation(StageScene.Solo, "walk")
		#playAnimation(StageScene.PuppySolo, "walk")
		#playAnimation(StageScene.Solo, "custom", {anim={"Arm.L":{"a":[-0,0,-3.02]},"Arm.R":{"a":[-0,0,2.87]},"Chest":{"a":[-0,0,0.26]},"Hips":{"a":[-0,0,2.84],"p":[0,0.52,0]},"LegDown.R":{"a":[-0,0,-1.33]},"LegUpper.L":{"a":[-0,0,0.1]},"LegUpper.R":{"a":[-0,0,0.96]},"Tail1":{"a":[-0,0,-0.33]},"Tail2":{"a":[-0,0,-0.38]},"Tail3":{"a":[-0,0,-0.39]},"Tail4":{"a":[-0,0,-0.28]},"Tail5":{"a":[-0,0,-0.34]}}  })
		GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, _args[0]))
		processTime((30 if !GM.pc.hasBoundLegs() else 60))
		aimCamera(GM.pc.location)
		GM.ES.triggerReact(Trigger.EnteringRoom, [GM.pc.location, _args[1]])
		
		GM.main.showLog()

	if(_action == "inventory"):
		runScene("InventoryScene")
	if(_action == "tasks"):
		runScene("QuestLogScene")
	if(_action == "struggle"):
		runScene("StrugglingScene")
	if(_action == "me"):
		runScene("MeScene")
	if(_action == "sextest"):
		#runScene("GenericSexScene", [NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true}), "socket", SexType.SlutwallSex])
		#getCharacter("socket").addEffect("SexSpacedOut")
		#runScene("GenericSexScene", ["rahi", "pc", SexType.SlutwallSex])
		#GM.pc.getInventory().addItem(GlobalRegistry.createItem("BreastPump"))
		#GM.pc.getInventory().addItem(GlobalRegistry.createItem("BreastPumpAdvanced"))
		runScene("GenericSexScene", ["pc", "rahi"])
		#runScene("GenericSexScene", ["rahi", "pc"])
		#runScene("GenericSexScene", ["nova", "pc"])
		#runScene("GenericSexScene", ["pc", "nova"])
		#if(RNG.chance(50)):
		#	runScene("GenericSexScene", ["nova", "pc"])
		#else:
		#	runScene("GenericSexScene", ["pc", "nova"])
		
		if(true):
			return
		var npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {})
		var theChar:DynamicCharacter = getCharacter(npcID)
		var newEnslaveQuest = NpcEnslavementQuest.new()
		newEnslaveQuest.setChar(theChar)
		newEnslaveQuest.setSlaveType(SlaveType.Slut)
		newEnslaveQuest.generateTasks()
		theChar.setEnslaveQuest(newEnslaveQuest)
		runScene("GenericSexScene", ["pc", npcID])
		if(true):
			return
		#var npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
		#var theChar:DynamicCharacter = getCharacter(npcID)
		#var personality:Personality = theChar.getPersonality()
		#personality.clear()
		
		#getModule("NpcSlaveryModule").doEnslaveCharacter(npcID)
		#runScene("EnslaveDynamicNpcScene", [npcID])
	
	if(_action == "slavetest"):
		var npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
		#var theChar:DynamicCharacter = getCharacter(npcID)
		#var personality:Personality = theChar.getPersonality()
		#personality.clear()
		
		#getModule("NpcSlaveryModule").doEnslaveCharacter(npcID)
		runScene("KidnapDynamicNpcScene", [npcID])
	
	if(_action == "comptest"):
		runScene("ComputerSimScene", ["TaviEngineeringComputer"])
	if(_action == "comptest2"):
		runScene("ComputerSimScene", ["TaviEngineeringSafeComputer"])
	if(_action == "overridetest"):
		runScene("PCOverrideExample")
	if(_action == "masochismminigame"):
		runScene("TaviMasochismScene")
	if(_action == "look_around"):
		runScene("LookingAroundScene")
	if(_action == "progress_interaction"):
		var pawn:CharacterPawn = GM.main.IS.getPawn("pc")
		var interaction:PawnInteractionBase = pawn.getInteraction()
		
		if(!interaction.isWaitingForScene()):
			if(interaction.currentActionID == ""):
				GM.main.IS.decideNextAction(interaction, {scene=self})
			if(!interaction.isWaitingForScene()):
				if(interaction.busyActionSeconds > 0):
					processTime(interaction.busyActionSeconds)
				else:
					processTime(30)
				interaction.doCurrentAction({scene=self})
				#if(!pawn.getInteraction().isWaitingForScene()):
				#	GM.main.IS.decideNextAction(pawn.getInteraction(), {scene=self})
	if(_action == "pick_interaction_action"):
		#var pawn:CharacterPawn = GM.main.IS.getPawn("pc")
		var interaction:PawnInteractionBase = _args[0]#pawn.getInteraction()
		interaction.setPickedAction(_args[1], {scene=self})
		
		if(!interaction.isWaitingForScene()):
			if(interaction.busyActionSeconds > 0):
				processTime(interaction.busyActionSeconds)
			else:
				processTime(30)
			interaction.doCurrentAction({scene=self})



func runInteraction():
	var pawn:CharacterPawn = GM.main.IS.getPawn("pc")
	if(pawn == null || pawn.currentInteraction == null || !pawn.currentInteraction.doesStealControlFromPC()):
		return false
	
	var interaction:PawnInteractionBase = pawn.getInteraction()
	setCharactersEasyList(interaction.getAllInvolvedCharIDs())
	interaction.playAnimation()
	aimCameraAndSetLocName(interaction.getLocation())
	
	if(interaction.getCurrentActionText() != ""):
		saynn(interaction.getCurrentActionText())
	
	var textAndActions:Array = interaction.getTextAndActions()
	saynn(textAndActions[0])
	
	if(GM.main.isDebuggingIS):
		sayn("[b]Debug info[/b]:")
		saynn(Util.join(pawn.getDebugInfo(), "\n"))
	
	if(interaction.getCurrentPawn() == pawn):
		for action in textAndActions[1]:
			if(action.has("disabled") && action["disabled"]):
				addDisabledButton(action["name"], action["desc"])
			#elif(action.has("start_sex") && action["start_sex"].size() > 0 && action["start_sex"][0] == "pc"):
			#	addButtonWithChecks(action["name"], action["desc"], "pick_interaction_action", [interaction, action], [[ButtonChecks.CanStartSex]])
			else:
				addButton(action["name"], action["desc"], "pick_interaction_action", [interaction, action])
	else:
		addButton("Continue", "See what happens next", "progress_interaction")
	
	return true
	
func startInteractionFight(who:String, withWho:String):
	if(who == "pc"):
		runScene("FightScene", [withWho], "interaction_fight_pcstarted")
	else:
		runScene("FightScene", [who], "interaction_fight_pcdef")

func startInteractionSex(domID:String, subID:String, sexType = SexType.DefaultSex, extraParams:Dictionary = {}):
	if(domID != "pc"):
		getCharacter(domID).prepareForSexAsDom()
		GlobalRegistry.getCharacter(domID).addPain(-50)
	runScene("GenericSexScene", [domID, subID, sexType, extraParams], "interaction_sex")

func sendStatusToInteraction(_result):
	var pawn:CharacterPawn = GM.main.IS.getPawn("pc")
	if(pawn == null):
		return
	var interaction:PawnInteractionBase = pawn.getInteraction()
	if(interaction == null):
		return
	
	interaction.receiveSceneStatusFinal(_result)

func _react_scene_end(_tag, _result):
	if(_tag == "interaction_sex"):
		sendStatusToInteraction(_result[0])
	
	if(_tag == "interaction_fight_pcstarted"):
		var battlestate = _result[0]

		if(battlestate == "win"):
			sendStatusToInteraction({"won":true})
		else:
			sendStatusToInteraction({"won":false})
	if(_tag == "interaction_fight_pcdef"):
		var battlestate = _result[0]

		if(battlestate == "win"):
			sendStatusToInteraction({"won":false})
		else:
			sendStatusToInteraction({"won":true})

func shouldDisplayBigButtons():
	var pawn:CharacterPawn = GM.main.IS.getPawn("pc")
	if(pawn == null):
		return false
	var interaction:PawnInteractionBase = pawn.getInteraction()
	if(interaction == null):
		return false
	return interaction.shouldShowBigButtons()

func isSpyingOnInteractionsWith(_charID:String):
	if(_charID == "pc"):
		return true
	return false

func resolveCustomCharacterName(_charID):
	var pawn:CharacterPawn = GM.main.IS.getPawn("pc")
	if(pawn == null):
		return
	var interaction:PawnInteractionBase = pawn.getInteraction()
	if(interaction == null):
		return
	
	if(interaction.involvedPawns.has(_charID)):
		return interaction.involvedPawns[_charID]
	return .resolveCustomCharacterName(_charID)

func supportsShowingPawns() -> bool:
	return true
