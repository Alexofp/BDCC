extends SceneBase

var npcID = ""
var npc:DynamicCharacter

var walkiesType = ""

func _init():
	sceneID = "SlaveryWalkiesScene"

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)
	
	if(_args.size() > 1):
		walkiesType = _args[1]
		
		if(walkiesType == "walkies"):
			npc.getNpcSlavery().startActivity("Walkies")
	addCharacter(npcID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		if(!npc.isSlaveToPlayer()):
			saynn("Somehow, you lost your slave during the walkies! Oh no.")
			
			addButton("Continue", "See what happens next", "endthescene")
			return
		
		var roomID = GM.pc.location
		var _roomInfo = GM.world.getRoomByID(roomID)
		
		aimCamera(roomID)

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
		
		if(GM.pc.getInventory().hasRemovableRestraints()):
			addButtonAt(8, "Struggle", "Struggle against your restraints", "struggle")
		#addButtonAt(9, "Me", "Shows actions related to you and also your personal information", "me")
		#addButtonAt(13, "Tasks", "Look at your tasks", "tasks")
		addButtonAt(13, "Return to cell", "Enough wandering around with your slave", "return_to_cell")
		addButtonAt(14, "Inventory", "Look at your inventory", "inventory")
		
		_roomInfo._onPreEnter()
		setLocationName(_roomInfo.getName())
		
		if(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness()):
			saynn(_roomInfo.getBlindDescription())
		else:
			saynn(_roomInfo.getDescription())
			
		var roomMemory = GM.main.getRoomMemory(roomID)
		if(roomMemory != null && roomMemory != ""):
			saynn("[i]"+roomMemory+"[/i]")
		
		if(isPetWalkies()):
			var puppyPoints = npc.getNpcSlavery().getActivity().puppyPoints
			sayn("Puppy points: "+str(puppyPoints)+"/"+str(npc.getNpcSlavery().getActivity().getRequiredPuppyPoints())+". "+npc.getNpcSlavery().getActivity().getNeedText())
			
		_roomInfo._onEnter()
		GM.ES.triggerRun(Trigger.EnteringRoomWithSlave, [GM.pc.location, npcID, walkiesType])
	
	if(state == "return_to_cell"):
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		
		saynn("You return back to your cell with your slave.")
		
		addButton("Continue", "See what happens next", "endthescene")
	

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "return_to_cell"):
		processTime(5*60)
		GM.pc.setLocation(GM.pc.getCellLocation())
		setState("return_to_cell")
		npc.getNpcSlavery().addTired(2.0)
		return
	
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
		if(isPetWalkies()):
			playAnimation(StageScene.PuppyDuo, "walk", {npc=npcID, npcAction="walk", flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
			npc.getNpcSlavery().getActivity().generateNextWantIfNeeded()
			var petSkill = npc.getNpcSlavery().getSlaveSkill(SlaveType.Pet)
			var tiredMod = 1.0 - petSkill * 0.05
			
			npc.getNpcSlavery().addTired(max(0.0,0.04 * tiredMod))
			processTime(60)
		else:
			playAnimation(StageScene.Duo, "walk", {pc=npcID, npc="pc", flipNPC=true, npcAction="walk", bodyState={leashedBy="pc"}})
			processTime(30)
			
		GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, _args[0]))
		aimCamera(GM.pc.location)
		GM.ES.triggerReact(Trigger.EnteringRoomWithSlave, [GM.pc.location, _args[1], npcID, walkiesType])
		
		GM.main.showLog()

	if(_action == "inventory"):
		runScene("InventoryScene")
	if(_action == "tasks"):
		runScene("QuestLogScene")
	if(_action == "struggle"):
		runScene("StrugglingScene")
	if(_action == "me"):
		runScene("MeScene")

func isPetWalkies():
	return walkiesType == "walkies" && npc != null && npc.isSlaveToPlayer() && (npc.getNpcSlavery().getActivityID() == "Walkies")

func _onSceneEnd():
	if(npc == null || !npc.isSlaveToPlayer()):
		return
	
	if(npc.getNpcSlavery().getActivityID() == "Walkies"):
		npc.getNpcSlavery().stopActivity() # Stop pet walkies activity

func getSceneCompanions():
	return [npcID]

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["walkiesType"] = walkiesType

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
	walkiesType = SAVE.loadVar(data, "walkiesType", "")
	
func supportsShowingPawns() -> bool:
	return true
