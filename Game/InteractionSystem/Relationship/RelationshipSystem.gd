extends Reference
class_name RelationshipSystem

var entries: Dictionary = {}
var special: Dictionary = {}
var cooldowns:Dictionary = {} # cooldowns[special][charID] = X days

func clearRelationships():
	entries.clear()

func onNewDay():
	for charID in special:
		special[charID].onNewDay()
	
	for specialID in cooldowns:
		var theCooldowns:Dictionary = cooldowns[specialID]
		var toRemove:Array = []
		for charID in theCooldowns:
			theCooldowns[charID] -= 1
			if(theCooldowns[charID] <= 0):
				toRemove.append(charID)
		for charID in toRemove:
			theCooldowns.erase(charID)

func hoursPassed(_howMany:int):
	decayRelationships(_howMany)
	for charID in special:
		special[charID].hoursPassed(_howMany)

func decayRelationships(hoursPassed:int):
	var rem:float = float(hoursPassed) * 0.0005
	
	var toRemove:Array = []
	var checkedEntries := {}
	
	for charID in entries:
		for char2ID in entries[charID]:
			var entry:RelationshipEntry = entries[charID][char2ID]
			if(checkedEntries.has(entry)):
				continue
			checkedEntries[entry] = true
			
			if(abs(entry.affection) <= rem):
				entry.affection = 0.0
			else:
				entry.affection -= sign(entry.affection) * rem
			
			if(abs(entry.lust) <= rem):
				entry.lust = 0.0
			else:
				entry.lust -= sign(entry.lust) * rem
			
			if(entry.shouldBeRemoved()):
				toRemove.append([charID, char2ID])
	for pair in toRemove:
		removeEntry(pair[0], pair[1])

func getEntry(char1:String, char2:String) -> RelationshipEntry:
	assert(char1 != char2)
	if(!entries.has(char1)):
		 entries[char1] = {}
	if(!entries.has(char2)):
		 entries[char2] = {}
	if(entries[char1].has(char2)):
		return entries[char1][char2]
	if(entries[char2].has(char1)):
		return entries[char2][char1]
	
	var theEntry := RelationshipEntry.new()
	entries[char1][char2] = theEntry
	entries[char2][char1] = theEntry
	return theEntry

func hasEntry(char1:String, char2:String) -> bool:
	if(!entries.has(char1)):
		 return false
	return entries[char1].has(char2)

func removeEntry(char1:String, char2:String):
	if(entries.has(char1)):
		entries[char1].erase(char2)
	if(entries.has(char2)):
		entries[char2].erase(char1)

func checkRemoveEntry(char1:String, char2:String):
	if(!hasEntry(char1, char2)):
		return false
	var theEntry := getEntry(char1, char2)
	if(theEntry.shouldBeRemoved()):
		removeEntry(char1, char2)
		return true
	return false

func getAffection(char1:String, char2:String) -> float:
	if(!hasEntry(char1, char2)):
		return 0.0
	return getEntry(char1, char2).affection

func getLust(char1:String, char2:String) -> float:
	if(!hasEntry(char1, char2)):
		return 0.0
	return getEntry(char1, char2).lust

func setAffection(char1:String, char2:String, newValue:float, showMessage:bool = false, showPCMessage:bool = true):
	newValue = clamp(newValue, -1.0, 1.0)
	var currentVal:float = getAffection(char1, char2)
	
	var diff:float = newValue - currentVal
	
	addAffection(char1, char2, diff, showMessage, showPCMessage)

func setLust(char1:String, char2:String, newValue:float, showMessage:bool = false, showPCMessage:bool = true):
	newValue = clamp(newValue, 0.0, 1.0)
	var currentVal:float = getLust(char1, char2)
	
	var diff:float = newValue - currentVal
	
	addLust(char1, char2, diff, showMessage, showPCMessage)

