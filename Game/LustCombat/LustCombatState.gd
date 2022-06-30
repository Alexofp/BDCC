extends Reference
class_name LustCombatState

var character: WeakRef
var inBattle = false
var enemyID = ""

var currentActivities = []

func getCharacter():
	if(character == null):
		return character
	return character.get_ref()

func setCharacter(newchar):
	character = weakref(newchar)

func setEnemyID(newenemyID):
	enemyID = newenemyID

func getEnemyCharacter():
	if(enemyID == null || enemyID == ""):
		return null
	return GlobalRegistry.getCharacter(enemyID)

static func myactionsorter(a, b):
	if a["priority"] > b["priority"]:
		return true
	return false

func getActionsSorted():
	var actions:Array = getActions()
	
	actions.sort_custom(self, "myactionsorter")
	
	return actions

func getOrgasmActionsSorted():
	var actions:Array = getOrgasmActions()
	
	actions.sort_custom(self, "myactionsorter")
	
	return actions

func getOrgasmActions():
	var result = []
	for actionID in GlobalRegistry.getOrgasmLustActions():
		var action = GlobalRegistry.getLustAction(actionID)
		if(action == null):
			continue
		
		result.append({id=actionID, priority=action.getPriority()})
	return result

func getActions():
	var result = []
	
#	result.append({id="GropeChest"})
#	result.append({id="GropeButt"})
#	result.append({id="RubNipples"})
#	result.append({id="StopAll"})
	for actionID in GlobalRegistry.getDefaultLustActions():
		var action = GlobalRegistry.getLustAction(actionID)
		if(action == null):
			continue
		
		result.append({id=actionID, priority=action.getPriority()})
	
	if(getCharacter() != null):
		var pc = getCharacter()
		var items = pc.getInventory().getAllEquippedItems()
		for itemSlot in items:
			var item:ItemBase = items[itemSlot]
			var newActions = item.getLustActions()
			if(newActions != null):
				for newAction in newActions:
					var action = GlobalRegistry.getLustAction(newAction)
					if(action == null):
						continue
					
					result.append({
						"id": newAction,
						"item": item.getUniqueID(),
						"itemName": item.getVisibleName(),
						"itemState": item.getItemState(),
						"priority": action.getPriority(),
					})
	
	return result
	
func isInBattle():
	return inBattle

func enteredBattle():
	inBattle = true

func exitedBattle():
	inBattle = false
	enemyID = ""
	
	resetState()

func isInPublic():
	if(getCharacter() == null || isInBattle()):
		return true
	var pc = getCharacter()
	if(!pc.has_method("isInSecludedLocation")):
		return true
	return !pc.isInSecludedLocation()

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
		return pc.isInventorySlotBlocked(invslot)
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
		if(activity == LustActivity.SpreadingPussy):
			result.append("{attacker.name}'s hand is rubbing {attacker.his} pussy")
		if(activity == LustActivity.StrokingCock):
			result.append("{attacker.name}'s hand is stroking {attacker.his} cock")
		if(activity == LustActivity.ProddingAnal):
			result.append("{attacker.name}'s fingers are prodding {attacker.his} anal ring")
			
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

func doAction(actionData):
	var lustAction = GlobalRegistry.getLustAction(actionData["id"])
	
	var result = lustAction.doAction(self, actionData)
	result["lustInterests"] = lustAction.getLustTopics()
	if(lustAction.isTease()):
		result["isTease"] = true
	
	return result

func saveData():
	return {
		"inBattle": inBattle,
		"enemyID": enemyID,
		"currentActivities": currentActivities,
	}

func loadData(data):
	inBattle = SAVE.loadVar(data, "inBattle", false)
	enemyID = SAVE.loadVar(data, "enemyID", "")
	currentActivities = SAVE.loadVar(data, "currentActivities", [])
