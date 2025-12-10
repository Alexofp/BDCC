extends SceneBase

func _init():
	sceneID = "PSTentaclesWalker"

func _run():
	var tentacles = GM.main.PS
	
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("WALKING AROUND!")
		

		var roomID:String = GM.pc.location
		var _roomInfo = GM.world.getRoomByID(roomID)
		aimCameraAndSetLocName(roomID)

		var theText:String = tentacles.getText(roomID)
		if(!theText.empty()):
			saynn(theText)

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
		
		var theActions:Array = tentacles.getActions(roomID)
		for actionEntry in theActions:
			addButton(actionEntry[0], actionEntry[1], "doAction", actionEntry)
		

func _react(_action: String, _args):
	var tentacles = GM.main.PS
	
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "go"):
		playAnimation(StageScene.Solo, "walk")
		GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, _args[0]))
		processTime((30 if !GM.pc.hasBoundLegs() else 60))
		aimCameraAndSetLocName(GM.pc.location)
		#GM.ES.triggerReact(Trigger.EnteringRoom, [GM.pc.location, _args[1]])
		
		var eventInfo:Array = tentacles.checkEvent(self, GM.pc.getLocation())
		if(!eventInfo.empty()):
			runScene(eventInfo[0], eventInfo[1] if eventInfo.size() > 1 else [])
			return
		
		if(!GM.main.checkTFs()):
			GM.main.showLog()
		return
	if(_action == "doAction"):
		tentacles.doAction(self, _args)
		return

	setState(_action)
