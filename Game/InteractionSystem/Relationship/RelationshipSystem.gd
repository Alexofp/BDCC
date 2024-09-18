extends Reference
class_name RelationshipSystem

var entries: Dictionary = {}

func clearRelationships():
	entries.clear()

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
		var char2Name = GlobalRegistry.getCharacter(char2).getName()
		var char1Name = GlobalRegistry.getCharacter(char1).getName()
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
		var char2Name = GlobalRegistry.getCharacter(char2).getName()
		var char1Name = GlobalRegistry.getCharacter(char1).getName()
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

func saveData():
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
