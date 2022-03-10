extends SceneBase

func _init():
	sceneID = "WorldScene"

func _run():
	var roomID = GM.pc.location
	var _roomInfo = GM.world.getRoomByID(roomID)
	
	aimCamera(roomID)
	setLocationName(_roomInfo.getName())
	
	#say("Meow\n")
	#say(_roomInfo.getDescription())

	if(GM.world.canGoID(roomID, GameWorld.Direction.NORTH)):
		addButtonAt(6, "North", "Go north", "gonorth")
	else:
		addDisabledButtonAt(6, "North", "Can't go north")
		
	if(GM.world.canGoID(roomID, GameWorld.Direction.WEST)):
		addButtonAt(10, "West", "Go west", "gowest")
	else:
		addDisabledButtonAt(10, "West", "Can't go west")
		
	if(GM.world.canGoID(roomID, GameWorld.Direction.SOUTH)):
		addButtonAt(11, "South", "Go south", "gosouth")
	else:
		addDisabledButtonAt(11, "South", "Can't go south")
	
	if(GM.world.canGoID(roomID, GameWorld.Direction.EAST)):
		addButtonAt(12, "East", "Go east", "goeast")
	else:
		addDisabledButtonAt(12, "East", "Can't go east")
	#addDisabledButton("bark", "no awo")
	
	addButtonAt(13, "Tasks", "Look at your tasks", "tasks")
	addButtonAt(14, "Inventory", "Look at your inventory", "inventory")
	
	if(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness()):
		saynn(_roomInfo.getBlindDescription())
	else:
		saynn(_roomInfo.getDescription())
	_roomInfo._onEnter()

func _react(_action: String, _args):
	print(_action)
	
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
	
	if(_action == "gonorth"):
		GM.pc.playAnimation(TheStage.Walking)
		GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, GameWorld.Direction.NORTH))
		processTime(30)
		aimCamera(GM.pc.location)
		GM.ES.trigger(Trigger.EnteringRoom, GM.pc.location)
	if(_action == "gowest"):
		GM.pc.playAnimation(TheStage.Walking)
		GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, GameWorld.Direction.WEST))
		processTime(30)
		aimCamera(GM.pc.location)
		GM.ES.trigger(Trigger.EnteringRoom, GM.pc.location)
	if(_action == "gosouth"):
		GM.pc.playAnimation(TheStage.Walking)
		GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, GameWorld.Direction.SOUTH))
		processTime(30)
		aimCamera(GM.pc.location)
		GM.ES.trigger(Trigger.EnteringRoom, GM.pc.location)
	if(_action == "goeast"):
		GM.pc.playAnimation(TheStage.Walking)
		GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, GameWorld.Direction.EAST))
		processTime(30)
		aimCamera(GM.pc.location)
		GM.ES.trigger(Trigger.EnteringRoom, GM.pc.location)
	if(_action == "inventory"):
		runScene("InventoryScene")
	if(_action == "tasks"):
		runScene("QuestLogScene")

func _react_scene_end(_tag, _result):
	GM.ES.triggerOnlyDelayed(Trigger.EnteringRoom, GM.pc.location)
	setState("")
