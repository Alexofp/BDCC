extends SceneBase

#var meow = 1

func _init():
	sceneID = "PSShaftMinerGameplayScene"

func _reactInit():
	GM.pc.setLocation("psmine_sleep")
	setState("roam")

func _run():
	var roomID:String = GM.pc.getLocation()
	
	if(state == ""):
		saynn("meow")
	
	
	if(state == "roam"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		saynn("You are roaming around.")
		

		
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

		if(GM.main.PS.pushingMinecart):
			addButton("Stop pushing", "Stop pushing the minecart", "stoppush")
		elif(!GM.main.PS.pushingMinecart && GM.main.PS.canMine()):
			addButton("Mine!", "Start mining", "domine")
		elif(GM.pc.getLocation() == GM.main.PS.minecartLoc):
			addButton("Push minecart", "Start pushing the minecart", "startpush")
			
		
			


			

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "domine"):
		GM.main.PS.doMine()
		addMessage("You did some mining!")
		return
	if(_action == "startpush"):
		GM.main.PS.pushingMinecart = true
		addMessage("You have started pushing the minecart!")
		return
	if(_action == "stoppush"):
		GM.main.PS.pushingMinecart = false
		addMessage("You have stopped pushing the minecart!")
		return

	if(_action == "go"):
		playAnimation(StageScene.Solo, "walk")
		GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, _args[0]))
		processTime((30 if !GM.pc.hasBoundLegs() else 60))
		aimCamera(GM.pc.location)
		#GM.ES.triggerReact(Trigger.EnteringRoom, [GM.pc.location, _args[1]])
		
		GM.main.PS.onStep()
		GM.main.PS.updateLoc()
		
		if(!GM.main.checkTFs()):
			GM.main.showLog()
		return

	setState(_action)

func supportsShowingPawns() -> bool:
	return true

func saveData():
	var data = .saveData()

	#data["meow"] = meow

	return data

func loadData(data):
	.loadData(data)

	#meow = SAVE.loadVar(data, "meow", 1)
