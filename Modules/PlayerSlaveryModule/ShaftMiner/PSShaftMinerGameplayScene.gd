extends SceneBase

var npc1ID:String = ""
var npc2ID:String = ""

#var meow = 1
var genericInventoryScreenScene = preload("res://UI/Inventory/GenericInventoryScreen.tscn")
var nuggetButtons:Array = []

func _init():
	sceneID = "PSShaftMinerGameplayScene"

func _reactInit():
	GM.pc.setLocation("psmine_sleep")
	setState("roam")

func resolveCustomCharacterName(_charID):
	if(_charID == "npc1"):
		return npc1ID
	if(_charID == "npc2"):
		return npc2ID

func _run():
	var roomID:String = GM.pc.getLocation()
	
	if(state == ""):
		saynn("If you see this, something went wrong.")
	
	
	if(state == "roam"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		var _roomInfo = GM.world.getRoomByID(roomID)

		if(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness()):
			saynn(_roomInfo.getBlindDescription())
		else:
			saynn(_roomInfo.getDescription())
		
		var canMineInfo:Array = GM.main.PS.canMineSmart(roomID)
		var canMine:bool = canMineInfo[0]
		
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
		if(GM.main.PS.dudes.size() > 0):
			addButtonAt(7, "Idle", "Just idle around, letting other slaves work", "justIdle")
		
		if(GM.main.PS.canRefresh()):
			addButtonAt(13, "Refreshments", "Use the minecart's refreshments", "useRefresh")
		
		if(GM.main.PS.nuggetsCarrying > 0):
			if(GM.pc.getLocation() != GM.main.PS.LOC_ENTRANCE):
				addButtonAt(14, "Drop nuggets", "Drop all the nuggets that you are holding", "dropNuggets")
			else:
				addButton("Drop nuggets", "Drop all the nuggets that you are holding", "dropNuggets")
		
		
		if(GM.main.PS.pushingMinecart):
			if(GM.pc.getLocation() == GM.main.PS.LOC_ENTRANCE && GM.main.PS.nuggetsMinecart > 0):
				addButton("Unload minecart", "Unload the minecart and receive credits for all the ore nuggets.", "doUnloadMinecart")
			addButton("Stop pushing", "Stop pushing the minecart", "stoppush")
		
		if(canMine):
			if(GM.pc.getStamina() > 0):
				addButton("Mine!", "Start mining", "domine")
			else:
				addDisabledButton("Mine!", "You don't have any stamina to do this")
		else:
			if(canMineInfo[1] != ""):
				addDisabledButton("Mine!", canMineInfo[1])
			
		if(!GM.main.PS.pushingMinecart && GM.pc.getLocation() == GM.main.PS.minecartLoc):
			if(GM.main.PS.nuggetsCarrying > 0):
				if(GM.main.PS.canLoadMinecart()):
					addButton("Load minecart", "Put all the ore nuggets into the minecart", "doLoadMinecart")
				else:
					addDisabledButton("Load minecart", "The minecart is full!")
			addButton("Push minecart", "Start pushing the minecart", "startpush")
		
		if(!GM.main.PS.pushingMinecart && GM.main.PS.hasNuggetsIn(GM.pc.getLocation())):
			addButton("Pick up nuggets", "Start picking up the ore nuggets", "start_nuggets_picking")
		
		if(roomID == "psmine_entrance"):
			saynn("Upgrades unlocked: "+GM.main.PS.getUpgradesCompletionStr()+"")
			
			addButton("Upgrades", "See how you can upgrade your tools", "upgrades_menu")
		

		if(!GM.main.PS.pushingMinecart):
			if(GM.pc.getLocation() == GM.main.PS.LOC_CAGE):
				addButton("End day", "Sleep in the cage", "doSleep")
				if(GM.main.PS.hasUpgrade("rest")):
					addButton("Rest", "Rest in the cage for 2 hours and recover some stamina", "doRest")
				#else:
				#	addDisabledButton("Rest", "It's too late to rest")
				
				if(GM.main.PS.canHireDudes(1)):
					addButton("Hire helper", "Hire one of the other slaves to work with you", "hire1_pickslave")
				if(GM.main.PS.canHireDudes(2)):
					addButton("Hire 2 helpers", "Hire two slaves to work with you", "hire2_pickslave")
		
		if(!GM.main.PS.pushingMinecart):
			if(GM.pc.getLocation() == GM.main.PS.LOC_BOSS):
				if(GM.main.PS.didReachTarget()):
					addButton("Freedom!", "You have mined enough ore in order to leave!", "do_win")
				else:
					addDisabledButton("Freedom!", "You haven't mined enough ore in order to get your freedom..")
				
				addButtonAt(14, "Mine", "Do some mining here", "do_mine_boss")
		
		var theTexts:Array = GM.main.PS.getTextsForLocFinal(roomID)
		if(!theTexts.empty()):
			say(Util.join(theTexts, ""))
		
	if(state == "hire1_menu"):
		playAnimation(StageScene.Duo, "stand", {npc=npc1ID})
		
		saynn("You walk up to one of the slaves and offer them to work for you.")
		
		saynn("They agreed to work for you for a day.. but only if you let them fuck you!")
		
		sayn("Offer:")
		sayn("They receive: Your body.")
		saynn("You receive: Their help.")
		
		addButton("Agree", "Let them fuck you!", "hire1_sex")
		addButton("Cancel", "You changed your mind", "hire_cancel")
	
	if(state == "hire1_after_sex"):
		playAnimation(StageScene.Duo, "stand", {npc=npc1ID})
		
		saynn("What do you want them to do?")
		
		if(GM.main.PS.canHireDude(true)):
			addButton("Shaft miner", "They will do the mining", "hire1_pick_miner")
		else:
			addDisabledButton("Shaft miner", "You have too many of these already")
		if(GM.main.PS.canHireDude(false)):
			addButton("Ore carrier", "They will carry the ore", "hire1_pick_carrier")
		else:
			addDisabledButton("Ore carrier", "You have too many of these already")
	
	if(state == "hire2_menu"):
		playAnimation(StageScene.Duo, "stand", {pc=npc1ID, npc=npc2ID})
		
		saynn("You walk up to two of the slaves and offer them to work for you.")
		
		saynn("They agreed to work for you for a day.. but only if you let them fuck you.. at the same time!")
		
		sayn("Offer:")
		sayn("They receive: Your body.")
		saynn("You receive: Their help.")
		
		addButton("Agree", "Let them fuck you!", "hire2_sex")
		addButton("Cancel", "You changed your mind", "hire_cancel")
	
	if(state == "hire2_after_sex"):
		playAnimation(StageScene.Duo, "stand", {pc=npc1ID, npc=npc2ID})
		
		saynn("These two slaves will now work for you!")
		
		addButton("Continue", "Great news", "hire2_do")
		
#		if(GM.main.PS.canHireDude(true)):
#			addButton("Shaft miner", "They will do the mining", "hire2_pick_miner")
#		else:
#			addDisabledButton("Shaft miner", "You have too many of these already")
#		if(GM.main.PS.canHireDude(false)):
#			addButton("Ore carrier", "They will carry the ore", "hire2_pick_carrier")
#		else:
#			addDisabledButton("Ore carrier", "You have too many of these already")
	
	if(state == "hire2_2_after_sex"):
		playAnimation(StageScene.Duo, "stand", {npc=npc2ID})
		
		saynn("What do you want them to do?")
		
		if(GM.main.PS.canHireDude(true)):
			addButton("Shaft miner", "They will do the mining", "hire2_2_pick_miner")
		else:
			addDisabledButton("Shaft miner", "You have too many of these already")
		if(GM.main.PS.canHireDude(false)):
			addButton("Ore carrier", "They will carry the ore", "hire2_2_pick_carrier")
		else:
			addDisabledButton("Ore carrier", "You have too many of these already")
	
	if(state == "do_win"):
		saynn("YOU WON!")
		
		addButton("Leave", "Time to go", "stopMinigame")
		
	if(state == "pickup_screen"):
		var amountOfNuggets:int = GM.main.PS.getNuggetsAmmountIn(GM.pc.getLocation())
		saynn("There "+("is" if amountOfNuggets == 1 else "are")+" "+str(amountOfNuggets)+" "+("nugget" if amountOfNuggets == 1 else "nuggets")+" on the ground here!")
		
		for btnxIndx in nuggetButtons:
			addButtonAt(btnxIndx, "Nugget", "Pick up the nugget!", "doPickUpNugget", [btnxIndx])
		
		addButtonAt(14, "Enough picking up", "Stop picking up the nuggets", "roam")
		
	if(state == "doSleep"):
		saynn("Exhausted, you climb into the cage and find an empty spot, among all the other slaves, to tuck yourself into.")
		
		saynn("You basically have to sleep on the ground. Compared to this, even the prison's beds feel soft and cozy.")
		
		saynn("Eventually you manage to slip into the land of the dreams..")
		
		saynn("When the morning comes, the goons wake everyone up.")
		
		saynn("Welcome to the new day. You are still a slave, it's not a dream.")
		
		if(GM.main.PS.didReachTarget()):
			saynn("[b]You have reached the target that Ricky has set! Go meet him![/b]")
		
		addButton("Continue", "Time to work!", "roam")
	
	if(state == "timeToSleep"):
		saynn("It's way too late for any work.")
		
		saynn("One of the armed goons finds you and drags you off back to your cage.")
		
		addButton("End day", "Sleep in the cage", "doSleep")
	
	if(state == "first_offer_slave"):
		playAnimation(StageScene.Duo, "stand", {npc=npc1ID})
		
		saynn("One of the slaves calls you.")
		
		saynn("They say that they are willing to help with the mining.")
		
		saynn("..but only if you let them fuck you. Right here, right now.")
		
		addButton("Agree", "Let them fuck you!", "first_offer_sex")
		addButton("Nah", "Just keep going. You can do everything by yourself", "first_offer_deny")
	
	if(state == "first_offer_aftersex"):
		playAnimation(StageScene.Duo, "stand", {npc=npc1ID})
		
		saynn("The slave is gonna help you mine ore for one day!")
		
		addButton("Continue", "Time to go", "first_offer_spawn")
	
	if(state == "upgrades_menu"):
		#saynn("Upgrades ("+GM.main.PS.getUpgradesCompletionStr()+"):")
		
		#var upgradesCanSee:Array = GM.main.PS.getUpgradesCanSee()
		
		#for upgradeID in upgradesCanSee:
			
		
		var entries:Dictionary = {}
		
		for upgradeID in GM.main.PS.getUpgradesCanSee():
			var canUnlock:bool = GM.main.PS.canUnlockUpgrade(upgradeID)
			var upgradeInfo:Dictionary = GM.main.PS.UpgradesDB[upgradeID]
			
			entries[upgradeID] = {
				name = upgradeInfo["name"]+" ("+str(upgradeInfo["cost"])+" credits)",
				desc = upgradeInfo["desc"]+"\n\nCost: "+str(upgradeInfo["cost"])+" credits",
				actions = [["unlock", "Buy"]] if canUnlock else [],
			}
		
		if(!GM.main.PS.upgrades.empty()):
			entries["=placeholderbuy="] = {
				name = " === Unlocked Upgrades ===",
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
		inventory.setRightPanelStretchRation(1.25)
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
		doTurn()
		return

	if(_action == "doUnloadMinecart"):
		GM.main.PS.unloadMinecart()
		doTurn()
		return

	if(_action == "dropNuggets"):
		GM.main.PS.dropAllNuggets()
		doTurn()
		return

	if(_action == "doPickUpNugget"):
		var theIndx:int = _args[0]
		nuggetButtons.erase(theIndx)
		GM.main.PS.pickupNugget()
		
		var extraPickUp:int = GM.main.PS.getExtraPickupAmount()
		for _i in range(extraPickUp):
			if(!nuggetButtons.empty()):
				nuggetButtons.erase(RNG.pick(nuggetButtons))
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
		doTurn()
		return
	if(_action == "startpush"):
		GM.main.PS.pushingMinecart = true
		addMessage("You have started pushing the minecart!")
		return
	if(_action == "stoppush"):
		GM.main.PS.pushingMinecart = false
		addMessage("You have stopped pushing the minecart!")
		return

	if(_action == "justIdle"):
		doTurn()
		return

	if(_action == "go"):
		GM.main.PS.prevPCLoc = GM.pc.getLocation()
		playAnimation(StageScene.Solo, "walk")
		GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, _args[0]))
		#processTime(600)
		aimCameraAndSetLocName(GM.pc.location)
		#GM.ES.triggerReact(Trigger.EnteringRoom, [GM.pc.location, _args[1]])
		
		doTurn(true)
		GM.main.PS.prevPCLoc = GM.pc.getLocation()
		
		if(!GM.main.checkExtraScenes()):
			GM.main.showLog()
		
		if(GM.main.PS.shouldDoFirstSlaveOfferEvent()):
			npc1ID = genSlaveID()
			addCharacter(npc1ID)
			setState("first_offer_slave")
		
		return
	
	if(_action == "doSleep"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		GM.main.PS.sleep()
	
	if(_action == "do_win"):
		endScene()
		runScene("PSShaftMinerEnding1")
		return
	
	if(_action == "do_mine_boss"):
		if(!GM.main.PS.hasUpgrade("pick5")):
			addMessage("You try to hit the reinforced door but your current tool bounces right off.")
		else:
			endScene()
			runScene("PSShaftMinerEnding2")
		return
	
	if(_action == "hire1_pickslave"):
		npc1ID = genSlaveID()
		addCharacter(npc1ID)
		setState("hire1_menu")
		return
	if(_action == "hire2_pickslave"):
		npc1ID = genSlaveID()
		npc2ID = genSlaveID()
		addCharacter(npc1ID)
		addCharacter(npc2ID)
		setState("hire2_menu")
		return
	if(_action == "hire_cancel"):
		if(npc1ID != ""):
			npc1ID = ""
		if(npc2ID != ""):
			npc2ID = ""
		clearCharacter()
		setState("roam")
		return
	if(_action == "first_offer_deny"):
		npc1ID = ""
		npc2ID = ""
		clearCharacter()
		setState("roam")
		return
	if(_action == "first_offer_spawn"):
		npc1ID = ""
		clearCharacter()
		setState("roam")
		addMessage("You have hired a shaft miner slave for one day!")
		GM.main.PS.spawnDude(true)
		return
	if(_action == "first_offer_sex"):
		runScene("GenericSexScene", [npc1ID, "pc", SexType.DefaultSex, {SexMod.BondageDisabled: true}])
		setState("first_offer_aftersex")
		return
	if(_action == "hire1_sex"):
		runScene("GenericSexScene", [npc1ID, "pc", SexType.DefaultSex, {SexMod.BondageDisabled: true}])
		setState("hire1_after_sex")
		return
	if(_action == "hire2_sex"):
		runScene("GenericSexScene", [[npc1ID, npc2ID], "pc", SexType.DefaultSex, {SexMod.BondageDisabled: true}])
		setState("hire2_after_sex")
		return
	if(_action == "hire1_pick_miner"):
		npc1ID = ""
		clearCharacter()
		setState("roam")
		addMessage("You have hired a shaft miner slave for one day!")
		GM.main.PS.spawnDude(true)
		return
	if(_action == "hire1_pick_carrier"):
		npc1ID = ""
		clearCharacter()
		setState("roam")
		addMessage("You have hired an ore carrier slave for one day!")
		GM.main.PS.spawnDude(false)
		return
	if(_action == "hire2_pick_miner"):
		npc1ID = ""
		clearCharacter()
		setState("hire2_2_after_sex")
		addMessage("You have hired a shaft miner slave for one day!")
		GM.main.PS.spawnDude(true)
		return
	if(_action == "hire2_pick_carrier"):
		npc1ID = ""
		clearCharacter()
		setState("hire2_2_after_sex")
		addMessage("You have hired an ore carrier slave for one day!")
		GM.main.PS.spawnDude(false)
		return
	if(_action == "hire2_2_pick_miner"):
		npc2ID = ""
		clearCharacter()
		setState("roam")
		addMessage("You have hired a shaft miner slave for one day!")
		GM.main.PS.spawnDude(true)
		return
	if(_action == "hire2_2_pick_carrier"):
		npc2ID = ""
		clearCharacter()
		setState("roam")
		addMessage("You have hired an ore carrier slave for one day!")
		GM.main.PS.spawnDude(false)
		return
	if(_action == "hire2_do"):
		npc1ID = ""
		npc2ID = ""
		clearCharacter()
		setState("roam")
		addMessage("You have hired a shaft miner and an ore carrier slaves for one day!")
		GM.main.PS.spawnDude(true)
		GM.main.PS.spawnDude(false)
		return
	
	if(_action == "useRefresh"):
		GM.main.PS.doRefresh()
		return
	
	if(_action == "doRest"):
		processTime(60*60*2)
		GM.main.PS.useStamina(-50)
		for _i in range(12):
			doTurn()
		return
	
	setState(_action)

func doTurn(isMove:bool=false):
	processTime(600)
	if(isMove):
		GM.main.PS.afterMove()
	GM.main.PS.processTurn()
	GM.main.PS.updateLoc()
	
	sleepCheck()

func sleepCheck():
	if(GM.main.isVeryLate()):
		GM.pc.setLocation(GM.main.PS.LOC_CAGE)
		aimCameraAndSetLocName(GM.pc.getLocation())
		setState("timeToSleep")

func supportsShowingPawns() -> bool:
	return true

func genSlaveID() -> String:
	var theID:String = NakedSlaveGenerator.new().generate({NpcGen.Temporary: true}).getID()
	return theID

func saveData():
	var data = .saveData()

	data["nuggetButtons"] = nuggetButtons
	data["npc1ID"] = npc1ID

	return data

func loadData(data):
	.loadData(data)

	nuggetButtons = SAVE.loadVar(data, "nuggetButtons", [])
	npc1ID = SAVE.loadVar(data, "npc1ID", "")
