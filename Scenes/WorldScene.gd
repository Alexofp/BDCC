extends SceneBase

func _init():
	sceneID = "WorldScene"

func _run():
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
	
	if(GM.pc.getInventory().hasRemovableRestraints()):
		addButtonAt(8, "Struggle", "Struggle against your restraints", "struggle")
	addButtonAt(9, "Me", "Shows actions related to you and also your personal information", "me")
	addButtonAt(13, "Tasks", "Look at your tasks", "tasks")
	addButtonAt(14, "Inventory", "Look at your inventory", "inventory")
	#addButtonAt(5, "Sex Test", "Sex test", "sextest")
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
		processTime(30)
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
		#runScene("GenericSexScene", ["rahi", "pc", SexType.SlutwallSex])
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("BreastPump"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("BreastPumpAdvanced"))
		runScene("GenericSexScene", ["pc", "rahi"])
		#runScene("GenericSexScene", ["rahi", "pc"])
		#runScene("GenericSexScene", ["nova", "pc"])
		#runScene("GenericSexScene", ["pc", "nova"])
		#if(RNG.chance(50)):
		#	runScene("GenericSexScene", ["nova", "pc"])
		#else:
		#	runScene("GenericSexScene", ["pc", "nova"])
	
	if(_action == "comptest"):
		runScene("ComputerSimScene", ["TaviEngineeringComputer"])
	if(_action == "comptest2"):
		runScene("ComputerSimScene", ["TaviEngineeringSafeComputer"])
	if(_action == "overridetest"):
		runScene("PCOverrideExample")
	if(_action == "masochismminigame"):
		runScene("TaviMasochismScene")