func addAffection(char1:String, char2:String, howMuch:float, showMessage:bool = false, showPCMessage:bool = true):
	var theEntry := getEntry(char1, char2)
	
	var oldAff:float = theEntry.affection
	theEntry.affection += howMuch
	theEntry.affection = clamp(theEntry.affection, -1.0, 1.0)
	
	var diff:float = theEntry.affection - oldAff
	
	if(showMessage || showPCMessage):
		if(char2 == "pc"): # Swap them out so PC is always first
			char2 = char1
			char1 = "pc"
		var char2Obj = GlobalRegistry.getCharacter(char2)
		var char1Obj = GlobalRegistry.getCharacter(char1)
		var char2Name = char2Obj.getName() if char2Obj != null else "BAD_CHAR_ID"
		var char1Name = char1Obj.getName() if char1Obj != null else "BAD_CHAR_ID"
		var affStr:String = str(Util.roundF(theEntry.affection*100.0, 1))
		var oldStr:String = str(Util.roundF(oldAff*100.0, 1))
		
		var isPC:bool = ((char1 == "pc") || (char2 == "pc"))
		var isSpied:bool = (GM.main.isPawnIDBeingSpied(char1) || GM.main.isPawnIDBeingSpied(char2))
		if(isSpied && showPCMessage):
			showMessage = true
		
		if(diff > 0.0):
			if(isPC):
				if(showPCMessage):
					GM.main.addMessage(char2Name+"'s affection towards you has increased from "+oldStr+"% to "+affStr+"%")
			else:
				if(showMessage):
					GM.main.addMessage("Affection between "+char1Name+" and "+char2Name+" has increased from "+oldStr+"% to "+affStr+"%")
		if(diff < 0.0):
			if(isPC):
				if(showPCMessage):
					GM.main.addMessage(char2Name+"'s affection towards you has decreased from "+oldStr+"% to "+affStr+"%")
			else:
				if(showMessage):
					GM.main.addMessage("Affection between "+char1Name+" and "+char2Name+" has decreased from "+oldStr+"% to "+affStr+"%")
	checkRemoveEntry(char1, char2)

func addLust(char1:String, char2:String, howMuch:float, showMessage:bool = false, showPCMessage:bool = true):
	var theEntry := getEntry(char1, char2)
	
	var oldAff:float = theEntry.lust
	theEntry.lust += howMuch
	theEntry.lust = clamp(theEntry.lust, 0.0, 1.0)
	
	var diff:float = theEntry.lust - oldAff
	
	if(showMessage || showPCMessage):
		if(char2 == "pc"): # Swap them out so PC is always first
			char2 = char1
			char1 = "pc"
		var char2Obj = GlobalRegistry.getCharacter(char2)
		var char1Obj = GlobalRegistry.getCharacter(char1)
		var char2Name = char2Obj.getName() if char2Obj != null else "BAD_CHAR_ID"
		var char1Name = char1Obj.getName() if char1Obj != null else "BAD_CHAR_ID"
		var affStr:String = str(Util.roundF(theEntry.lust*100.0, 1))
		var oldStr:String = str(Util.roundF(oldAff*100.0, 1))
		
		var isPC:bool = ((char1 == "pc") || (char2 == "pc"))
		var isSpied:bool = (GM.main.isPawnIDBeingSpied(char1) || GM.main.isPawnIDBeingSpied(char2))
		if(isSpied && showPCMessage):
			showMessage = true
		if(diff > 0.0):
			if(isPC):
				if(showPCMessage):
					GM.main.addMessage(char2Name+"'s lust towards you has increased from "+oldStr+"% to "+affStr+"%")
			else:
				if(showMessage):
					GM.main.addMessage("Lust between "+char1Name+" and "+char2Name+" has increased from "+oldStr+"% to "+affStr+"%")
		if(diff < 0.0):
			if(isPC):
				if(showPCMessage):
					GM.main.addMessage(char2Name+"'s lust towards you has decreased from "+oldStr+"% to "+affStr+"%")
			else:
				if(showMessage):
					GM.main.addMessage("Lust between "+char1Name+" and "+char2Name+" has decreased from "+oldStr+"% to "+affStr+"%")
	checkRemoveEntry(char1, char2)

func removeAllEntriesOf(char1:String):
	if(!entries.has(char1)):
		return
	var toRemove := []
	
	for otherCharID in entries[char1]:
		toRemove.append(otherCharID)
	
	for otherCharID in toRemove:
		removeEntry(char1, otherCharID)

func onCharDelete(_char1:String):
	removeAllEntriesOf(_char1)
	if(special.has(_char1)):
		special.erase(_char1)
	for shipID in cooldowns:
		if(cooldowns[shipID].has(_char1)):
			cooldowns[shipID].eraase(_char1)

func sendSocialEvent(_charActor:String, _charTarget:String, _eventID:int, _args:Array = []):
	if(_charActor != "pc" && _charTarget != "pc"):
		return false
	if(_charActor == "pc" && _charTarget == "pc"):
		return false
	
	var theNpcID:String = _charActor if _charTarget == "pc" else _charTarget
	if(special.has(theNpcID)):
		special[theNpcID].onSocialEvent(_charActor, _charTarget, _eventID, _args)
	else:
		# There maybe should be a priority system here
		for shipID in GlobalRegistry.getSpecialRelationships():
			var theShipRef:SpecialRelationshipBase = GlobalRegistry.getSpecialRelationshipRef(shipID)
			
			theShipRef.charID = theNpcID # Hack but makes things so much easier
			
			var theShouldData:Array = theShipRef.checkSocialEventShouldStartTarget(_charActor, _charTarget, _eventID, _args) if _charActor == "pc" else theShipRef.checkSocialEventShouldStartActor(_charActor, _charTarget, _eventID, _args)
			if(theShouldData[0]):
				if(hasSpecialRelationshipCooldown(shipID, theNpcID)):
					halfSpecialRelationshipCooldown(shipID, theNpcID)
				else:
					startSpecialRelantionship(shipID, theNpcID, theShouldData[1] if theShouldData.size() > 1 else [])
					return true
	return false
				
