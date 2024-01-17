extends SceneBase

var uniqueItemID = ""
var charactersWithPortalPanties = []
var cachedChars = false

var portalCharID = ""
var selectedHole = "" #penis,vagina,anus

func _init():
	sceneID = "UsePortalPantiesFleshlight"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return portalCharID

func _run():
	showFightUI = false
	if(!cachedChars):
		charactersWithPortalPanties = getNpcsWithPortalPanties()
		cachedChars = true
	
	if(state == ""):
		playAnimation(StageScene.SexPortal, "tease", {onlyRight=true})
		
		saynn("You activate the fleshlight and look at the little screen that it has.")
		
		saynn("Scanning.. Scanning done. Found "+str(charactersWithPortalPanties.size())+" "+("entities" if charactersWithPortalPanties.size()!=1 else "entity")+" who are currently wearing portal panties in the entire galaxy.")
		
		addButton("Cancel", "You changed your mind", "endthescene")
		
		if(charactersWithPortalPanties.size() > 0):
			var tableText = "[table=5][cell]ID[/cell][cell]Name[/cell][cell]Penis[/cell][cell]Vagina[/cell][cell]Anus[/cell]"
			var ti = 1
			for character in charactersWithPortalPanties:
				tableText += "[cell]"+str(ti)+"[/cell]"
				tableText += "[cell]"+str(character.getName())+"[/cell]"
				if(character.isWearingChastityCage()):
					tableText += "[cell]Obstructed[/cell]"
				else:
					tableText += "[cell]"+("Yes" if (character.hasPenis() && !character.hasReachablePenis()) else "No")+"[/cell]"
				tableText += "[cell]"+("Yes" if character.hasVagina() else "No")+"[/cell]"
				tableText += "[cell]Yes[/cell]"
				
				ti+=1
			tableText += "[/table]"
			saynn(tableText)
			
			saynn("Who do you want to connect to?")
			for character in charactersWithPortalPanties:
				if(character == null):
					continue
				addButton(str(character.getName()), "Connect to this person's portal panties", "connect_to", [character])
		else:
			saynn("Aw. The thing is kinda useless if there is no one wearing portal panties.")

	if(state == "connected"):
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		if(connectedChar != null):
			saynn("Connected to "+connectedChar.getName()+"'s portal panties.")
		
		saynn("Which portal do you want to open through the fleshlight?")
		
		addButton("Back", "Never mind", "disconnectPortal")
		if(connectedChar.hasPenis() && !connectedChar.hasReachablePenis() && !connectedChar.isWearingChastityCage()):
			addButton("Penis", "Show their dick", "openhole", ["penis"])
		if(connectedChar.hasVagina()):
			addButton("Vagina", "Show their pussy", "openhole", ["vagina"])
		addButton("Anus", "Show their anus", "openhole", ["anus"])

	if(state == "choose_penis"):
		playAnimation(StageScene.SexPortalOral, "hold", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		if(isPCPortal()):
			saynn("The fleshlight opens, revealing.. your {pc.penis}. Wow, you can see every detail of your member.")
		else:
			saynn("The fleshlight opens, revealing.. someone's {npc.penis}.")
		
		saynn("What do you want to do with it?")
		
		addButton("Close", "Close the portal", "disconnectPortal")
		if(!connectedChar.isReadyToPenetrate()):
			addButton("Make it hard", "Prepare that dick for more", "penis_make_hard")
		else:
			addButtonWithChecks("Suck it!", "Suck this dick", "penis_suck", [], [[ButtonChecks.NotOralBlocked]])
		
	if(state == "penis_make_hard"):
		playAnimation(StageScene.SexPortalOral, "hold", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		
		if(isPCPortal()):
			saynn("You wrap your free hand around that cock.. and start stroking it.")
			
			saynn("Yep, you're masturbating.. but it's still so weird to see your own dick getting hard before your eyes.")
			
			saynn("A few soft moans escape from you. There is a drop of precum shining on the tip of your member. Should be good enough..")
		else:
			saynn("You wrap your free hand around that cock.. and start stroking it.")
			
			saynn("Whoever that dick belongs to is probably quite confused. And yet, soon enough, their cock begins to get hard.")
			
			saynn("There is a drop of precum shining on the tip of your member. Should be good enough..")
			
		addButton("Continue", "See what happens next", "choose_penis")

	if(state == "penis_suck"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalOral, ("suck" if connectedChar.getLustLevel() <= 0.7 else "suckfast"), {onlyRight=isPCPortal(), npc=portalCharID, npcBodyState={hard=true}})
		
		if(isPCPortal()):
			saynn("You suck your own cock")
		else:
			saynn("You suck someone's cock")
		
		if(connectedChar.getLustLevel() >= 1.0):
			saynn("That cock is about to cum!")
			
			addButton("Swallow!", "Swallow that load", "penis_suck_swallow")
		else:
			addButton("Suck more", "Really suck that cock", "penis_suck")
	
	if(state == "penis_suck_swallow"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalOral, "hold", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		
		if(isPCPortal()):
			saynn("You swallow your own {npc.cum}!")
		else:
			saynn("You swallow all of the {npc.cum}!")
		
		addButton("Continue", "See what happens next", "choose_penis")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "penis_suck_swallow"):
		GM.pc.gotThroatFuckedBy(portalCharID)
		GM.pc.cummedInMouthBy(portalCharID)
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.orgasmFrom(portalCharID)
	
	if(_action == "penis_suck"):
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(20)

	if(_action == "penis_make_hard"):
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		while(!connectedChar.isReadyToPenetrate()):
			connectedChar.addLust(5)
			if(connectedChar.getLustLevel() >= 1.0):
				break

	if(_action == "disconnectPortal"):
		if(portalCharID != ""):
			if(portalCharID != "pc"):
				removeCharacter(portalCharID)
			portalCharID = ""
		setState("")
		return

	if(_action == "connect_to"):
		var character = _args[0]
		portalCharID = character.getID()
		if(!character.isPlayer()):
			addCharacter(portalCharID)
			#GM.main.updateCharacterUntilNow(portalCharID)
		setState("connected")
		return

	if(_action == "openhole"):
		selectedHole = _args[0]
		setState("choose_"+selectedHole)
		return

	setState(_action)

func isPCPortal():
	return portalCharID == "pc"

func getNpcsWithPortalPanties():
	var result = []
	
	if(GM.pc.isWearingPortalPanties()):
		result.append(GM.pc)
	
	var staticChars = GM.main.getCharacters()
	for charID in staticChars:
		var character:Character = staticChars[charID]
		if(character.isWearingPortalPanties()):
			result.append(character)
	
	var dynamicChars = GM.main.getDynamicCharacters()
	for charID in dynamicChars:
		var character:Character = dynamicChars[charID]
		if(character.isWearingPortalPanties()):
			result.append(character)
	
	return result

func saveData():
	var data = .saveData()

	data["uniqueItemID"] = uniqueItemID
	data["portalCharID"] = portalCharID
	data["selectedHole"] = selectedHole

	return data

func loadData(data):
	.loadData(data)

	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")
	portalCharID = SAVE.loadVar(data, "portalCharID", "pc")
	selectedHole = SAVE.loadVar(data, "selectedHole", "")
	
