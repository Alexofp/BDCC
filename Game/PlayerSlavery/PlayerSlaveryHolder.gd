extends Reference
class_name PlayerSlaveryHolder

# This object always exists and holds slavery-related stuff

var storedCredits:int = 0
var endings:Dictionary = {}

# Returns IDs of slavery def objects that are possible
func getPossibleSlaveries(includeTrivial:bool = false) -> Array:
	var result:Array = []
	
	for slaveryID in GlobalRegistry.getPlayerSlaveryDefs():
		var playerSlaveryDef = GlobalRegistry.getPlayerSlaveryDef(slaveryID)
		if(!includeTrivial && playerSlaveryDef.isTrivial()):
			continue
		
		if(playerSlaveryDef.canBeChosen()):
			result.append(slaveryID)
	
	return result

func getPossibleSlaveriesAmount(includeTrivial:bool = false) -> int:
	return getPossibleSlaveries(includeTrivial).size()

func getRandomPossibleSlaveryID(includeTrivial:bool = false) -> String:
	var theSlaveries := getPossibleSlaveries(includeTrivial)
	
	if(theSlaveries.empty()):
		theSlaveries = getPossibleSlaveries(true)
		if(theSlaveries.empty()):
			return ""
	
	#TODO: Prefer to pick slaveries that weren't picked before
	#Maybe random is fine for now
	return RNG.pick(theSlaveries)

func storePlayersItems():
	storedCredits += GM.pc.getCredits()
	GM.pc.addCredits(-GM.pc.getCredits())
	transferAllItems(GM.pc, GlobalRegistry.getCharacter("PlayerSlaveryStash"), true)

func givePlayerItemsBack():
	GM.pc.addCredits(-GM.pc.getCredits())
	GM.pc.addCredits(storedCredits)
	storedCredits = 0
	transferAllItems(GlobalRegistry.getCharacter("PlayerSlaveryStash"), GM.pc)

func transferAllItems(_charFrom, _charTo, equippedToo:bool = false):
	if(!_charFrom || !_charTo):
		return
	var theItems:Array = _charFrom.getInventory().getItems()
	while(!theItems.empty()):
		var theItem = theItems[0]
		
		_charFrom.getInventory().removeItem(theItem)
		_charTo.getInventory().addItem(theItem)
	
	if(equippedToo):
		for slot in _charFrom.getInventory().getEquippedItems():
			var theItem:ItemBase = _charFrom.getInventory().getEquippedItem(slot)
			if(theItem.isImportant()):
				if(!theItem.hasTag(ItemTag.PortalPanties)): # Strip portal panties even though they're important
					continue
			_charFrom.getInventory().clearSlot(slot)
			_charTo.getInventory().addItem(theItem)
			
func hasUnlockedEnding(slaveryID:String, endingID:String) -> bool:
	if(!endings.has(slaveryID)):
		return false
	return endings[slaveryID].has(endingID)

func unlockEnding(slaveryID:String, endingID:String) -> bool:
	if(hasUnlockedEnding(slaveryID, endingID)):
		return false
	if(!getAllPossibleEndingsOf(slaveryID).has(endingID)):
		return false
	if(!endings.has(slaveryID)):
		endings[slaveryID] = [endingID]
	else:
		endings[slaveryID].append(endingID)
	return true

func unlockEndingGetMessage(slaveryID:String, endingID:String) -> String:
	var isAlreadyUnlocked:bool = hasUnlockedEnding(slaveryID, endingID)
	if(isAlreadyUnlocked):
		return ""
	if(!unlockEnding(slaveryID, endingID)):
		return ""
	var theTotalAmount:int = getAllPossibleEndingsOf(slaveryID).size()
	var theUnlockedAmount:int = getUnlockedEndingsAmountOf(slaveryID)
	var leftToUnlock:int = theTotalAmount - theUnlockedAmount
	var theInfo:Dictionary = getEndingInfo(slaveryID, endingID)
	if(!theInfo.has("name")):
		return ""
	var endingName:String = theInfo["name"]
	if(leftToUnlock <= 0):
		return "You have unlocked the '"+endingName+"' ending for this slavery scenario. You have now unlocked every single ending!"
	if(leftToUnlock == 1):
		return "You have unlocked the '"+endingName+"' ending for this slavery scenario. There is 1 other possible ending left!"
	return "You have unlocked the '"+endingName+"' ending for this slavery scenario. There are "+str(leftToUnlock)+" other possible endings left!"

func unlockEndingAddMessage(slaveryID:String, endingID:String):
	var theMessage := unlockEndingGetMessage(slaveryID, endingID)
	if(theMessage != ""):
		GM.main.addMessage(theMessage)

func getEndingInfo(slaveryID:String, endingID:String) -> Dictionary:
	var theSlaveryDef:PlayerSlaveryDef = GlobalRegistry.getPlayerSlaveryDef(slaveryID)
	if(!theSlaveryDef):
		return {}
	var theEndings:Dictionary = theSlaveryDef.getEndings()
	if(!theEndings.has(endingID)):
		return {}
	return theEndings[endingID]

func getAllPossibleEndingsOf(slaveryID:String) -> Array:
	var theSlaveryDef:PlayerSlaveryDef = GlobalRegistry.getPlayerSlaveryDef(slaveryID)
	if(!theSlaveryDef):
		return []
	return theSlaveryDef.getEndings().keys()

func getUnlockedEndingsAmountOf(slaveryID:String) -> int:
	if(!endings.has(slaveryID)):
		return 0
	var result:int = 0
	var allPossible := getAllPossibleEndingsOf(slaveryID)
	if(allPossible.empty()):
		return 0
	for theEndingID in allPossible:
		if(hasUnlockedEnding(slaveryID, theEndingID)):
			result += 1
	
	return result

func getEndingsInfo(includeDesc:bool = true) -> String:
	var result:Array = []
	for slaveryID in GlobalRegistry.getPlayerSlaveryDefs():
		var slaveryDef:PlayerSlaveryDef = GlobalRegistry.getPlayerSlaveryDef(slaveryID)
		var theEndings := slaveryDef.getEndings()
		if(theEndings.empty()):
			continue
		var unlockedAmount:int = getUnlockedEndingsAmountOf(slaveryID)
		result.append(slaveryDef.getVisibleName()+" ("+str(unlockedAmount)+"/"+str(theEndings.size())+"):")
		if(includeDesc):
			result.append(slaveryDef.getVisibleDesc())
		for endingID in theEndings:
			var endingInfo:Dictionary = theEndings[endingID]
			var endingName:String = endingInfo["name"] if endingInfo.has("name") else "Error?"
			var endingDesc:String = endingInfo["desc"] if endingInfo.has("desc") else "Error?"
			var isThisEndingUnlocked:bool = hasUnlockedEnding(slaveryID, endingID)
			
			if(isThisEndingUnlocked):
				result.append("- "+endingName+": "+endingDesc)
			else:
				result.append("LOCKED: "+endingDesc)
		result.append("")
		
	return Util.join(result, "\n")
	
func saveData() -> Dictionary:
	return {
		storedCredits = storedCredits,
		endings = endings,
	}

func loadData(_data:Dictionary):
	storedCredits = SAVE.loadVar(_data, "storedCredits", 0)
	endings = SAVE.loadVar(_data, "endings", {})