func startSpecialRelantionship(_relationshipID:String, _charID:String, _args:Array = []):
	if(_charID == "pc"): # Player can't have a special relantionship with themselves
		return
	var theChar:BaseCharacter = GlobalRegistry.getCharacter(_charID)
	if(!theChar || !theChar.isDynamicCharacter()):
		return
	if(theChar.getNpcSlavery()): # player's slaves can't be nemesis
		return
	var newShip = GlobalRegistry.createSpecialRelationship(_relationshipID)
	if(!newShip):
		return
	newShip.charID = _charID
	
	if(special.has(_charID)):
		special[_charID].onEnd()
	special[_charID] = newShip
	newShip.onStart(_args)

func hasSpecialRelationship(_charID:String) -> bool:
	return special.has(_charID)

func getSpecialRelationship(_charID:String):
	if(!hasSpecialRelationship(_charID)):
		return null
	return special[_charID]

func getAllSpecialOfType(_shipID:String) -> Array:
	var result:Array = []
	for charID in special:
		if(special[charID] == _shipID):
			result.append(special[charID])
	return result

func getSpecialTextAndColor(_charID:String) -> Array:
	if(!hasSpecialRelationship(_charID)):
		return []
	var theShip = special[_charID]
	return [theShip.getCategoryName(), theShip.getCategoryColor()]

func stopSpecialRelationship(_charID:String, callOnEnd:bool = true, addCooldown:bool = true):
	if(!hasSpecialRelationship(_charID)):
		return
	if(callOnEnd):
		special[_charID].onEnd()
	if(addCooldown):
		setSpecialRelationshipCooldown(special[_charID].id, _charID, special[_charID].getCooldown())
	special.erase(_charID)

func onGettingEnslavedByPlayer(_charID:String):
	stopSpecialRelationship(_charID)

func setSpecialRelationshipCooldown(_shipID:String, _charID:String, _days:int):
	if(!cooldowns.has(_shipID)):
		cooldowns[_shipID] = {}
	if(_days > 0):
		cooldowns[_shipID][_charID] = _days
	else:
		if(cooldowns[_shipID].has(_charID)):
			cooldowns[_shipID].erase(_charID)

func hasSpecialRelationshipCooldown(_shipID:String, _charID:String) -> bool:
	if(!cooldowns.has(_shipID)):
		return false
	return cooldowns[_shipID].has(_charID)

func halfSpecialRelationshipCooldown(_shipID:String, _charID:String):
	if(!hasSpecialRelationshipCooldown(_shipID, _charID)):
		return
	var currentAmount:int = cooldowns[_shipID][_charID]
	currentAmount /= 2
	if(currentAmount <= 0):
		cooldowns[_shipID].erase(_charID)
	else:
		cooldowns[_shipID][_charID] = currentAmount

func saveData():
	var specialData:Array = []
	for charID in special:
		specialData.append(special[charID].saveData())
	
	var entriesData:Array = []
	var checkedEntries:Dictionary = {}
	
	for charID in entries:
		for char2ID in entries[charID]:
			var entry:RelationshipEntry = entries[charID][char2ID]
			if(checkedEntries.has(entry)):
				continue
			checkedEntries[entry] = true
			
			entriesData.append({
				c1 = charID,
				c2 = char2ID,
				data = entry.saveData(),
			})
	
	return {
		"entries": entriesData,
		"special": specialData,
		"cooldowns": cooldowns,
	}

func loadData(_data):
	entries.clear()
	
	var entriesData = SAVE.loadVar(_data, "entries", [])
	for dataEntry in entriesData:
		if(!dataEntry.has("c1") || !dataEntry.has("c2")):
			continue
		var c1 = SAVE.loadVar(dataEntry, "c1", "")
		var c2 = SAVE.loadVar(dataEntry, "c2", "")
		
		var entry:RelationshipEntry = RelationshipEntry.new()
		entry.loadData(SAVE.loadVar(dataEntry, "data", {}))
		
		if(!entries.has(c1)):
			entries[c1] = {}
		if(!entries.has(c2)):
			entries[c2] = {}
		entries[c1][c2] = entry
		entries[c2][c1] = entry
	
	special.clear()
	
	var specialData = SAVE.loadVar(_data, "special", [])
	for specialEntry in specialData:
		var theID:String = specialEntry["id"] if specialEntry.has("id") else ""
		if(theID == ""):
			continue
		var theShip = GlobalRegistry.createSpecialRelationship(theID)
		if(!theShip):
			continue
		theShip.loadData(specialEntry)
		special[theShip.charID] = theShip
	
	cooldowns = SAVE.loadVar(_data, "cooldowns", {})
