extends Reference
class_name LustCombatState

var character: WeakRef
var inBattle = false

var currentActivities = []

func getCharacter():
	if(character == null):
		return character
	return character.get_ref()

func setCharacter(newchar):
	character = weakref(newchar)
	
func getActions():
	var result = []
	
#	result.append({id="GropeChest"})
#	result.append({id="GropeButt"})
#	result.append({id="RubNipples"})
#	result.append({id="StopAll"})
	for actionID in GlobalRegistry.getDefaultLustActions():
		result.append({id=actionID})
	
	if(getCharacter() != null):
		var pc = getCharacter()
		var items = pc.getInventory().getAllEquippedItems()
		for itemSlot in items:
			var item:ItemBase = items[itemSlot]
			var newActions = item.getLustActions()
			if(newActions != null):
				for newAction in newActions:
					result.append({
						"id": newAction,
						"item": item.getUniqueID(),
						"itemName": item.getVisibleName(),
						"itemState": item.getItemState(),
					})
	
	return result
	
func isInBattle():
	return inBattle

func enteredBattle():
	inBattle = true

func exitedBattle():
	inBattle = false
	
	resetState()

func isInPublic():
	return true

func resetState():
	stopActivities()
	if(getCharacter() != null):
		var pc = getCharacter()
		var items = pc.getInventory().getAllEquippedItems()
		for itemSlot in items:
			var item:ItemBase = items[itemSlot]
			item.resetLustState()

func isInventorySlotBlocked(invslot):
	if(getCharacter() != null):
		var pc = getCharacter()
		var items = pc.getInventory().getAllEquippedItems()
		for itemSlot in items:
			var item:ItemBase = items[itemSlot]
			var itemState = item.getItemState()
			if(itemState != null && (invslot in itemState.blocksInventorySlots())):
				return true
	return false

func startActivity(newActivity):
	if(!currentActivities.has(newActivity)):
		currentActivities.append(newActivity)

func replaceActivity(oldActivity, newActivity):
	if(currentActivities.has(oldActivity)):
		currentActivities.erase(oldActivity)
		
		currentActivities.append(newActivity)

func canStartNewActivity(newActivity):
	if(currentActivities.has(newActivity)):
		return false
	if(currentActivities.size() >= 2):
		return false
		
	return true

func canDoAction():
	return canStartNewActivity("")

func isDoingActivity(newActivity):
	if(currentActivities.has(newActivity)):
		return true
	return false

func canStopActivities():
	if(currentActivities.size() > 0):
		return true
	return false

func stopActivities():
	currentActivities.clear()

func getActivitiesAsText():
	var result = []
	
	for activity in currentActivities:
		if(activity == LustActivity.GropingButt):
			result.append("{attacker.name}'s hand is groping {attacker.his} butt")
		if(activity == LustActivity.GropingChest):
			result.append("{attacker.name}'s hand is groping {attacker.his} tits")
		if(activity == LustActivity.RubbingPussy):
			result.append("{attacker.name}'s hand is rubbing {attacker.his} pussy")
		if(activity == LustActivity.SpreadingPussy):
			result.append("{attacker.name}'s hand is spreading {attacker.his} pussy open")
		if(activity == LustActivity.StrokingCock):
			result.append("{attacker.name}'s hand is stroking {attacker.his} cock")
			
	return result

func getItemStatesAsText():
	var result = []
	if(getCharacter() != null):
		var pc = getCharacter()
		var items = pc.getInventory().getAllEquippedItems()
		for itemSlot in items:
			var item:ItemBase = items[itemSlot]
			var itemState = item.getItemState()
			if(itemState != null):
				var newText = itemState.getStateText()
				if(newText != null && newText != ""):
					result.append(newText)
	
	return result

func getAllText():
	var result = []
	result.append_array(getActivitiesAsText())
	result.append_array(getItemStatesAsText())
	return result
