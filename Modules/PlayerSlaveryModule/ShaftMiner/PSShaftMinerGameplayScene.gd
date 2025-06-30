extends SceneBase

#var meow = 1
var genericInventoryScreenScene = preload("res://UI/Inventory/GenericInventoryScreen.tscn")
var nuggetButtons:Array = []

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
		
		if(GM.main.PS.nuggetsCarrying > 0):
			if(GM.pc.getLocation() != GM.main.PS.LOC_ENTRANCE):
				addButtonAt(14, "Drop nuggets", "Drop all the nuggets that you are holding", "dropNuggets")
			else:
				addButton("Drop nuggets", "Drop all the nuggets that you are holding", "dropNuggets")
		
		if(GM.main.PS.pushingMinecart):
			if(GM.pc.getLocation() == GM.main.PS.LOC_ENTRANCE && GM.main.PS.nuggetsMinecart > 0):
				addButton("Unload minecart", "Unload the minecart and receive credits for all the ore nuggets.", "doUnloadMinecart")
			addButton("Stop pushing", "Stop pushing the minecart", "stoppush")
		elif(!GM.main.PS.pushingMinecart && GM.main.PS.canMine()):
			if(GM.pc.getStamina() > 0):
				addButton("Mine!", "Start mining", "domine")
			else:
				addDisabledButton("Mine!", "You don't have any stamina to do this")
		if(!GM.main.PS.pushingMinecart && GM.pc.getLocation() == GM.main.PS.minecartLoc):
			if(GM.main.PS.nuggetsCarrying > 0):
				addButton("Load minecart", "Put all the ore nuggets into the minecart", "doLoadMinecart")
			addButton("Push minecart", "Start pushing the minecart", "startpush")
		
		if(!GM.main.PS.pushingMinecart && GM.main.PS.hasNuggetsIn(GM.pc.getLocation())):
			addButton("Pick up nuggets", "Start picking up the ore nuggets", "start_nuggets_picking")
		
		if(roomID == "psmine_entrance"):
			saynn("Upgrades unlocked: "+GM.main.PS.getUpgradesCompletionStr()+"")
			
			addButton("Upgrades", "See how you can upgrade your tools", "upgrades_menu")
		
		if(GM.main.PS.pushingMinecart):
			if(GM.main.PS.nuggetsMinecart <= 0):
				saynn("You are pushing an empty cart.")
			else:
				saynn("You are pushing a minecart that has "+str(GM.main.PS.nuggetsMinecart)+" ore "+("nugget" if GM.main.PS.nuggetsMinecart == 1 else "nuggets")+" in it.")
		elif(GM.pc.getLocation() == GM.main.PS.minecartLoc):
			if(GM.main.PS.nuggetsMinecart <= 0):
				saynn("You are standing near an empty cart.")
			else:
				saynn("You are standing near a minecart that has "+str(GM.main.PS.nuggetsMinecart)+" ore "+("nugget" if GM.main.PS.nuggetsMinecart == 1 else "nuggets")+" in it.")
		
	if(state == "pickup_screen"):
		var amountOfNuggets:int = GM.main.PS.getNuggetsAmmountIn(GM.pc.getLocation())
		saynn("There "+("is" if amountOfNuggets == 1 else "are")+" "+str(amountOfNuggets)+" "+("nugget" if amountOfNuggets == 1 else "nuggets")+" on the ground here!")
		
		for btnxIndx in nuggetButtons:
			addButtonAt(btnxIndx, "Nugget", "Pick up the nugget!", "doPickUpNugget", [btnxIndx])
		
		addButtonAt(14, "Enough picking up", "Stop picking up the nuggets", "roam")
		
		
		
	if(state == "upgrades_menu"):
		#saynn("Upgrades ("+GM.main.PS.getUpgradesCompletionStr()+"):")
		
		#var upgradesCanSee:Array = GM.main.PS.getUpgradesCanSee()
		
		#for upgradeID in upgradesCanSee:
			
		
		var entries:Dictionary = {}
		
		for upgradeID in GM.main.PS.getUpgradesCanSee():
			var canUnlock:bool = GM.main.PS.canUnlockUpgrade(upgradeID)
			var upgradeInfo:Dictionary = GM.main.PS.UpgradesDB[upgradeID]
			
			entries[upgradeID] = {
				name = upgradeInfo["name"],
				desc = upgradeInfo["desc"]+"\n\nCost: "+str(upgradeInfo["cost"])+" credits",
				actions = [["unlock", "Buy"]] if canUnlock else [],
			}
		
		if(!GM.main.PS.upgrades.empty()):
			entries["=placeholderbuy="] = {
				name = "= Unlocked Upgrades =",
				desc = "A list of what you have upgraded.",
			}
			for upgradeID in GM.main.PS.upgrades:
				var upgradeInfo:Dictionary = GM.main.PS.UpgradesDB[upgradeID]
				entries[upgradeID] = {
					name = upgradeInfo["name"],
					desc = upgradeInfo["desc"]+"\n\nCost: "+str(upgradeInfo["cost"])+" credits",
				}
		
		var inventory = genericInventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		inventory.setRightPanelStretchRation(0.75)
		inventory.setEntries(entries)
		var _ok = inventory.connect("onInteractWith", self, "onMakeInteract")
		
		addButton("Back", "Enough browsing", "roam")

func onMakeInteract(_upgradeID:String, _id, _args):
	GM.main.pickOption("doBuyUpgrade", [_upgradeID])

func calcNuggetButtons():
	nuggetButtons = []
	
	var amountOfNuggets:int = GM.main.PS.getNuggetsAmmountIn(GM.pc.getLocation())
	
	var maxNuggets:int = Util.mini(10, amountOfNuggets)
	var theButtonIDs:Array = range(14)
	theButtonIDs.shuffle()
	
	while(maxNuggets > 0):
		nuggetButtons.append(theButtonIDs.back())
		theButtonIDs.pop_back()
		
		maxNuggets -= 1

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doLoadMinecart"):
		GM.main.PS.loadMinecartFromPC()
		return

	if(_action == "doUnloadMinecart"):
		GM.main.PS.unloadMinecart()
		return

	if(_action == "dropNuggets"):
		GM.main.PS.dropAllNuggets()
		return

	if(_action == "doPickUpNugget"):
		var theIndx:int = _args[0]
		nuggetButtons.erase(theIndx)
		GM.main.PS.pickupNugget()
		
		var amountOfNuggets:int = GM.main.PS.getNuggetsAmmountIn(GM.pc.getLocation())
		if(amountOfNuggets <= 0):
			setState("roam")
			return
		
		if(nuggetButtons.empty()):
			calcNuggetButtons()
		return

	if(_action == "start_nuggets_picking"):
		calcNuggetButtons()
		
		setState("pickup_screen")
		return

	if(_action == "doBuyUpgrade"):
		GM.main.PS.payUnlockUpgrade(_args[0])
		return

	if(_action == "domine"):
		GM.main.PS.doMine()
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
		
		GM.main.PS.processTurn()
		GM.main.PS.updateLoc()
		GM.main.PS.afterMove()
		
		if(!GM.main.checkTFs()):
			GM.main.showLog()
		return

	setState(_action)

func supportsShowingPawns() -> bool:
	return true

func saveData():
	var data = .saveData()

	data["nuggetButtons"] = nuggetButtons

	return data

func loadData(data):
	.loadData(data)

	nuggetButtons = SAVE.loadVar(data, "nuggetButtons", [])
