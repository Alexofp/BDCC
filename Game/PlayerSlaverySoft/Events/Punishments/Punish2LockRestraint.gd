extends NpcOwnerEventBase

var pickedLock:String = ""

func _init():
	id = "Punish2LockRestraint"
	reactsToTags = [E_PUNISH_STRONG]
	eventWeight = 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var allPossible := getPossibleLocks()
	if(allPossible.empty()):
		return false
	
	pickedLock = RNG.pick(allPossible)
	
	var theItem:ItemBase
	
	if(pickedLock == "ringgag"):
		theItem = GlobalRegistry.createItem("ringgag")
	elif(pickedLock == "mittens"):
		theItem = GlobalRegistry.createItem("bondagemittens")
	elif(pickedLock == "arms"):
		theItem = GlobalRegistry.createItem("inmatewristcuffs")
	elif(pickedLock == "legs"):
		theItem = GlobalRegistry.createItem("inmateanklecuffs")
	elif(pickedLock == "cage"):
		theItem = GlobalRegistry.createItem("ChastityCage")
	elif(pickedLock == "cageflat"):
		theItem = GlobalRegistry.createItem("ChastityCageFlat")
	
	if(!theItem):
		return false
	
	if(theItem):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(theItem)
		theItem.addSmartLock(SmartLock.KeyholderLock, getOwner())
	
	var theNpcOwner := getNpcOwner()
	if(theNpcOwner):
		theNpcOwner.setMustHaveOwnerLock(true)
		theNpcOwner.keyholderSatisfaction *= 0.5
	
	return true

func getPossibleLocks() -> Array:
	var possible:Array = []
	if(!GM.pc.isMuzzled() && !GM.pc.isBitingBlocked() && !GM.pc.isGagged()):
		possible.append("ringgag")
	if(!GM.pc.hasBlockedHands()):
		possible.append("mittens")
	if(!GM.pc.hasBoundArms()):
		possible.append("arms")
	if(!GM.pc.hasBoundLegs()):
		possible.append("legs")
	if(!GM.pc.isWearingChastityCage() && GM.pc.hasReachablePenis()):
		possible.append("cage")
		possible.append("cageflat")
	
	return possible

func getLockNameDesc(_lock:String) -> Array:
	if(_lock == "ringgag"):
		return ["a Ring-gag", "Agree to be gagged"]
	if(_lock == "mittens"):
		return ["Mittens", "Agree to wear bondage mittens"]
	if(_lock == "arms"):
		return ["Wrist cuffs", "Agree to have your arms cuffed"]
	if(_lock == "legs"):
		return ["Ankle cuffs", "Agree to have your legs cuffed"]
	if(_lock == "cage"):
		return ["a Chastity cage", "Agree to have your cock caged"]
	if(_lock == "cageflat"):
		return ["a Flat chastity cage", "Agree to have your cock caged with a flat cage"]
	
	return ["ERROR?", "Something went wrong"]

func start():
	if(pickedLock in ["cage", "cageflat"]):
		playAnimation(StageScene.Duo, "hurt", {npc=getOwnerID(), bodyState={naked=true}})
	else:
		playAnimation(StageScene.Duo, "hurt", {npc=getOwnerID()})
	
	var theLockInfo := getLockNameDesc(pickedLock)
	saynn("{npc.name} forces [b]"+theLockInfo[0]+"[/b] onto you and locks it with a [b]key[/b] before putting it away.")
	talkModularOwnerToPC("SoftSlaveryPunishLockRestraint") # You fucked up. And now you will have to wear it.
	saynn("Looks like you must choose something..")
	talkModularOwnerToPC("SoftSlaveryPunishLockRestraint2") # If you dare to take it off before I allow you, I will have to punish you again.
	saynn("The restraint sits extremely tightly.. there is no easy way to unlock it without a key.")
	talkModularOwnerToPC("SoftSlaveryPunishLockRestraint3") # You are on some very thin ice right now, you really better start behaving now.
	
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["pickedLock"] = pickedLock
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	pickedLock = SAVE.loadVar(_data, "pickedLock", "")
